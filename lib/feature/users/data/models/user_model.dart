import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final AddressModel? address;
  final String? phone;
  final String? website;
  final CompanyModel? company;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    address: json["address"] == null ? null : AddressModel.fromJson(json["address"]),
    phone: json["phone"],
    website: json["website"],
    company: json["company"] == null ? null : CompanyModel.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address?.toJson(),
    "phone": phone,
    "website": website,
    "company": company?.toJson(),
  };
}

class AddressModel {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final GeoModel? geo;

  AddressModel({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: json["geo"] == null ? null : GeoModel.fromJson(json["geo"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo?.toJson(),
  };
}

class GeoModel {
  final String? lat;
  final String? lng;

  GeoModel({
    this.lat,
    this.lng,
  });

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class CompanyModel {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  CompanyModel({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    name: json["name"],
    catchPhrase: json["catchPhrase"],
    bs: json["bs"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}
