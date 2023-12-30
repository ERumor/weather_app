import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/cities_data.dart';
import 'package:weather_app/localization/generated/locale_keys.g.dart';
import 'package:weather_app/ui/screens/home_screen.dart';
import 'package:weather_app/ui/widgets/appbar_pick_city.dart';
import 'package:weather_app/ui/widgets/gradient_background.dart';
import 'package:weather_app/utils/custom_route.dart';

class PickCityScreen extends StatefulWidget {
  const PickCityScreen({super.key});

  @override
  State<PickCityScreen> createState() => _PickCityScreenState();
}

class _PickCityScreenState extends State<PickCityScreen> {
  final TextEditingController _textController = TextEditingController();
  final _textFocusNode = FocusNode();
  final _citiesFocusNode = FocusNode();

  List<String> filteredCities = [];
  bool showCitiesList = false;

  void _searchWeather(BuildContext context) {
    final String cityName = _textController.text.trim();

    if (cityName.isNotEmpty) {
      BlocProvider.of<WeatherBloc>(context)
          .add(FetchWeather.byCityName(cityName: cityName));
      Navigator.pushReplacement(
        context,
        MyCustomRoute(
          builder: (context) => HomeScreen(
            cityName: cityName,
          ),
          settings: const RouteSettings(),
        ),
      );
    }
  }

  void _filterCities(String query) {
    filteredCities = cities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      showCitiesList = query.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _textFocusNode.dispose();
    _citiesFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _textFocusNode.unfocus();
        _citiesFocusNode.unfocus();
        setState(() {
          showCitiesList = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: const AppBarPickCity(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                const GradientBackground(),
                SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/city.png'),
                        Text(
                          LocaleKeys.Fetch_Weather_by_a_City.tr(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 26.0),
                        TextField(
                          controller: _textController,
                          focusNode: _textFocusNode,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: LocaleKeys.City_Name.tr(),
                            labelStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () => _searchWeather(context),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              showCitiesList = true;
                              filteredCities = cities;
                            });
                          },
                          onChanged: _filterCities,
                        ),
                        if (showCitiesList)
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue,
                                  Colors.deepPurple,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            constraints: const BoxConstraints(
                              maxHeight: 350,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: filteredCities
                                    .map((city) => ListTile(
                                          title: Text(
                                            city,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          onTap: () {
                                            _textController.text = city;
                                            _searchWeather(context);
                                            _textFocusNode.unfocus();
                                            setState(() {
                                              showCitiesList = false;
                                            });
                                          },
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () => _searchWeather(context),
                          child: Text(
                            LocaleKeys.Get_Weather.tr(),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
