import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/localization/generated/locale_keys.g.dart';

class Sunset extends StatelessWidget {
  const Sunset({super.key, required this.sunset});

  final DateTime sunset;

  @override
  Widget build(BuildContext context) {
    final isRussian = EasyLocalization.of(context)?.locale.languageCode == 'ru';

    return Row(
      children: [
        Image.asset(
          'assets/images/12.png',
          scale: 8,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.Sunset.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              DateFormat(isRussian ? 'HH:mm' : 'jm').format(sunset),
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
