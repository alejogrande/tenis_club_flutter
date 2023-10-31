// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
    String? cod;
    int? message;
    int? cnt;
    List<ListElement>? list;


    Weather({
        this.cod,
        this.message,
        this.cnt,
        this.list,
    
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
     
    );

    Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
       
    };
}



class Coord {
    double? lat;
    double? lon;

    Coord({
        this.lat,
        this.lon,
    });

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
    };
}

class ListElement {
    int? dt;
    Main? main;
    List<WeatherElement>? weather;
    Clouds? clouds;
    DateTime? dtTxt;

    ListElement({
        this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.dtTxt,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: json["main"] == null ? null : Main.fromJson(json["main"]),
        weather: json["weather"] == null ? [] : List<WeatherElement>.from(json["weather"]!.map((x) => WeatherElement.fromJson(x))),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main?.toJson(),
        "weather": weather == null ? [] : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "clouds": clouds?.toJson(),
        "dt_txt": dtTxt?.toIso8601String(),
    };
}

class Clouds {
    int? all;

    Clouds({
        this.all,
    });

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class Main {
    double? temp;
    double? feelsLike;
    double? tempMin;
    double? tempMax;
    int? pressure;
    int? seaLevel;
    int? grndLevel;
    int? humidity;
    double? tempKf;

    Main({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.seaLevel,
        this.grndLevel,
        this.humidity,
        this.tempKf,
    });

    factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
    };
}

class WeatherElement {
    int? id;
    String? main;
    String? description;
    String? icon;

    WeatherElement({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}
