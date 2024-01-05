// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<StateResponse> stateResponseFromJson(String str) => List<StateResponse>.from(json.decode(str).map((x) => StateResponse.fromJson(x)));

String stateResponseToJson(StateResponse data) => json.encode(data.toJson());

class StateResponse {
    String? city;
    String? lat;
    String? lng;
    String? country;
    String? iso2;
    String? adminName;
    String? capital;
    String? population;
    String? populationProper;

    StateResponse({
        this.city,
        this.lat,
        this.lng,
        this.country,
        this.iso2,
        this.adminName,
        this.capital,
        this.population,
        this.populationProper,
    });

    factory StateResponse.fromJson(Map<String, dynamic> json) => StateResponse(
        city: json["city"],
        lat: json["lat"],
        lng: json["lng"],
        country: json["country"],
        iso2: json["iso2"],
        adminName: json["admin_name"],
        capital: json["capital"],
        population: json["population"],
        populationProper: json["population_proper"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "lat": lat,
        "lng": lng,
        "country": country,
        "iso2": iso2,
        "admin_name": adminName,
        "capital": capital,
        "population": population,
        "population_proper": populationProper,
    };
}
