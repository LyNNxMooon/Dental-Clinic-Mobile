// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dental_clinic_mobile/data/doctor_vo.dart';
import 'package:dental_clinic_mobile/data/emergency_saving_vo.dart';
import 'package:dental_clinic_mobile/data/user_vo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseServices {
  FirebaseServices._();
  static final FirebaseServices _singleton = FirebaseServices._();
  factory FirebaseServices() => _singleton;

  //Auth
  Future firebaseSignIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      return Future.error(error);
    }
  }

  //realtimeDatabase

  final databaseRef = FirebaseDatabase.instance.ref();

  Future<UserVO?> getPatient(String id) async {
    return databaseRef.child("patients").child(id).once().then((event) {
      if (event.snapshot.value == null) {
        return null;
      } else {
        final rawData = event.snapshot.value;
        return UserVO.fromJson(Map<String, dynamic>.from(rawData as Map));
      }
    });
  }

  Future savePatient(UserVO userVo) async {
    try {
      return databaseRef
          .child("patients")
          .child(userVo.id.toString())
          .set(userVo.toJson());
    } on FirebaseException catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  Future deleteUser(String id) async {
    try {
      return databaseRef.child("patients").child(id.toString()).remove();
    } on FirebaseException catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  Stream<List<DoctorVO>?> getDoctorListStream() {
    return databaseRef.child("doctors").onValue.map((event) {
      return event.snapshot.children.map<DoctorVO>((snapshot) {
        return DoctorVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }

  Stream<List<EmergencySavingVO>?> getEmergencySavingListStream() {
    return databaseRef.child("emergency").onValue.map((event) {
      return event.snapshot.children.map<EmergencySavingVO>((snapshot) {
        return EmergencySavingVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }

  Future<List<DoctorVO>> getSearchDoctorsStream() async {
    final databaseReference = FirebaseDatabase.instance.ref('doctors');
    final snapshot = await databaseReference.orderByChild('name').get();

    if (snapshot.exists) {
      final doctorList = snapshot.children.map((doctor) {
        return DoctorVO.fromJson(
            Map<String, dynamic>.from(doctor.value as Map));
      }).toList();

      return doctorList;
    } else {
      return [];
    }
  }

  //firebase storage

  static final _firebaseStorage = FirebaseStorage.instance;

  static Future<String> uploadToFirebaseStorage(
      File file, String path, String contentType) {
    var metadata = SettableMetadata(contentType: contentType);
    return _firebaseStorage
        .ref(path)
        .child(DateTime.now().millisecondsSinceEpoch.toString())
        .putFile(file, metadata)
        .then((takeSnapShot) {
      return takeSnapShot.ref.getDownloadURL().then((value) {
        return value;
      });
    });
  }
}
