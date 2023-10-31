import 'package:tenis_club/data/model/weather_model.dart';

ListElement? findWeatherByDateAndTimeRange(
    Weather weather, DateTime targetDate, String timeRange) {
  List<ListElement> elements = [];
  ListElement weatherElement = ListElement();
  weather.list?.forEach((item) {
    if (item.dtTxt?.day == targetDate.day &&
        item.dtTxt?.month == targetDate.month &&
        item.dtTxt?.year == targetDate.year) {
      elements.add(item);
    }
  });

  List<String> times = timeRange.split('-');

  if (times.length == 2) {
    String startTime = times[0]; // Obtiene la primera hora
    DateTime targetDateTime = DateTime(2023, 10, 31,
        int.parse(startTime.split(':')[0]), int.parse(startTime.split(':')[1]));

    for (var element in elements) {
      if (element.dtTxt?.hour == targetDateTime.hour) {
        weatherElement = element;
        return weatherElement;
      }
      
    }
  }

  return weatherElement;
}
