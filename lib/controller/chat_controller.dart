import 'dart:io';

import 'package:dental_clinic_mobile/controller/base_controller.dart';
import 'package:dental_clinic_mobile/data/chatted_user_vo.dart';
import 'package:dental_clinic_mobile/firebase/firebase.dart';
import 'package:dental_clinic_mobile/utils/enums.dart';
import 'package:dental_clinic_mobile/utils/file_picker_utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ChatController extends BaseController {
  final _firebaseService = FirebaseServices();

  RxList<ChattedUserVO> chattedUsers = <ChattedUserVO>[].obs;

  final _filePickerUtil = FilePickerUtil();

  Rxn<File> selectFile = Rxn<File>();

  @override
  void onInit() {
    callChattedUsers();
    super.onInit();
  }

  Future<void> sendPhoto(
      String receiverID, String senderName, String senderProfile) async {
    selectFile.value = await _filePickerUtil.getImage(false);

    if (selectFile.value != null) {
      final String fileUrl = await _uploadFileToFirebaseStorage();
      _firebaseService.sendMessages(
          receiverID, fileUrl, senderName, senderProfile);
    }
  }

  Future<void> sendMessages(String receiverID, String message,
          String senderName, String senderProfile) =>
      _firebaseService.sendMessages(
          receiverID, message, senderName, senderProfile);

  Stream<DatabaseEvent> getMessages(String userID, String otherUserID) =>
      _firebaseService.getMessages(userID, otherUserID);

  callChattedUsers() async {
    chattedUsers.value = [];
    setLoadingState = LoadingState.loading;
    _firebaseService.getChatListStream().listen(
      (event) {
        if (event == null || event.isEmpty) {
          setLoadingState = LoadingState.error;
        } else {
          chattedUsers.value = event;
          setLoadingState = LoadingState.complete;
        }
      },
    ).onError((error) {
      setLoadingState = LoadingState.error;
    });

    update();
  }

  Future _uploadFileToFirebaseStorage() {
    String path = 'image';
    String contentType = 'image/jpg';

    return FirebaseServices.uploadToFirebaseStorage(
        selectFile.value!, path, contentType);
  }
}
