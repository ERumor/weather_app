// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "Select_Language": "Select Language",
  "Russian": "Russian",
  "English": "English",
  "Temp_Max": "Temp Max",
  "Temp_Min": "Temp Min",
  "Sunrise": "Sunrise",
  "Sunset": "Sunset",
  "City": "City",
  "Clear": "Clear",
  "Clouds": "Clouds",
  "Rain": "Rain",
  "Snow": "Snow",
  "Thunderstorm": "Thunderstorm",
  "Drizzle": "Drizzle",
  "Mist": "Mist",
  "Smoke": "Smoke",
  "Haze": "Haze",
  "Dust": "Dust",
  "Fog": "Fog",
  "Sand": "Sand",
  "Ash": "Ash",
  "Squall": "Squall",
  "Tornado": "Tornado",
  "Language_switched": "Language switched to English",
  "Language_already_selected": "Language already selected: English",
  "Fetch_Weather_by_a_City": "Fetch Weather by a City",
  "City_Name": "City Name",
  "Get_Weather": "Get Weather"
};
static const Map<String,dynamic> ru = {
  "Select_Language": "Выберите язык",
  "Russian": "Русский",
  "English": "Английский",
  "Temp_Max": "Макс Темп",
  "Temp_Min": "Мин Темп",
  "Sunrise": "Восход",
  "Sunset": "Закат",
  "City": "Город",
  "Clear": "Солнечно",
  "Clouds": "Облачно",
  "Rain": "Дождь",
  "Snow": "Снег",
  "Thunderstorm": "Гроза",
  "Drizzle": "Морось",
  "Mist": "Туман",
  "Smoke": "Дым",
  "Haze": "Дымка",
  "Dust": "Пыльно",
  "Fog": "Туманность",
  "Sand": "Песчано",
  "Ash": "Пепел",
  "Squall": "Шквал",
  "Tornado": "Торнадо",
  "Language_switched": "Язык переключен на Русский",
  "Language_already_selected": "Язык уже выбран: Русский",
  "Fetch_Weather_by_a_City": "Поиск погоды по городу",
  "City_Name": "Название Города",
  "Get_Weather": "Узнать погоду"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
