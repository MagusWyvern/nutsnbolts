// Third-party package imports
import 'package:cloud_firestore/cloud_firestore.dart';

// Flutter imports
import 'package:flutter/widgets.dart';

// Local project imports - Entities and model
import 'package:nutsnbolts/entities/user_entity.dart';
import 'package:nutsnbolts/model/firestore_model.dart';

class UserUsecase extends ChangeNotifier {
  UserEntity userEntity = UserEntity(
      uid: " ",
      userName: " ",
      email: " ",
      phoneNo: " ",
      photoUrl: " ",
      location: const GeoPoint(0, 0),
      isTechnician: false,
      rating: 5,
      numRating: 1,
      specialty: [],
      nuts: []);

  Future<void> resetUser() async {
    userEntity = UserEntity(
        uid: " ",
        userName: " ",
        email: " ",
        phoneNo: " ",
        photoUrl: " ",
        location: const GeoPoint(0, 0),
        isTechnician: false,
        rating: 5,
        numRating: 1,
        specialty: [],
        nuts: []);
    notifyListeners();
  }

  Future<void> getUser(String uid) async {
    UserEntity newUserEntity = await FirestoreModel().getUser(uid);
    userEntity = newUserEntity;
    notifyListeners();
  }

  Future<void> signupTechnician(List<String> specialty) async {
    userEntity.isTechnician = true;
    userEntity.specialty = specialty;
    await FirestoreModel().signUpTechnician(userEntity);
    notifyListeners();
  }
}
