import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:math';
import 'a1.dart';
import 'a2.dart';
import 'b1.dart';
import 'b2.dart';

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> with TickerProviderStateMixin {
  static const int gridSize = 15;
  static const double cellSize = 25.0;

  List<Point> snake = [];
  List<Point> foods = [];
  Direction direction = Direction.right;
  Timer? gameTimer;
  bool isGameRunning = false;
  int score = 0;
  int highScore = 0;

  // Kelime sistemi
  List<Map<String, String>> allWords = [];
  List<Map<String, String>> unknownWords = [];
  Map<String, String> currentWord = {};
  List<String> currentOptions = [];
  String correctAnswer = '';

  // Renk sistemi
  List<Color> foodColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];
  Map<String, Color> optionColors = {};
  Color correctFoodColor = Colors.red;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _loadWords();
    _loadHighScore();
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadWords() async {
    // Tüm kelimeleri yükle
    allWords = [
      ...A1Page.words,
      ...A2Page.words,
      ...B1Page.words,
      ...B2Page.words,
    ];

    // Bilmediklerim kelimelerini yükle
    final prefs = await SharedPreferences.getInstance();
    final a1Unknown = prefs.getStringList('a1_unknown') ?? [];
    final a2Unknown = prefs.getStringList('a2_unknown') ?? [];
    final b1Unknown = prefs.getStringList('b1_unknown') ?? [];
    final b2Unknown = prefs.getStringList('b2_unknown') ?? [];

    Set<String> allUnknownWords = {
      ...a1Unknown,
      ...a2Unknown,
      ...b1Unknown,
      ...b2Unknown,
    };

    unknownWords = allWords
        .where((word) => allUnknownWords.contains(word['en']))
        .toList();

    // Eğer bilmediklerim listesi boşsa, tüm kelimeleri kullan
    if (unknownWords.isEmpty) {
      unknownWords = allWords;
    }

    _generateNewWord();
  }

  Future<void> _loadHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      highScore = prefs.getInt('snake_high_score') ?? 0;
    });
  }

  Future<void> _saveHighScore() async {
    if (score > highScore) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('snake_high_score', score);
      setState(() {
        highScore = score;
      });
    }
  }

  void _generateNewWord() {
    if (unknownWords.isEmpty) return;

    final random = Random();
    currentWord = unknownWords[random.nextInt(unknownWords.length)];
    correctAnswer = currentWord['tr']!;

    // Yanlış seçenekler oluştur
    List<String> wrongOptions = [];
    while (wrongOptions.length < 3) {
      final randomWord = allWords[random.nextInt(allWords.length)];
      if (randomWord['tr'] != correctAnswer &&
          !wrongOptions.contains(randomWord['tr'])) {
        wrongOptions.add(randomWord['tr']!);
      }
    }

    currentOptions = [...wrongOptions, correctAnswer];
    currentOptions.shuffle();

    // Her seçeneğe renk ata
    optionColors.clear();
    for (int i = 0; i < currentOptions.length; i++) {
      optionColors[currentOptions[i]] = foodColors[i];
    }

    // Doğru cevabın rengini belirle
    correctFoodColor = optionColors[correctAnswer]!;
  }

  void _startGame() {
    setState(() {
      snake = [Point(gridSize ~/ 2, gridSize ~/ 2)];
      direction = Direction.right;
      score = 0;
      isGameRunning = true;
    });

    _generateNewWord();
    _generateNewFoods();

    gameTimer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (isGameRunning) {
        _moveSnake();
      }
    });
  }

  void _pauseGame() {
    setState(() {
      isGameRunning = false;
    });
    gameTimer?.cancel();
  }

  void _resumeGame() {
    setState(() {
      isGameRunning = true;
    });

    gameTimer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (isGameRunning) {
        _moveSnake();
      }
    });
  }

  void _moveSnake() {
    setState(() {
      Point head = snake.first;
      Point newHead;

      switch (direction) {
        case Direction.up:
          newHead = Point(head.x, head.y - 1);
          break;
        case Direction.down:
          newHead = Point(head.x, head.y + 1);
          break;
        case Direction.left:
          newHead = Point(head.x - 1, head.y);
          break;
        case Direction.right:
          newHead = Point(head.x + 1, head.y);
          break;
      }

      // Sınırları kontrol et - diğer taraftan çık
      if (newHead.x < 0) {
        newHead = Point(gridSize - 1, newHead.y);
      } else if (newHead.x >= gridSize) {
        newHead = Point(0, newHead.y);
      }

      if (newHead.y < 0) {
        newHead = Point(newHead.x, gridSize - 1);
      } else if (newHead.y >= gridSize) {
        newHead = Point(newHead.x, 0);
      }

      // Kendine çarptı mı kontrol et
      if (snake.contains(newHead)) {
        _gameOver();
        return;
      }

      snake.insert(0, newHead);

      // Yemi yedi mi kontrol et
      bool foodEaten = false;
      for (int i = 0; i < foods.length; i++) {
        if (newHead == foods[i]) {
          // Doğru renkteki elmayı yedi mi kontrol et
          if (i == foodColors.indexOf(correctFoodColor)) {
            _onFoodEaten();
            foodEaten = true;
            break;
          } else {
            // Yanlış elmayı yedi - oyun biter
            _gameOver();
            return;
          }
        }
      }

      if (!foodEaten) {
        snake.removeLast();
      }
    });
  }

  void _generateNewFoods() {
    final random = Random();
    foods.clear();

    // Boş alanları bul
    List<Point> availablePositions = [];
    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        Point pos = Point(x, y);
        if (!snake.contains(pos)) {
          availablePositions.add(pos);
        }
      }
    }

    // Eğer yeterli boş alan yoksa, oyun alanını temizle
    if (availablePositions.length < 4) {
      setState(() {
        snake = [Point(gridSize ~/ 2, gridSize ~/ 2)];
        direction = Direction.right;
      });
      // Boş alanları yeniden hesapla
      availablePositions.clear();
      for (int x = 0; x < gridSize; x++) {
        for (int y = 0; y < gridSize; y++) {
          Point pos = Point(x, y);
          if (!snake.contains(pos)) {
            availablePositions.add(pos);
          }
        }
      }
    }

    // 4 farklı renkte elma oluştur
    for (int i = 0; i < 4 && availablePositions.isNotEmpty; i++) {
      // Rastgele bir boş pozisyon seç
      int randomIndex = random.nextInt(availablePositions.length);
      Point newFood = availablePositions[randomIndex];

      // Koordinatları kontrol et - grid sınırları içinde olmalı
      if (newFood.x >= 0 &&
          newFood.x < gridSize &&
          newFood.y >= 0 &&
          newFood.y < gridSize) {
        foods.add(newFood);
        print('Elma $i eklendi: (${newFood.x}, ${newFood.y})');
      } else {
        print(
          'Geçersiz elma koordinatı: (${newFood.x}, ${newFood.y}) - Grid: $gridSize',
        );
        // Geçersiz koordinat varsa, güvenli bir pozisyon seç
        Point safeFood = Point(
          random.nextInt(gridSize),
          random.nextInt(gridSize),
        );
        foods.add(safeFood);
        print('Güvenli elma $i eklendi: (${safeFood.x}, ${safeFood.y})');
      }

      // Seçilen pozisyonu listeden çıkar
      availablePositions.removeAt(randomIndex);
    }
  }

  void _gameOver() {
    setState(() {
      isGameRunning = false;
    });
    gameTimer?.cancel();
    _saveHighScore();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Oyun Bitti!'),
        content: Text('Skorunuz: $score\nEn Yüksek Skor: $highScore'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _startGame();
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
      ),
    );
  }

  void _changeDirection(Direction newDirection) {
    if (!isGameRunning) return;

    // Ters yöne gitmeyi engelle
    if ((direction == Direction.up && newDirection == Direction.down) ||
        (direction == Direction.down && newDirection == Direction.up) ||
        (direction == Direction.left && newDirection == Direction.right) ||
        (direction == Direction.right && newDirection == Direction.left)) {
      return;
    }

    setState(() {
      direction = newDirection;
    });
  }

  bool _checkAnswer(String selectedAnswer) {
    if (selectedAnswer == correctAnswer) {
      setState(() {
        score += 5;
      });
      _generateNewWord();
      return true;
    }
    return false;
  }

  void _onFoodEaten() {
    // Yemi yediğinde doğru cevabı kontrol et
    setState(() {
      score += 10;
    });
    _generateNewFoods();
    _generateNewWord();
    _animationController.forward().then((_) => _animationController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🐍 Yılan Oyunu'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(isGameRunning ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              if (isGameRunning) {
                _pauseGame();
              } else {
                _resumeGame();
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade50, Colors.white],
          ),
        ),
        child: Column(
          children: [
            // Skor ve kelime bilgisi - aynı hizada
            LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                double screenHeight = constraints.maxHeight;

                // Responsive boyutlar
                double containerHeight =
                    screenHeight * 0.12; // Ekran yüksekliğinin %12'si
                double scoreFontSize =
                    screenWidth * 0.04; // Ekran genişliğinin %4'ü
                double highScoreFontSize =
                    screenWidth * 0.035; // Ekran genişliğinin %3.5'i
                double wordFontSize =
                    screenWidth * 0.045; // Ekran genişliğinin %4.5'i
                double subtitleFontSize =
                    screenWidth * 0.035; // Ekran genişliğinin %3.5'i
                double padding = screenWidth * 0.04; // Ekran genişliğinin %4'ü

                // Minimum ve maksimum boyutlar
                if (containerHeight < 80) containerHeight = 80;
                if (containerHeight > 120) containerHeight = 120;
                if (scoreFontSize < 16) scoreFontSize = 16;
                if (scoreFontSize > 22) scoreFontSize = 22;
                if (highScoreFontSize < 12) highScoreFontSize = 12;
                if (highScoreFontSize > 18) highScoreFontSize = 18;
                if (wordFontSize < 16) wordFontSize = 16;
                if (wordFontSize > 24) wordFontSize = 24;
                if (subtitleFontSize < 12) subtitleFontSize = 12;
                if (subtitleFontSize > 18) subtitleFontSize = 18;
                if (padding < 12) padding = 12;
                if (padding > 20) padding = 20;

                return Container(
                  padding: EdgeInsets.all(padding),
                  height: containerHeight,
                  child: Stack(
                    children: [
                      // Sol taraf - Skor
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Skor: $score',
                              style: TextStyle(
                                fontSize: scoreFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'En Yüksek: $highScore',
                              style: TextStyle(
                                fontSize: highScoreFontSize,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Tam ortada - İngilizce kelime
                      if (currentWord.isNotEmpty)
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: padding,
                                vertical: padding * 0.5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    currentWord['en']!,
                                    style: TextStyle(
                                      fontSize: wordFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    'anlamını bul!',
                                    style: TextStyle(
                                      fontSize: subtitleFontSize,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),

            // Oyun alanı
            Expanded(
              child: Center(
                child: Container(
                  width: gridSize * cellSize,
                  height: gridSize * cellSize,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 3),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green.shade50,
                  ),
                  child: CustomPaint(
                    painter: SnakePainter(
                      snake: snake,
                      foods: foods,
                      cellSize: cellSize,
                      foodColors: foodColors,
                    ),
                  ),
                ),
              ),
            ),

            // Kelime seçenekleri
            if (currentOptions.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Doğru anlamın rengindeki elmayı ye!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: currentOptions.map((option) {
                        Color buttonColor = optionColors[option] ?? Colors.grey;
                        return Container(
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: buttonColor.withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Text(
                              option,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

            // Kontrol butonları
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Üst buton
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _changeDirection(Direction.up),
                        icon: const Icon(Icons.keyboard_arrow_up),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                        ),
                      ),
                    ],
                  ),
                  // Orta butonlar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _changeDirection(Direction.left),
                        icon: const Icon(Icons.keyboard_arrow_left),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: () => _changeDirection(Direction.right),
                        icon: const Icon(Icons.keyboard_arrow_right),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                        ),
                      ),
                    ],
                  ),
                  // Alt buton
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _changeDirection(Direction.down),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Başlat/Durdur butonu
                  ElevatedButton(
                    onPressed: () {
                      if (snake.isEmpty) {
                        _startGame();
                      } else {
                        if (isGameRunning) {
                          _pauseGame();
                        } else {
                          _resumeGame();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: Text(
                      snake.isEmpty
                          ? 'Oyunu Başlat'
                          : (isGameRunning ? 'Durdur' : 'Devam Et'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Direction { up, down, left, right }

class Point {
  final int x;
  final int y;

  Point(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

class SnakePainter extends CustomPainter {
  final List<Point> snake;
  final List<Point> foods;
  final double cellSize;
  final List<Color> foodColors;

  SnakePainter({
    required this.snake,
    required this.foods,
    required this.cellSize,
    required this.foodColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // 4 farklı renkte elma çiz
    for (int i = 0; i < foods.length && i < foodColors.length; i++) {
      paint.color = foodColors[i];

      // Koordinatları hesapla ve sınırları kontrol et
      double x = foods[i].x * cellSize + cellSize / 2;
      double y = foods[i].y * cellSize + cellSize / 2;

      // Elmanın oyun alanının dışına çıkmasını engelle
      if (x >= 0 && x < size.width && y >= 0 && y < size.height) {
        canvas.drawCircle(Offset(x, y), cellSize / 2.5, paint);
      } else {
        print(
          'Elma $i alanın dışında: ($x, $y) - Canvas: ${size.width}x${size.height}',
        );
      }
    }

    // Yılanı çiz
    for (int i = 0; i < snake.length; i++) {
      final point = snake[i];
      final rect = Rect.fromLTWH(
        point.x * cellSize + 1,
        point.y * cellSize + 1,
        cellSize - 2,
        cellSize - 2,
      );

      // Baş için farklı renk
      if (i == 0) {
        paint.color = Colors.green.shade800;
      } else {
        paint.color = Colors.green;
      }

      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(6)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
