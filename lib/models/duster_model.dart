class DusterModel {
  final String id;
  final String name;
  final String surname;
  final String cellphone;
  final String email;
  final String? postCode;
  final String address;
  final Coordinates coordinates;
  final String country;
  final bool? verified;
  final bool readyToWork;
  final bool local;
  final bool female;
  final String idNum;

  const DusterModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.cellphone,
    required this.email,
    required this.postCode,
    required this.address,
    required this.coordinates,
    required this.country,
    required this.verified,
    required this.readyToWork,
    required this.local,
    required this.female,
    required this.idNum,
  });

  factory DusterModel.fromMap(Map<String, dynamic> map) {
    return DusterModel(
      id: map['_id'],
      name: map['name'],
      surname: map['surname'],
      cellphone: map['cellphone'],
      email: map['email'],
      postCode: map['postCode'],
      address: map['address'],
      coordinates: Coordinates.fromJson(map['coordinates']),
      country: map['country'],
      verified: map['verified'],
      readyToWork: map['readyToWork'],
      local: map['local'],
      female: map['female'],
      idNum: map['idNum'],
    );
  }
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }
}
