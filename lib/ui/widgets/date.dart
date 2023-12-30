import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Date extends StatelessWidget {
  const Date({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final isRussian = EasyLocalization.of(context)?.locale.languageCode == 'ru';

    final now = DateTime.now();
    final dateFormat = DateFormat(
        isRussian ? "EEEE, dd • HH:mm" : "EEEE, dd • hh:mm a",
        isRussian ? 'ru_RU' : 'en_US');
    final formattedDate = dateFormat.format(now);

    return Center(
      child: Text(
        formattedDate,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
