import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcast/Models/weather_model.dart';
import 'package:nextcast/Services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;

  WeatherCubit(this.weatherService) : super(WeatherInitial());

  Future<void> fetchWeather() async {
    emit(WeatherLoading());
    try {
      final weather = await weatherService.getWeather();
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
