import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  String uid;
  String userName;
  String email;
  String phoneNo;
  GeoPoint location;
  bool isTechnician;
  String specialty;
  double rating;

  UserEntity(
      {required this.uid,
      required this.userName,
      required this.email,
      required this.phoneNo,
      required this.location,
      required this.isTechnician,
      required this.specialty,
      required this.rating});

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      uid: map["uid"],
      userName: map["userName"],
      email: map["email"],
      phoneNo: map["phoneNo"],
      location: map["location"] as GeoPoint,
      isTechnician: map["isTechnician"],
      specialty: map["specialty"],
      rating: double.parse(map["rating"].toString()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userName': userName,
      'email': email,
      'phoneNo': phoneNo,
      'location': location,
      'isTechnician': isTechnician,
      'specialty': specialty,
      'rating': rating,
    };
  }
}
