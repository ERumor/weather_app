import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather_app/localization/generated/locale_keys.g.dart';

class MaxTemperature extends StatelessWidget {
  const MaxTemperature({super.key, required this.temperature});

  final int temperature;

  @override
  Widget build(BuildContext context) {
    final isEnglish = EasyLocalization.of(context)?.locale.languageCode == 'en';

    final convertedTemperature =
        isEnglish ? ((temperature * 9 / 5) + 32).round() : temperature;

    return Row(
      children: [
        Image.asset(
          'assets/images/13.png',
          scale: 8,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.Temp_Max.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              '$convertedTemperature ${isEnglish ? "°F" : "°C"}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
