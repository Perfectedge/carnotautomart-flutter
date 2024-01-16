

BrandResponse brandResponseFromJson(dynamic str) {
  final responseResult = BrandResponse.fromJson(str);
  return responseResult;
}

class BrandResponse {
    bool? status;
    String? message;
    Data? data;

    BrandResponse({
        this.status,
        this.message,
        this.data,
    });

    factory BrandResponse.fromJson(Map<String, dynamic> json) => BrandResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    List<Brand>? brands;

    Data({
        this.brands,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        brands: json["brands"] == null ? [] : List<Brand>.from(json["brands"]!.map((x) => Brand.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "brands": brands == null ? [] : List<dynamic>.from(brands!.map((x) => x.toJson())),
    };
}

class Brand {
    String? id;
    String? parentId;
    TypeId? typeId;
    String? name;
    Type? type;
    String? slug;

    Brand({
        this.id,
        this.parentId,
        this.typeId,
        this.name,
        this.type,
        this.slug,
    });

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        parentId: json["parent_id"],
        typeId: typeIdValues.map[json["type_id"]]!,
        name: json["name"],
        type: typeValues.map[json["type"]]!,
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "type_id": typeIdValues.reverse[typeId],
        "name": name,
        "type": typeValues.reverse[type],
        "slug": slug,
    };
}

enum Type {
    BRAND
}

final typeValues = EnumValues({
    "Brand": Type.BRAND
});

enum TypeId {
    THE_01,
    THE_012,
    THE_0123456,
    THE_012456,
    THE_0124567,
    THE_124567
}

final typeIdValues = EnumValues({
    "0,1": TypeId.THE_01,
    "0,1,2": TypeId.THE_012,
    "0,1,2,3,4,5,6": TypeId.THE_0123456,
    "0,1,2,4,5,6": TypeId.THE_012456,
    "0,1,2,4,5,6,7": TypeId.THE_0124567,
    "1,2,4,5,6,7": TypeId.THE_124567
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
