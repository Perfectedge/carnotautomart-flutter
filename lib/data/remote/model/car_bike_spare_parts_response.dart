class CarBikeSparePartsResponse {
  bool? status;
  String? message;
  List<RecentBikeCarSpareParts>? carsBikeSpareParts;

  CarBikeSparePartsResponse({
    this.status,
    this.message,
    this.carsBikeSpareParts,
  });

  factory CarBikeSparePartsResponse.fromJson(Map<String, dynamic> json) => CarBikeSparePartsResponse(
        status: json["status"],
        message: json["message"],
        carsBikeSpareParts:
            json["data"] == null ? [] : List<RecentBikeCarSpareParts>.from(json["data"]!.map((x) => RecentBikeCarSpareParts.fromJson(x))),
      );
}

class RecentBikeCarSpareParts {
  String? condition;
  String? priceinnaira;
  dynamic mileage;
  String? vehicleTypeId;
  String? id;
  String? postSlug;
  String? title;
  String? featuredPosition;
  String? postType;
  String? manufactureYear;
  String? location;
  String? photo;

  RecentBikeCarSpareParts({
    this.condition,
    this.priceinnaira,
    this.mileage,
    this.vehicleTypeId,
    this.id,
    this.postSlug,
    this.title,
    this.featuredPosition,
    this.postType,
    this.manufactureYear,
    this.location,
    this.photo,
  });

  factory RecentBikeCarSpareParts.fromJson(Map<String, dynamic> json) => RecentBikeCarSpareParts(
        condition: json["condition"],
        priceinnaira: json["priceinnaira"],
        mileage: json["mileage"],
        vehicleTypeId: json["vehicle_type_id"],
        id: json["id"],
        postSlug: json["post_slug"],
        title: json["title"],
        featuredPosition: json["featured_position"],
        postType: json["post_type"],
        manufactureYear: json["manufacture_year"],
        location: json["location"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "condition": condition,
        "priceinnaira": priceinnaira,
        "mileage": mileage,
        "vehicle_type_id": vehicleTypeId,
        "id": id,
        "post_slug": postSlug,
        "title": title,
        "featured_position": featuredPosition,
        "post_type": postType,
        "manufacture_year": manufactureYear,
        "location": location,
        "photo": photo,
      };
}
