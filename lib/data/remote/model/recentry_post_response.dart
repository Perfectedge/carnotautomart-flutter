
class RecentlyPostResponse {
    bool? status;
    String? message;
    Data? data;

    RecentlyPostResponse({
        this.status,
        this.message,
        this.data,
    });

    factory RecentlyPostResponse.fromJson(Map<String, dynamic> json) => RecentlyPostResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

 
}

class Data {
    List<BikeCarSpareParts>? cars;
    List<BikeCarSpareParts>? bikes;
    List<BikeCarSpareParts>? spareParts;

    Data({
        this.cars,
        this.bikes,
        this.spareParts,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        cars: json["cars"]== null? []: List<BikeCarSpareParts>.from(json["data"]!.map((x) => BikeCarSpareParts.fromJson(x))),
        bikes: json["bikes"] == null ? [] :  List<BikeCarSpareParts>.from(json["data"]!.map((x) => BikeCarSpareParts.fromJson(x))),
        spareParts: json["spare_parts"] == null ? [] :  List<BikeCarSpareParts>.from(json["data"]!.map((x) => BikeCarSpareParts.fromJson(x))),
    );

  
}


class BikeCarSpareParts {
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

    BikeCarSpareParts({
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

    factory BikeCarSpareParts.fromJson(Map<String, dynamic> json) => BikeCarSpareParts(
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