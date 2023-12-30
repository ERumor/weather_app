import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:weather_app/localization/generated/locale_keys.g.dart';
import 'package:weather_app/ui/screens/home_screen.dart';
import 'package:weather_app/ui/screens/pick_city_screen.dart';
import 'package:weather_app/utils/custom_route.dart';

class AppBarPickCity extends StatefulWidget implements PreferredSizeWidget {
  const AppBarPickCity({super.key});

  @override
  State<AppBarPickCity> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

class _MyAppBarState extends State<AppBarPickCity> {
  //Notifications
  void _showLanguageSwitched(String translation) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          translation,
        ),
        backgroundColor: Colors.deepPurple,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showAlreadySelected() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          LocaleKeys.Language_already_selected.tr(),
        ),
        backgroundColor: Colors.deepPurple,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _switchToRussian(BuildContext context) {
    if (context.locale == const Locale('ru')) {
      _showAlreadySelected();
      Navigator.pop(context);
    } else {
      Navigator.pop(context); // Close the AlertDialog

      final currentContext = context;
      Future.delayed(const Duration(milliseconds: 145)).then((_) {
        currentContext.setLocale(const Locale('ru')).then((value) {
          String translation = 'Язык переключен на Русский';
          _showLanguageSwitched(translation);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PickCityScreen(key: UniqueKey()),
            ),
          );
        });
      });
    }
  }

  void _switchToEnglish(BuildContext context) {
    if (context.locale == const Locale('en')) {
      _showAlreadySelected();
      Navigator.pop(context);
    } else {
      Navigator.pop(context); // Close the AlertDialog

      final currentContext = context;
      Future.delayed(const Duration(milliseconds: 145)).then((_) {
        currentContext.setLocale(const Locale('en')).then((value) {
          String translation = 'Language switched to English';
          _showLanguageSwitched(translation);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PickCityScreen(key: UniqueKey()),
            ),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight + 20,
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      leading: IconButton(
        icon: const Icon(
          size: 30,
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MyCustomRoute(
                builder: (context) => const HomeScreen(
                      cityName: '',
                    ),
                settings: const RouteSettings()),
          );
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              // Localization button
              IconButton(
                icon: const Icon(
                  size: 30,
                  Icons.language,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(LocaleKeys.Select_Language.tr()),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text(LocaleKeys.Russian.tr()),
                              onTap: () {
                                _switchToRussian(context);
                              },
                            ),
                            ListTile(
                              title: Text(LocaleKeys.English.tr()),
                              onTap: () {
                                _switchToEnglish(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              //to HomeScreen
              IconButton(
                icon: const Icon(
                  size: 30,
                  Icons.wb_sunny_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MyCustomRoute(
                        builder: (context) => const HomeScreen(
                              cityName: '',
                            ),
                        settings: const RouteSettings()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
