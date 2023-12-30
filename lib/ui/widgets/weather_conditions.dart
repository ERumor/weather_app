import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:weather_app/localization/generated/locale_keys.g.dart';

class WeatherConditions extends StatelessWidget {
  const WeatherConditions({super.key, required this.weatherMain});

  final String weatherMain;

  @override
  Widget build(BuildContext context) {
    String conditionText;

    if (EasyLocalization.of(context)?.locale == const Locale('ru')) {
      switch (weatherMain) {
        case 'Clear':
          conditionText = LocaleKeys.Clear.tr();
          break;
        case 'Clouds':
          conditionText = LocaleKeys.Clouds.tr();
          break;
        case 'Rain':
          conditionText = LocaleKeys.Rain.tr();
          break;
        case 'Snow':
          conditionText = LocaleKeys.Snow.tr();
          break;
        default:
          conditionText = weatherMain;
      }
    } else {
      conditionText = weatherMain;
    }

    return Center(
      child: Text(
        conditionText.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
