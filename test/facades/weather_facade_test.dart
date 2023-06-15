import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/domain/errors/weather_error.dart';
import 'package:pureair_v2/infrastructure/infrastructure.dart';
import 'package:pureair_v2/infrastructure/weather_facade.dart';

import 'weather_facade_test.mocks.dart';

const expectedCurrentWeather = Weather(
  lat: 4.8472,
  lon: 6.9746,
  timezone: "Africa/Lagos",
  timezoneOffset: 3600,
  current: WeatherData(
    dateTime: 1686830043,
    sunrise: 1686806433,
    sunset: 1686851073,
    temp: 300.24,
    feelsLike: 303.39,
    pressure: 1015,
    humidity: 83,
    dewPoint: 297.1,
    uvi: 8.85,
    clouds: 75,
    visibility: 10000,
    windSpeed: 2.57,
    windDeg: 230,
    rain: Rain(the1H: 1.24),
    weatherInfo: [
      WeatherInfo(
        id: 211,
        main: "Thunderstorm",
        description: "thunderstorm",
        icon: "11d",
      ),
      WeatherInfo(
        id: 501,
        main: "Rain",
        description: "moderate rain",
        icon: "10d",
      ),
    ],
  ),
);

@GenerateNiceMocks([
  MockSpec<WeatherRemoteDatasource>(),
  MockSpec<WeatherMapper>(),
])
void main() {
  late IWeatherFacade weatherFacade;
  late WeatherRemoteDatasource mockWeatherRemoteDatasource;
  late WeatherMapper mockWeatherMapper;

  setUp(() {
    mockWeatherMapper = MockWeatherMapper();
    mockWeatherRemoteDatasource = MockWeatherRemoteDatasource();
    weatherFacade = WeatherFacade(mockWeatherRemoteDatasource);
  });

  group('getCurrent', () {
    test('should return Weather when the request is successful', () async {
      // Arrange
      final expectedDto = mockWeatherMapper.fromDomain(expectedCurrentWeather);
      when(mockWeatherRemoteDatasource.getWeather(lat: 1, lon: 2))
          .thenAnswer((_) => Future.value(expectedDto));

      // Act
      final result = await weatherFacade.getCurrent(lat: 1, lon: 2);

      // Assert
      expect(
        result,
        isA<Right<WeatherError, Weather>>().having(
          (e) => e.value,
          '',
          equals(expectedCurrentWeather),
        ),
      );
    });
  });
}
