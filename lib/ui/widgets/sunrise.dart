import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/localization/generated/locale_keys.g.dart';

class Sunrise extends StatelessWidget {
  const Sunrise({super.key, required this.sunrise});

  final DateTime sunrise;

  @override
  Widget build(BuildContext context) {
    final isRussian = EasyLocalization.of(context)?.locale.languageCode == 'ru';

    return Row(
      children: [
        Image.asset(
          'assets/images/11.png',
          scale: 8,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.Sunrise.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              DateFormat(isRussian ? 'HH:mm' : 'jm').format(sunrise),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        )
      ],
    );
  }
}
