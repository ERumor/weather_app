import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Temperature extends StatelessWidget {
  const Temperature({super.key, required this.temperature});

  final int temperature;

  @override
  Widget build(BuildContext context) {
    final locale = EasyLocalization.of(context)?.locale;

    // Проверяем, является ли язык английским
    final isEnglish = locale?.languageCode == 'en';

    // Вычисляем температуру в фаренгейтах, если выбран английский язык
    final fahrenheitTemperature = (temperature * 9 / 5 + 32).round();

    return Center(
      child: Text(
        // Используем разные отображения температур для разных языков
        isEnglish ? '$fahrenheitTemperature°F' : '$temperature°C',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 55,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
