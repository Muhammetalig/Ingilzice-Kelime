import 'package:flutter/material.dart';
import 'snake_game.dart';
import 'memory_card_game.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Oyunlar',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          // Responsive boyutlar
          double titleFontSize = screenWidth * 0.08; // Ekran genişliğinin %8'i
          double subtitleFontSize =
              screenWidth * 0.04; // Ekran genişliğinin %4'ü
          double padding = screenWidth * 0.05; // Ekran genişliğinin %5'i
          double spacing = screenHeight * 0.02; // Ekran yüksekliğinin %2'si

          // Minimum ve maksimum boyutlar
          if (titleFontSize < 24) titleFontSize = 24;
          if (titleFontSize > 40) titleFontSize = 40;
          if (subtitleFontSize < 14) subtitleFontSize = 14;
          if (subtitleFontSize > 20) subtitleFontSize = 20;
          if (padding < 16) padding = 16;
          if (padding > 24) padding = 24;
          if (spacing < 16) spacing = 16;
          if (spacing > 24) spacing = 24;

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple.shade50, Colors.white],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Başlık
                  Text(
                    'Kelime Oyunları',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: spacing),

                  // Alt başlık
                  Text(
                    'Eğlenerek kelime öğrenin!',
                    style: TextStyle(
                      fontSize: subtitleFontSize,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: spacing * 2),

                  // Yılan Oyunu Butonu
                  _buildGameButton(
                    context,
                    '🐍',
                    'Yılan Oyunu',
                    'Bilmediklerinizi yiyerek büyüyün',
                    Colors.green,
                    Icons.games,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SnakeGame()),
                      );
                    },
                  ),

                  SizedBox(height: spacing),

                  // Hafıza Kartı Butonu
                  _buildGameButton(
                    context,
                    '🧠',
                    'Hafıza Kartı',
                    'Kelimeleri eşleştirerek öğrenin',
                    Colors.purple,
                    Icons.memory,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MemoryCardGame(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGameButton(
    BuildContext context,
    String emoji,
    String title,
    String subtitle,
    Color color,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        // Responsive boyutlar
        double buttonHeight = screenHeight * 0.1; // Ekran yüksekliğinin %10'u
        double emojiSize = screenWidth * 0.06; // Ekran genişliğinin %6'sı
        double iconSize = screenWidth * 0.06; // Ekran genişliğinin %6'sı
        double titleFontSize = screenWidth * 0.045; // Ekran genişliğinin %4.5'i
        double subtitleFontSize =
            screenWidth * 0.035; // Ekran genişliğinin %3.5'i
        double arrowIconSize = screenWidth * 0.04; // Ekran genişliğinin %4'ü
        double horizontalPadding =
            screenWidth * 0.04; // Ekran genişliğinin %4'ü
        double borderRadius = screenWidth * 0.02; // Ekran genişliğinin %2'si

        // Minimum ve maksimum boyutlar
        if (buttonHeight < 80) buttonHeight = 80;
        if (buttonHeight > 120) buttonHeight = 120;
        if (emojiSize < 24) emojiSize = 24;
        if (emojiSize > 36) emojiSize = 36;
        if (iconSize < 24) iconSize = 24;
        if (iconSize > 36) iconSize = 36;
        if (titleFontSize < 18) titleFontSize = 18;
        if (titleFontSize > 26) titleFontSize = 26;
        if (subtitleFontSize < 12) subtitleFontSize = 12;
        if (subtitleFontSize > 18) subtitleFontSize = 18;
        if (arrowIconSize < 16) arrowIconSize = 16;
        if (arrowIconSize > 24) arrowIconSize = 24;
        if (horizontalPadding < 16) horizontalPadding = 16;
        if (horizontalPadding > 24) horizontalPadding = 24;
        if (borderRadius < 10) borderRadius = 10;
        if (borderRadius > 20) borderRadius = 20;

        return Container(
          width: double.infinity,
          height: buttonHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              if (onTap != null) {
                onTap();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                children: [
                  // Emoji ve İkon
                  Row(
                    children: [
                      Text(emoji, style: TextStyle(fontSize: emojiSize)),
                      SizedBox(width: horizontalPadding * 0.5),
                      Icon(icon, size: iconSize, color: Colors.white),
                    ],
                  ),
                  SizedBox(width: horizontalPadding),

                  // Metinler
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: subtitleFontSize,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Ok ikonu
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: arrowIconSize,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
