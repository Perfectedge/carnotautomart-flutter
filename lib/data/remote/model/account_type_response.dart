class AccountTypeResponse {
  bool? status;
  List<AccountType>? data;
  AccountTypeResponse({
    this.status,
    this.data,
  });

  factory AccountTypeResponse.fromJson(Map<String, dynamic> json) => AccountTypeResponse(
        status: json["status"],
        data: json["data"] == null ? [] : List<AccountType>.from(json["data"]!.map((x) => AccountType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AccountType {
  String? id;
  String? name;

  AccountType({
    this.id,
    this.name,
  });

  factory AccountType.fromJson(Map<String, dynamic> json) => AccountType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
