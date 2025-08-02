import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:nextcast/Models/weather_model.dart';

class WeatherService {
  final String apiKey = '52d7ed7ad9cc460582d155843252507';
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      bool opened = await Geolocator.openLocationSettings();
      if (!opened) {
        throw Exception('Could not open location settings.');
      }
      while (!await Geolocator.isLocationServiceEnabled()) {
        await Future.delayed(const Duration(seconds: 1));
      }
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        throw Exception('Location permission denied.');
      }
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
  }

  Future<WeatherForecastModel> getWeather() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      throw Exception("No internet connection. Please check your network.");
    }
    final position = await getCurrentLocation();

    final url = Uri.parse(
      'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=${position.latitude},${position.longitude}&days=4',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherForecastModel.fromJson(json);
    } else {
      throw Exception('Failed to fetch weather forecast');
    }
  }
}
