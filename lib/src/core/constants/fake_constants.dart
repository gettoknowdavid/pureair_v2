import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:skeletonizer/skeletonizer.dart';

const fakeParameter = Parameter(value: 0);
const fakeIAQI = IAqi(
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
final fakeCity = City(name: BoneMock.name);
final fakeAirQuality = AirQuality(
  value: 0,
  dominantPol: BoneMock.subtitle,
  idx: 123,
  attributions: [const Attribution()],
  city: fakeCity,
  iaqi: fakeIAQI,
  forecast: fakeForecast,
);
final fakeStation = Station(lat: 1, lon: 1, uid: 1, aqi: '0', city: fakeCity);

final fakeSearchData = SearchData(uid: 0, aqi: '0', station: fakeCity);
final List<SearchData> fakeSearchList = List.generate(3, (_) => fakeSearchData);
final List<AirQuality> fakeCities = List.generate(5, (_) => fakeAirQuality);
final List<City> fakeStations = List.generate(5, (_) => fakeCity);
