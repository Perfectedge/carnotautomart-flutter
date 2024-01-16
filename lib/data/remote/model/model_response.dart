class ModelResponse {
    bool? status;
    String? message;
    Data? data;

    ModelResponse({
        this.status,
        this.message,
        this.data,
    });

    factory ModelResponse.fromJson(Map<String, dynamic> json) => ModelResponse(
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
    List<Model>? models;

    Data({
        this.models,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        models: json["models"] == null ? [] : List<Model>.from(json["models"]!.map((x) => Model.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "models": models == null ? [] : List<dynamic>.from(models!.map((x) => x.toJson())),
    };
}

class Model {
    String? id;
    String? parentId;
    String? typeId;
    String? name;
    String? type;
    String? slug;

    Model({
        this.id,
        this.parentId,
        this.typeId,
        this.name,
        this.type,
        this.slug,
    });

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["id"],
        parentId: json["parent_id"],
        typeId: json["type_id"],
        name: json["name"],
        type: json["type"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "type_id": typeId,
        "name": name,
        "type": type,
        "slug": slug,
    };
}
