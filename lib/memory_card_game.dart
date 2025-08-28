import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'dart:async';
import 'a1.dart';
import 'a2.dart';
import 'b1.dart';
import 'b2.dart';

class MemoryCardGame extends StatefulWidget {
  const MemoryCardGame({Key? key}) : super(key: key);

  @override
  _MemoryCardGameState createState() => _MemoryCardGameState();
}

class _MemoryCardGameState extends State<MemoryCardGame>
    with TickerProviderStateMixin {
  List<MemoryCard> cards = [];
  MemoryCard? firstCard;
  MemoryCard? secondCard;
  bool canFlip = true;
  int score = 0;
  int highScore = 0;
  int moves = 0;
  bool gameCompleted = false;
  Timer? timer;
  int elapsedTime = 0;
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
    _loadHighScore();
    _initializeGame();
  }

  @override
  void dispose() {
    _flipController.dispose();
    timer?.cancel();
    super.dispose();
  }

  Future<void> _loadHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      highScore = prefs.getInt('memory_high_score') ?? 0;
    });
  }

  Future<void> _saveHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('memory_high_score', highScore);
  }

  Future<void> _initializeGame() async {
    // Tüm bilinmeyen kelimeleri topla
    List<Map<String, String>> allUnknownWords = [];

    // A1'den bilinmeyen kelimeler
    final prefs = await SharedPreferences.getInstance();
    List<String> a1Unknown = prefs.getStringList('a1_unknown') ?? [];
    for (String word in a1Unknown) {
      // A1 kelime listesinden anlamını bul
      for (Map<String, String> wordPair in A1Page.words) {
        if (wordPair['en'] == word) {
          allUnknownWords.add(wordPair);
          break;
        }
      }
    }

    // A2'den bilinmeyen kelimeler
    List<String> a2Unknown = prefs.getStringList('a2_unknown') ?? [];
    for (String word in a2Unknown) {
      for (Map<String, String> wordPair in A2Page.words) {
        if (wordPair['en'] == word) {
          allUnknownWords.add(wordPair);
          break;
        }
      }
    }

    // B1'den bilinmeyen kelimeler
    List<String> b1Unknown = prefs.getStringList('b1_unknown') ?? [];
    for (String word in b1Unknown) {
      for (Map<String, String> wordPair in B1Page.words) {
        if (wordPair['en'] == word) {
          allUnknownWords.add(wordPair);
          break;
        }
      }
    }

    // B2'den bilinmeyen kelimeler
    List<String> b2Unknown = prefs.getStringList('b2_unknown') ?? [];
    for (String word in b2Unknown) {
      for (Map<String, String> wordPair in B2Page.words) {
        if (wordPair['en'] == word) {
          allUnknownWords.add(wordPair);
          break;
        }
      }
    }

    // Kelime sayısını hesapla (4x4 grid = 8 çift = 16 kart)
    int requiredPairs = 8;

    List<Map<String, String>> selectedWords = [];

    if (allUnknownWords.length < requiredPairs) {
      // Az kelime: Aynı kelimeleri tekrarla
      while (selectedWords.length < requiredPairs) {
        for (Map<String, String> word in allUnknownWords) {
          if (selectedWords.length < requiredPairs) {
            selectedWords.add(word);
          } else {
            break;
          }
        }
      }
    } else if (allUnknownWords.length > requiredPairs) {
      // Fazla kelime: Rastgele seç
      allUnknownWords.shuffle();
      selectedWords = allUnknownWords.take(requiredPairs).toList();
    } else {
      // Tam kelime: Hepsini kullan
      selectedWords = allUnknownWords;
    }

    // Kartları oluştur
    cards.clear();
    for (Map<String, String> word in selectedWords) {
      // İngilizce kelime kartı
      cards.add(
        MemoryCard(
          id: '${word['en']}_en',
          text: word['en']!,
          isEnglish: true,
          wordPair: word,
        ),
      );
      // Türkçe anlam kartı
      cards.add(
        MemoryCard(
          id: '${word['en']}_tr',
          text: word['tr']!,
          isEnglish: false,
          wordPair: word,
        ),
      );
    }

    // Kartları karıştır
    cards.shuffle();

    setState(() {
      score = 0;
      moves = 0;
      elapsedTime = 0;
      gameCompleted = false;
      firstCard = null;
      secondCard = null;
      canFlip = true;
    });

    // Zamanlayıcıyı başlat
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!gameCompleted) {
        setState(() {
          elapsedTime++;
        });
      }
    });
  }

  void _flipCard(MemoryCard card) {
    if (!canFlip || card.isFlipped || card.isMatched) return;

    setState(() {
      card.isFlipped = true;
      _flipController.forward();
    });

    if (firstCard == null) {
      firstCard = card;
    } else {
      secondCard = card;
      canFlip = false;
      moves++;

      // Eşleşme kontrolü - sadece İngilizce ile Türkçe eşleşmeli
      if (firstCard!.wordPair == secondCard!.wordPair &&
          firstCard!.isEnglish != secondCard!.isEnglish) {
        // Eşleşme! (İngilizce kelime ile Türkçe anlamı)
        setState(() {
          firstCard!.isMatched = true;
          secondCard!.isMatched = true;
          score += 10;
        });

        // Oyun tamamlandı mı kontrol et
        if (cards.every((card) => card.isMatched)) {
          _gameCompleted();
        } else {
          // Devam et
          firstCard = null;
          secondCard = null;
          canFlip = true;
        }
      } else {
        // Eşleşme yok, kartları geri çevir
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) {
            setState(() {
              firstCard!.isFlipped = false;
              secondCard!.isFlipped = false;
              firstCard = null;
              secondCard = null;
              canFlip = true;
            });
          }
        });
      }
    }
  }

  void _gameCompleted() {
    setState(() {
      gameCompleted = true;
    });
    timer?.cancel();

    // Yüksek skor kontrolü
    if (score > highScore) {
      setState(() {
        highScore = score;
      });
      _saveHighScore();
    }

    // Tebrik mesajı
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tebrikler! 🎉'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Oyunu tamamladın!'),
              const SizedBox(height: 8),
              Text('Skor: $score'),
              Text('Hamle: $moves'),
              Text(
                'Süre: ${elapsedTime ~/ 60}:${(elapsedTime % 60).toString().padLeft(2, '0')}',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _initializeGame();
              },
              child: const Text('Tekrar Oyna'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Ana Menü'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hafıza Kartı'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Skor ve bilgi paneli
          LayoutBuilder(
            builder: (context, constraints) {
              double screenWidth = constraints.maxWidth;
              double fontSize = screenWidth * 0.04; // Ekran genişliğinin %4'ü
              double smallFontSize =
                  screenWidth * 0.035; // Ekran genişliğinin %3.5'i

              // Minimum ve maksimum font boyutları
              if (fontSize < 14) fontSize = 14;
              if (fontSize > 20) fontSize = 20;
              if (smallFontSize < 12) smallFontSize = 12;
              if (smallFontSize > 16) smallFontSize = 16;

              return Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Skor: $score',
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'En Yüksek: $highScore',
                          style: TextStyle(
                            fontSize: smallFontSize,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hamle: $moves',
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Süre: ${elapsedTime ~/ 60}:${(elapsedTime % 60).toString().padLeft(2, '0')}',
                          style: TextStyle(
                            fontSize: smallFontSize,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),

          // Oyun alanı
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Ekran boyutuna göre grid ayarları
                double screenWidth = constraints.maxWidth;
                double screenHeight = constraints.maxHeight;

                // Küçük ekranlar için 3x4, büyük ekranlar için 4x4
                int crossAxisCount = screenWidth < 400 ? 3 : 4;

                // Kart boyutunu hesapla
                double availableWidth = screenWidth - 32; // padding çıkar
                double availableHeight = screenHeight - 32;

                double cardWidth =
                    (availableWidth - (crossAxisCount - 1) * 8) /
                    crossAxisCount;
                double cardHeight = cardWidth * 1.2; // Kart oranı

                // Eğer kartlar çok büyükse, boyutu sınırla
                if (cardHeight > availableHeight / 4) {
                  cardHeight = availableHeight / 4;
                  cardWidth = cardHeight / 1.2;
                }

                // Eğer kartlar çok küçükse, minimum boyut
                if (cardWidth < 60) {
                  cardWidth = 60;
                  cardHeight = 72;
                }

                return Container(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: cardWidth / cardHeight,
                    ),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return _buildCard(cards[index]);
                    },
                  ),
                );
              },
            ),
          ),

          // Yeniden başlat butonu
          LayoutBuilder(
            builder: (context, constraints) {
              double screenWidth = constraints.maxWidth;
              double buttonHeight =
                  screenWidth * 0.12; // Ekran genişliğinin %12'si
              double fontSize = screenWidth * 0.04; // Ekran genişliğinin %4'ü

              // Minimum ve maksimum boyutlar
              if (buttonHeight < 50) buttonHeight = 50;
              if (buttonHeight > 70) buttonHeight = 70;
              if (fontSize < 16) fontSize = 16;
              if (fontSize > 20) fontSize = 20;

              return Container(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: _initializeGame,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Yeniden Başlat',
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(MemoryCard card) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Kart boyutuna göre font boyutunu ayarla
        double cardSize = constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth
            : constraints.maxHeight;

        double fontSize = cardSize * 0.15; // Kart boyutunun %15'i
        double iconSize = cardSize * 0.4; // Kart boyutunun %40'ı

        // Minimum ve maksimum font boyutları
        if (fontSize < 10) fontSize = 10;
        if (fontSize > 18) fontSize = 18;

        // Minimum ve maksimum ikon boyutları
        if (iconSize < 20) iconSize = 20;
        if (iconSize > 40) iconSize = 40;

        return GestureDetector(
          onTap: () => _flipCard(card),
          child: AnimatedBuilder(
            animation: _flipAnimation,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(card.isFlipped ? 0 : 3.14159),
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: card.isMatched
                        ? Colors.green.shade100
                        : card.isFlipped
                        ? Colors.white
                        : Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: card.isMatched
                          ? Colors.green
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: card.isFlipped || card.isMatched
                        ? Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              card.text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: card.isMatched
                                    ? Colors.green.shade800
                                    : Colors.black,
                              ),
                            ),
                          )
                        : Icon(
                            Icons.question_mark,
                            color: Colors.white,
                            size: iconSize,
                          ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class MemoryCard {
  final String id;
  final String text;
  final bool isEnglish;
  final Map<String, String> wordPair;
  bool isFlipped = false;
  bool isMatched = false;

  MemoryCard({
    required this.id,
    required this.text,
    required this.isEnglish,
    required this.wordPair,
  });
}
