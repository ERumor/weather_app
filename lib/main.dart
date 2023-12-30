import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:weather_app/ui/screens/home_screen.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/services/geolocation_service.dart';
import 'package:weather_app/localization/generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      path:
          'lib/localization/langs', // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: GeolocationService().determinePosition(),
          builder: (context, snap) {
            if (snap.hasData) {
              BlocProvider.of<WeatherBloc>(context).add(
                FetchWeather.byLocation(position: snap.data!),
              );
              return const HomeScreen(
                cityName: '',
              );
            } else if (snap.hasError) {
              return const Scaffold(
                body: Center(
                  child: Text('Error getting location'),
                ),
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
