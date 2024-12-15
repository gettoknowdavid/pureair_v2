import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:skeletonizer/skeletonizer.dart';

const fakeParameter = Parameter(value: 0);
const fakeIAQI = IAQI(
  humidity: fakeParameter,
  pressure: fakeParameter,
  temperature: fakeParameter,
  wind: fakeParameter,
);
const fakeDailyForecasts = [DailyForecast()];
const fakeForecastData = ForecastData(
  o3: fakeDailyForecasts,
  pm10: fakeDailyForecasts,
  pm25: fakeDailyForecasts,
  uvi: fakeDailyForecasts,
);
const fakeForecast = Forecast(data: fakeForecastData);
final fakeAirQuality = AirQuality(
  value: 0,
  dominantPol: BoneMock.subtitle,
  idx: 123,
  attributions: [const Attribution()],
  city: City(name: BoneMock.name),
  iaqi: fakeIAQI,
  forecast: fakeForecast,
);
