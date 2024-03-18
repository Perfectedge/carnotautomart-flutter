DropDownResponse dropDownResponseFromJson(dynamic str) {
  final responseResult = DropDownResponse.fromJson(str);
  return responseResult;
}

class DropDownResponse {
  bool? status;
  String? message;
  Data? data;

  DropDownResponse({
    this.status,
    this.message,
    this.data,
  });

  factory DropDownResponse.fromJson(Map<String, dynamic> json) => DropDownResponse(
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
  List<Location>? locations;
  List<VehicleTypeElement>? vehicleTypes;
  VehicleConditions? vehicleConditions;
  Packages? packages;
  List<Fuel>? fuels;
  Currency? currency;
  Gearbox? gearbox;
  List<String>? manufacturingYears;
  List<BodyType>? bodyType;
  List<CarColor>? colors;
  Map<String, String>? seats;
  Map<String, String>? ownerType;
  List<AllFeature>? allFeatures;
  List<Part>? parts;
  List<PartsFor>? partsFor;
  List<MobileMechanicCategory>? partsDescription;
  List<String>? ages;
  List<EngineSize>? engineSizes;
  List<BodyType>? bodyTypes;
  Map<String, String>? wheels;
  Map<String, String>? serviceHistory;
  Map<String, String>? educationType;
  List<VehicleTypeElement>? vehicleTypesForDrivers;
  Map<String, LicenseType>? licenseType;
  List<Location>? driverLocation;
  Map<String, String>? driverMaritalStatus;
  List<String>? driverStatus;
  Map<String, String>? driverServiceTypes;
  Map<String, String>? driverHirePeriods;
  MechanicServiceType? mechanicServiceType;
  List<MechanicRepairType>? mechanicRepairTypes;
  List<AllFeature>? mechanicSpecialisms;
  List<MobileMechanicCategory>? mobileMechanicCategories;
  MobileMechanicAvailability? mobileMechanicAvailability;
  List<Map<String, String?>>? insuranceProviders;
  List<DestinationPort>? destinationPort;
  List<Country>? country;

  Data({
    this.locations,
    this.vehicleTypes,
    this.vehicleConditions,
    this.packages,
    this.fuels,
    this.currency,
    this.gearbox,
    this.manufacturingYears,
    this.bodyType,
    this.colors,
    this.seats,
    this.ownerType,
    this.allFeatures,
    this.parts,
    this.partsFor,
    this.partsDescription,
    this.ages,
    this.engineSizes,
    this.bodyTypes,
    this.wheels,
    this.serviceHistory,
    this.educationType,
    this.vehicleTypesForDrivers,
    this.licenseType,
    this.driverLocation,
    this.driverMaritalStatus,
    this.driverStatus,
    this.driverServiceTypes,
    this.driverHirePeriods,
    this.mechanicServiceType,
    this.mechanicRepairTypes,
    this.mechanicSpecialisms,
    this.mobileMechanicCategories,
    this.mobileMechanicAvailability,
    this.insuranceProviders,
    this.destinationPort,
    this.country,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        locations: json["locations"] == null ? [] : List<Location>.from(json["locations"]!.map((x) => Location.fromJson(x))),
        vehicleTypes:
            json["vehicle_types"] == null ? [] : List<VehicleTypeElement>.from(json["vehicle_types"]!.map((x) => VehicleTypeElement.fromJson(x))),
        vehicleConditions: json["vehicle_conditions"] == null ? null : VehicleConditions.fromJson(json["vehicle_conditions"]),
        packages: json["packages"] == null ? null : Packages.fromJson(json["packages"]),
        fuels: json["fuels"] == null ? [] : List<Fuel>.from(json["fuels"]!.map((x) => Fuel.fromJson(x))),
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        gearbox: json["gearbox"] == null ? null : Gearbox.fromJson(json["gearbox"]),
        manufacturingYears: json["manufacturing_years"] == null ? [] : List<String>.from(json["manufacturing_years"]!.map((x) => x)),
        bodyType: json["body_type"] == null ? [] : List<BodyType>.from(json["body_type"]!.map((x) => BodyType.fromJson(x))),
        colors: json["colors"] == null ? [] : List<CarColor>.from(json["colors"]!.map((x) => CarColor.fromJson(x))),
        seats: Map.from(json["seats"]!).map((k, v) => MapEntry<String, String>(k, v)),
        ownerType: Map.from(json["owner_type"]!).map((k, v) => MapEntry<String, String>(k, v)),
        allFeatures: json["all_features"] == null ? [] : List<AllFeature>.from(json["all_features"]!.map((x) => AllFeature.fromJson(x))),
        parts: json["parts"] == null ? [] : List<Part>.from(json["parts"]!.map((x) => Part.fromJson(x))),
        partsFor: json["parts_for"] == null ? [] : List<PartsFor>.from(json["parts_for"]!.map((x) => PartsFor.fromJson(x))),
        partsDescription: json["parts_description"] == null
            ? []
            : List<MobileMechanicCategory>.from(json["parts_description"]!.map((x) => MobileMechanicCategory.fromJson(x))),
        ages: json["ages"] == null ? [] : List<String>.from(json["ages"]!.map((x) => x)),
        engineSizes: json["engine_sizes"] == null ? [] : List<EngineSize>.from(json["engine_sizes"]!.map((x) => EngineSize.fromJson(x))),
        bodyTypes: json["body_types"] == null ? [] : List<BodyType>.from(json["body_types"]!.map((x) => BodyType.fromJson(x))),
        wheels: Map.from(json["wheels"]!).map((k, v) => MapEntry<String, String>(k, v)),
        serviceHistory: Map.from(json["service_history"]!).map((k, v) => MapEntry<String, String>(k, v)),
        educationType: Map.from(json["education_type"]!).map((k, v) => MapEntry<String, String>(k, v)),
        vehicleTypesForDrivers: json["vehicle_types_for_drivers"] == null
            ? []
            : List<VehicleTypeElement>.from(json["vehicle_types_for_drivers"]!.map((x) => VehicleTypeElement.fromJson(x))),
        licenseType: Map.from(json["license_type"]!).map((k, v) => MapEntry<String, LicenseType>(k, LicenseType.fromJson(v))),
        driverLocation: json["driver_location"] == null ? [] : List<Location>.from(json["driver_location"]!.map((x) => Location.fromJson(x))),
        driverMaritalStatus: Map.from(json["driver_marital_status"]!).map((k, v) => MapEntry<String, String>(k, v)),
        driverStatus: json["driver_status"] == null ? [] : List<String>.from(json["driver_status"]!.map((x) => x)),
        driverServiceTypes: Map.from(json["driver_service_types"]!).map((k, v) => MapEntry<String, String>(k, v)),
        driverHirePeriods: Map.from(json["driver_hire_periods"]!).map((k, v) => MapEntry<String, String>(k, v)),
        mechanicServiceType: json["mechanic_service_type"] == null ? null : MechanicServiceType.fromJson(json["mechanic_service_type"]),
        mechanicRepairTypes: json["mechanic_repair_types"] == null
            ? []
            : List<MechanicRepairType>.from(json["mechanic_repair_types"]!.map((x) => MechanicRepairType.fromJson(x))),
        mechanicSpecialisms:
            json["mechanic_specialisms"] == null ? [] : List<AllFeature>.from(json["mechanic_specialisms"]!.map((x) => AllFeature.fromJson(x))),
        mobileMechanicCategories: json["mobile_mechanic_categories"] == null
            ? []
            : List<MobileMechanicCategory>.from(json["mobile_mechanic_categories"]!.map((x) => MobileMechanicCategory.fromJson(x))),
        mobileMechanicAvailability:
            json["mobile_mechanic_availability"] == null ? null : MobileMechanicAvailability.fromJson(json["mobile_mechanic_availability"]),
        insuranceProviders: json["insurance_providers"] == null
            ? []
            : List<Map<String, String?>>.from(json["insurance_providers"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
        destinationPort:
            json["destination_port"] == null ? [] : List<DestinationPort>.from(json["destination_port"]!.map((x) => DestinationPort.fromJson(x))),
        country: json["country"] == null ? [] : List<Country>.from(json["country"]!.map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x.toJson())),
        "vehicle_types": vehicleTypes == null ? [] : List<dynamic>.from(vehicleTypes!.map((x) => x.toJson())),
        "vehicle_conditions": vehicleConditions?.toJson(),
        "packages": packages?.toJson(),
        "fuels": fuels == null ? [] : List<dynamic>.from(fuels!.map((x) => x.toJson())),
        "currency": currency?.toJson(),
        "gearbox": gearbox?.toJson(),
        "manufacturing_years": manufacturingYears == null ? [] : List<dynamic>.from(manufacturingYears!.map((x) => x)),
        "body_type": bodyType == null ? [] : List<dynamic>.from(bodyType!.map((x) => x.toJson())),
        "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x.toJson())),
        "seats": Map.from(seats!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "owner_type": Map.from(ownerType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "all_features": allFeatures == null ? [] : List<dynamic>.from(allFeatures!.map((x) => x.toJson())),
        "parts": parts == null ? [] : List<dynamic>.from(parts!.map((x) => x.toJson())),
        "parts_for": partsFor == null ? [] : List<dynamic>.from(partsFor!.map((x) => x.toJson())),
        "parts_description": partsDescription == null ? [] : List<dynamic>.from(partsDescription!.map((x) => x.toJson())),
        "ages": ages == null ? [] : List<dynamic>.from(ages!.map((x) => x)),
        "engine_sizes": engineSizes == null ? [] : List<dynamic>.from(engineSizes!.map((x) => x.toJson())),
        "body_types": bodyTypes == null ? [] : List<dynamic>.from(bodyTypes!.map((x) => x.toJson())),
        "wheels": Map.from(wheels!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "service_history": Map.from(serviceHistory!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "education_type": Map.from(educationType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "vehicle_types_for_drivers": vehicleTypesForDrivers == null ? [] : List<dynamic>.from(vehicleTypesForDrivers!.map((x) => x.toJson())),
        "license_type": Map.from(licenseType!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "driver_location": driverLocation == null ? [] : List<dynamic>.from(driverLocation!.map((x) => x.toJson())),
        "driver_marital_status": Map.from(driverMaritalStatus!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "driver_status": driverStatus == null ? [] : List<dynamic>.from(driverStatus!.map((x) => x)),
        "driver_service_types": Map.from(driverServiceTypes!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "driver_hire_periods": Map.from(driverHirePeriods!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "mechanic_service_type": mechanicServiceType?.toJson(),
        "mechanic_repair_types": mechanicRepairTypes == null ? [] : List<dynamic>.from(mechanicRepairTypes!.map((x) => x.toJson())),
        "mechanic_specialisms": mechanicSpecialisms == null ? [] : List<dynamic>.from(mechanicSpecialisms!.map((x) => x.toJson())),
        "mobile_mechanic_categories": mobileMechanicCategories == null ? [] : List<dynamic>.from(mobileMechanicCategories!.map((x) => x.toJson())),
        "mobile_mechanic_availability": mobileMechanicAvailability?.toJson(),
        "insurance_providers": insuranceProviders == null
            ? []
            : List<dynamic>.from(insuranceProviders!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "destination_port": destinationPort == null ? [] : List<dynamic>.from(destinationPort!.map((x) => x.toJson())),
        "country": country == null ? [] : List<dynamic>.from(country!.map((x) => x.toJson())),
      };
}

class AllFeature {
  String? id;
  String? title;

  AllFeature({
    this.id,
    this.title,
  });

  factory AllFeature.fromJson(Map<String, dynamic> json) => AllFeature(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}

class BodyType {
  String? id;
  String? vehicleType;
  String? typeName;

  BodyType({
    this.id,
    this.vehicleType,
    this.typeName,
  });

  factory BodyType.fromJson(Map<String, dynamic> json) => BodyType(
        id: json["id"],
        vehicleType: json["vehicle_type"]!,
        typeName: json["type_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vehicle_type": vehicleType,
        "type_name": typeName,
      };
}

class CarColor {
  String? id;
  String? name;

  CarColor({
    this.id,
    this.name,
  });

  factory CarColor.fromJson(Map<String, dynamic> json) => CarColor(
        id: json["id"],
        name: json["color_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "color_name": name,
      };
}

class Country {
  String? id;
  String? parentId;
  String? name;
  String? slug;
  String? type;
  String? status;

  Country({
    this.id,
    this.parentId,
    this.name,
    this.slug,
    this.type,
    this.status,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
        slug: json["slug"],
        type: json["type"],
        status: json["status"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "name": name,
        "slug": slug,
        "type": type,
        "status": status,
      };
}

class Currency {
  String? ngr;

  Currency({
    this.ngr,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        ngr: json["NGR"],
      );

  Map<String, dynamic> toJson() => {
        "NGR": ngr,
      };
}

class DestinationPort {
  String? id;
  String? name;

  DestinationPort({
    this.id,
    this.name,
  });

  factory DestinationPort.fromJson(Map<String, dynamic> json) => DestinationPort(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Location {
  int? id;
  String? name;
  int? parentId;
  String? type;
  int? postQty;
  String? isHome;
  String? slug;
  int? countryId;

  Location({
    this.id,
    this.name,
    this.parentId,
    this.type,
    this.postQty,
    this.isHome,
    this.slug,
    this.countryId,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        type: json["type"]!,
        postQty: json["post_qty"],
        isHome: json["is_home"]!,
        slug: json["slug"],
        countryId: json["country_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "type": type,
        "post_qty": postQty,
        "is_home": isHome,
        "slug": slug,
        "country_id": countryId,
      };
}

class EngineSize {
  String? id;
  String? vehicleTypeId;
  String? engineSize;

  EngineSize({
    this.id,
    this.vehicleTypeId,
    this.engineSize,
  });

  factory EngineSize.fromJson(Map<String, dynamic> json) => EngineSize(
        id: json["id"],
        vehicleTypeId: json["vehicle_type_id"],
        engineSize: json["engine_size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vehicle_type_id": vehicleTypeId,
        "engine_size": engineSize,
      };
}

class Fuel {
  String? id;
  String? name;

  Fuel({
    this.id,
    this.name,
  });

  factory Fuel.fromJson(Map<String, dynamic> json) => Fuel(
        id: json["id"],
        name: json["fuel_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fuel_name": name,
      };
}

class Gearbox {
  String? automatic;
  String? samiAutomatic;
  String? manual;

  Gearbox({
    this.automatic,
    this.samiAutomatic,
    this.manual,
  });

  factory Gearbox.fromJson(Map<String, dynamic> json) => Gearbox(
        automatic: json["Automatic"],
        samiAutomatic: json["Sami Automatic"],
        manual: json["Manual"],
      );

  Map<String, dynamic> toJson() => {
        "Automatic": automatic,
        "Sami Automatic": samiAutomatic,
        "Manual": manual,
      };
  List<String> toStringList() {
    return [automatic, samiAutomatic, manual].where((item) => item != null).toList().cast<String>();
  }
}

class LicenseType {
  String? name;
  String? details;

  LicenseType({
    this.name,
    this.details,
  });

  factory LicenseType.fromJson(Map<String, dynamic> json) => LicenseType(
        name: json["name"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "details": details,
      };
}

class MechanicRepairType {
  String? id;
  String? title;
  String? image;
  String? description;

  MechanicRepairType({
    this.id,
    this.title,
    this.image,
    this.description,
  });

  factory MechanicRepairType.fromJson(Map<String, dynamic> json) => MechanicRepairType(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "description": description,
      };
}

class MechanicServiceType {
  String? delivery;
  String? pickup;

  MechanicServiceType({
    this.delivery,
    this.pickup,
  });

  factory MechanicServiceType.fromJson(Map<String, dynamic> json) => MechanicServiceType(
        delivery: json["Delivery"],
        pickup: json["Pickup"],
      );

  Map<String, dynamic> toJson() => {
        "Delivery": delivery,
        "Pickup": pickup,
      };
}

class MobileMechanicAvailability {
  String? the24Hrs;
  String? the9Am5Pm;
  String? the6Am10Pm;

  MobileMechanicAvailability({
    this.the24Hrs,
    this.the9Am5Pm,
    this.the6Am10Pm,
  });

  factory MobileMechanicAvailability.fromJson(Map<String, dynamic> json) => MobileMechanicAvailability(
        the24Hrs: json["24 hrs"],
        the9Am5Pm: json["9am-5PM"],
        the6Am10Pm: json["6am-10PM"],
      );

  Map<String, dynamic> toJson() => {
        "24 hrs": the24Hrs,
        "9am-5PM": the9Am5Pm,
        "6am-10PM": the6Am10Pm,
      };
}

class MobileMechanicCategory {
  String? id;
  String? parentId;
  String? name;

  MobileMechanicCategory({
    this.id,
    this.parentId,
    this.name,
  });

  factory MobileMechanicCategory.fromJson(Map<String, dynamic> json) => MobileMechanicCategory(
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "name": name,
      };
}

class Packages {
  String? free;

  Packages({
    this.free,
  });

  factory Packages.fromJson(Map<String, dynamic> json) => Packages(
        free: json["Free"],
      );

  Map<String, dynamic> toJson() => {
        "Free": free,
      };
}

class Part {
  String? id;
  String? category;

  Part({
    this.id,
    this.category,
  });

  factory Part.fromJson(Map<String, dynamic> json) => Part(
        id: json["id"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
      };
}

class PartsFor {
  String? id;
  String? name;
  String? slug;

  PartsFor({
    this.id,
    this.name,
    this.slug,
  });

  factory PartsFor.fromJson(Map<String, dynamic> json) => PartsFor(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class VehicleConditions {
  String? vehicleConditionsNew;
  String? nigerianUsed;
  String? foreignUsed;

  VehicleConditions({
    this.vehicleConditionsNew,
    this.nigerianUsed,
    this.foreignUsed,
  });

  factory VehicleConditions.fromJson(Map<String, dynamic> json) => VehicleConditions(
        vehicleConditionsNew: json["New"],
        nigerianUsed: json["Nigerian used"],
        foreignUsed: json["Foreign used"],
      );

  Map<String, dynamic> toJson() => {
        "New": vehicleConditionsNew,
        "Nigerian used": nigerianUsed,
        "Foreign used": foreignUsed,
      };
  List<String> toStringList() {
    return [vehicleConditionsNew, nigerianUsed, foreignUsed].where((item) => item != null).toList().cast<String>();
  }
}

class VehicleTypeElement {
  int? id;
  String? name;
  String? slug;

  VehicleTypeElement({
    this.id,
    this.name,
    this.slug,
  });

  factory VehicleTypeElement.fromJson(Map<String, dynamic> json) => VehicleTypeElement(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}
