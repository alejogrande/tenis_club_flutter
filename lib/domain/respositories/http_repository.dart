import 'package:http/http.dart' as http;
import 'package:tenis_club/data/model/weather_model.dart';

class HttpService {
  

  factory HttpService() {
    return _instance;
  }

  static final HttpService _instance = HttpService._internal();
  
  HttpService._internal();



  static Future<Weather?> getWeather(String date) async {
    String url =
      "https://api.openweathermap.org/data/2.5/forecast?lat=19.4326&lon=-99.1332&lang=es&appid=29635d83be060c60d9af145045e4151e&units=metric";
    final response = await http.get(Uri.parse(url));
     final resp= weatherFromJson(response.body);
    return resp ;
  }
}
