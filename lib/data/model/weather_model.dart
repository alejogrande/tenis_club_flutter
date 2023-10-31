// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather? weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather? data) => json.encode(data!.toJson());

class Weather {
    Weather({
        this.forecast,
    });

    Forecast? forecast;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        forecast: Forecast.fromJson(json["forecast"]),
    );

    Map<String, dynamic> toJson() => {
        "forecast": forecast!.toJson(),
    };
}

class Forecast {
    Forecast({
        this.forecastday,
    });

    List<Forecastday?>? forecastday;

    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: json["forecastday"] == null ? [] : List<Forecastday?>.from(json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "forecastday": forecastday == null ? [] : List<dynamic>.from(forecastday!.map((x) => x!.toJson())),
    };
}

class Forecastday {
    Forecastday({
        this.hour,
    });

    List<Hour?>? hour;

    factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        hour: json["hour"] == null ? [] : List<Hour?>.from(json["hour"]!.map((x) => Hour.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hour": hour == null ? [] : List<dynamic>.from(hour!.map((x) => x!.toJson())),
    };
}

class Hour {
    Hour({
        this.tempC,
        this.condition,
    });

    double? tempC;
    Condition? condition;

    factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        tempC: json["temp_c"].toDouble(),
        condition: Condition.fromJson(json["condition"]),
    );

    Map<String, dynamic> toJson() => {
        "temp_c": tempC,
        "condition": condition!.toJson(),
    };
}

class Condition {
    Condition({
        this.icon,
    });

    String? icon;

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "icon": icon,
    };
}
