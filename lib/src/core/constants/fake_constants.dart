import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:skeletonizer/skeletonizer.dart';

const _fakeParameter = Parameter(value: 0);
const _fakeDailyForecasts = [DailyForecast()];
final fakeAirQuality = AirQuality(
  value: 0,
  dominantPol: BoneMock.subtitle,
  idx: 123,
  attributions: [const Attribution()],
  city: City(name: BoneMock.name),
  iaqi: const IAQI(
    humidity: _fakeParameter,
    pressure: _fakeParameter,
    temperature: _fakeParameter,
    wind: _fakeParameter,
  ),
  forecast: const Forecast(
    o3: _fakeDailyForecasts,
    pm10: _fakeDailyForecasts,
    pm25: _fakeDailyForecasts,
    uvi: _fakeDailyForecasts,
  ),
);
