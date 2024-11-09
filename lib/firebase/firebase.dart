// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dental_clinic_mobile/data/admin_vo.dart';
import 'package:dental_clinic_mobile/data/appointment_vo.dart';
import 'package:dental_clinic_mobile/data/cart_item_vo.dart';
import 'package:dental_clinic_mobile/data/chatted_user_vo.dart';
import 'package:dental_clinic_mobile/data/doctor_vo.dart';
import 'package:dental_clinic_mobile/data/emergency_saving_vo.dart';
import 'package:dental_clinic_mobile/data/feedback_vo.dart';
import 'package:dental_clinic_mobile/data/message_vo.dart';
import 'package:dental_clinic_mobile/data/order_vo.dart';
import 'package:dental_clinic_mobile/data/payment_vo.dart';
import 'package:dental_clinic_mobile/data/pharmacy_vo.dart';
import 'package:dental_clinic_mobile/data/treatment_vo.dart';
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

  Future firebaseSignUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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

  Stream<List<AdminVO>?> getAdminUID() {
    return databaseRef.child("admin_uid").onValue.map((event) {
      return event.snapshot.children.map<AdminVO>((snapshot) {
        return AdminVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
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

  Future<List<PharmacyVO>> getSearchPharmacyStream() async {
    final databaseReference = FirebaseDatabase.instance.ref('pharmacy');
    final snapshot = await databaseReference.orderByChild('name').get();

    if (snapshot.exists) {
      final pharmacyList = snapshot.children.map((pharmacy) {
        return PharmacyVO.fromJson(
            Map<String, dynamic>.from(pharmacy.value as Map));
      }).toList();

      return pharmacyList;
    } else {
      return [];
    }
  }

  Future saveTreatment(TreatmentVO treatmentVo) async {
    try {
      return databaseRef
          .child("treatments")
          .child(treatmentVo.id.toString())
          .set(treatmentVo.toJson());
    } on FirebaseException catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  Stream<List<AppointmentVO>?> getAppointmentListStream(String patientUid) {
    return databaseRef.child("appointments").onValue.map((event) {
      return event.snapshot.children
          .map<AppointmentVO?>((snapshot) {
            final appointment = AppointmentVO.fromJson(
                Map<String, dynamic>.from(snapshot.value as Map));
            if (appointment.patientId == patientUid) {
              return appointment;
            } else {
              return null;
            }
          })
          .whereType<AppointmentVO>()
          .toList();
    });
  }

  Stream<List<TreatmentVO>?> getTreatmentListStream(String patientUid) {
    return databaseRef.child("treatments").onValue.map((event) {
      return event.snapshot.children
          .map<TreatmentVO?>((snapshot) {
            final treatment = TreatmentVO.fromJson(
                Map<String, dynamic>.from(snapshot.value as Map));
            if (treatment.patientID == patientUid) {
              return treatment;
            } else {
              return null;
            }
          })
          .whereType<TreatmentVO>()
          .toList();
    });
  }

  Future saveAppointment(AppointmentVO appointmentVo) async {
    try {
      return databaseRef
          .child("appointments")
          .child(appointmentVo.id.toString())
          .set(appointmentVo.toJson());
    } on FirebaseException catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  Stream<List<FeedBackVO>?> getFeedBackListStream() {
    return databaseRef.child("patient_feedbacks").onValue.map((event) {
      return event.snapshot.children
          .map<FeedBackVO?>((snapshot) {
            final feedback = FeedBackVO.fromJson(
                Map<String, dynamic>.from(snapshot.value as Map));

            if (feedback.display) {
              return feedback;
            } else {
              return null;
            }
          })
          .whereType<FeedBackVO>()
          .toList();
    });
  }

  Future saveFeedback(FeedBackVO feedbackVo) async {
    try {
      return databaseRef
          .child("patient_feedbacks")
          .child(feedbackVo.id.toString())
          .set(feedbackVo.toJson());
    } on FirebaseException catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  Stream<List<PaymentVO>?> getPaymentListStream() {
    return databaseRef.child("payments").onValue.map((event) {
      return event.snapshot.children.map<PaymentVO>((snapshot) {
        return PaymentVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }

  Stream<List<PharmacyVO>?> getPharmacyListStream() {
    return databaseRef.child("pharmacy").onValue.map((event) {
      return event.snapshot.children.map<PharmacyVO>((snapshot) {
        return PharmacyVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }

  Future saveOrder(OrderVO orderVo) async {
    try {
      return databaseRef
          .child("orders")
          .child(orderVo.id.toString())
          .set(orderVo.toJson());
    } on FirebaseException catch (error) {
      print(error);
      return Future.error(error.message ?? "");
    }
  }

  Stream<List<OrderVO>?> getOrderListStream(String patientUid) {
    return databaseRef.child("orders").onValue.map((event) {
      return event.snapshot.children
          .map<OrderVO?>((snapshot) {
            try {
              final rawValue = snapshot.value;
              print("Raw snapshot value: $rawValue");

              if (rawValue is Map) {
                // Extract order data
                final orderData = Map<String, dynamic>.from(rawValue);

                // Check if 'items' exists and is a List
                if (orderData['items'] is List) {
                  // Map through the items and convert to CartItemVO
                  final items = (orderData['items'] as List)
                      .map((item) {
                        if (item is Map) {
                          return CartItemVO.fromJson(
                              Map<String, dynamic>.from(item));
                        } else {
                          print("Unexpected item type: ${item.runtimeType}");
                          return null; // or handle error
                        }
                      })
                      .whereType<CartItemVO>()
                      .toList();

                  // Create the OrderVO instance
                  final order = OrderVO(
                    id: orderData['id'],
                    items: items,
                    totalPrice: (orderData['total_price'] is int)
                        ? (orderData['total_price'] as int).toDouble()
                        : orderData['total_price'], // Handle potential double
                    orderStatus: orderData['order_status'],
                    payment: orderData['payment'],
                    slip: orderData['slip'] ?? "",
                    patientID: orderData['patient_id'],
                    patientName: orderData['patient_name'],
                    patientPhone: orderData['patient_phone'],
                    patientAddress: orderData['patient_address'],
                    date: orderData['date'],
                    deliveryFees: (orderData['delivery_fees'] is int)
                        ? (orderData['delivery_fees'] as int).toDouble()
                        : orderData['delivery_fees'],
                  );

                  // Filter orders by patientID
                  if (order.patientID == patientUid) {
                    return order;
                  }
                } else {
                  print(
                      "Unexpected items type: ${orderData['items']?.runtimeType}");
                }
              } else {
                print(
                    "Unexpected data type for snapshot ${snapshot.key}: ${rawValue.runtimeType}");
              }
            } catch (e) {
              print("Error parsing order for snapshot ${snapshot.key}: $e");
            }
            return null;
          })
          .whereType<OrderVO>()
          .toList();
    });
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

  //chat Services

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  Future<void> sendMessages(String receiverID, String message,
      String senderName, String senderProfile) async {
    final String currentUserID = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final DateTime timeStamp = DateTime.now();

    MessageVO newMessage = MessageVO(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timeStamp: timeStamp);

    //Chat Room
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join("_");

    // Add Message and receiver to Chat Room
    await _firebaseDatabase
        .ref('chat_rooms/$chatRoomID/messages')
        .push()
        .set(newMessage.toJson());

    await _firebaseDatabase.ref('users/$currentUserID/chats/$receiverID').set({
      'name': "Admin",
      'chatted_user_uid': receiverID,
      'last_sender_uid': currentUserID,
      'profile_url':
          "https://www.shutterstock.com/image-vector/user-icon-vector-600nw-393536320.jpg",
      'last_message': message,
      'date_time': timeStamp.toIso8601String(),
    });

    await _firebaseDatabase.ref('users/$receiverID/chats/$currentUserID').set({
      'name': senderName,
      'chatted_user_uid': currentUserID,
      'last_sender_uid': currentUserID,
      'profile_url': senderProfile,
      'last_message': message,
      'date_time': timeStamp.toIso8601String(),
    });
  }

  Stream<DatabaseEvent> getMessages(String userID, String otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join("_");

    // Return a stream from Realtime Database reference for the messages
    return _firebaseDatabase
        .ref('chat_rooms/$chatRoomID/messages')
        .orderByChild('time_stamp') // Ordering by timestamp
        .onValue; // This listens to any changes in the data
  }

  Stream<List<ChattedUserVO>?> getChatListStream() {
    final String currentUserID = _firebaseAuth.currentUser!.uid;

    return _firebaseDatabase
        .ref('users/$currentUserID/chats')
        .orderByChild('date_time') // Order by 'date_time'
        .onValue // Listen to changes in the 'chats' node
        .map((event) {
      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(event.snapshot.value as Map);
        return data.values.map((e) {
          return ChattedUserVO.fromJson(Map<String, dynamic>.from(e));
        }).toList();
      } else {
        return null; // Return null if there's no data
      }
    });
  }
}
