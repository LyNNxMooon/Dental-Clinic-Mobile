import 'package:cached_network_image/cached_network_image.dart';
import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/controller/chat_controller.dart';
import 'package:dental_clinic_mobile/data/message_vo.dart';
import 'package:dental_clinic_mobile/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _authController = Get.put(AuthController());
final _chatController = Get.put(ChatController());

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, bottom: 25, right: 20, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios)),
                const Text(
                  "Admin",
                  style: titleStyle,
                ),
                const Gap(35)
              ],
            ),
            const Gap(10),
            Expanded(
              child: StreamBuilder(
                stream: _chatController.getMessages(
                    FirebaseAuth.instance.currentUser!.uid,
                    _authController.adminUID[0]),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Cannot load messages"),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LoadingWidget(),
                    );
                  }

                  if (snapshot.hasData &&
                      snapshot.data!.snapshot.value != null) {
                    Map<dynamic, dynamic> messagesMap =
                        snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                    List<MessageVO> messages =
                        messagesMap.values.map((message) {
                      return MessageVO.fromJson(
                          Map<String, dynamic>.from(message));
                    }).toList();

                    // Sort the messages by timeStamp in ascending order
                    messages.sort((a, b) => a.timeStamp.compareTo(b.timeStamp));

                    messages = messages.reversed.toList();

                    return ListView(
                      reverse: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      // Removed reverse: true to fix the ordering
                      children: messages
                          .map((message) => MessageItemView(message: message))
                          .toList(),
                    );
                  } else {
                    return const Center(
                      child: Text("No messages yet"),
                    );
                  }
                },
              ),
            ),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.64,
                  height: 60,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  child: TextField(
                    controller: _messageController,
                    cursorRadius: const Radius.circular(25),
                    decoration: InputDecoration(
                      hintText: "Send Message",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: IconButton(
                      onPressed: () {
                        _chatController.sendPhoto(
                            _authController.adminUID[0],
                            _authController.currentUser.value?.name ?? "",
                            _authController.currentUser.value?.url ?? "");
                      },
                      icon: const Icon(
                        Icons.photo,
                        size: 30,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: IconButton(
                      onPressed: () {
                        if (_messageController.text.isNotEmpty) {
                          _chatController
                              .sendMessages(
                                  _authController.adminUID[0],
                                  _messageController.text,
                                  _authController.currentUser.value?.name ?? "",
                                  _authController.currentUser.value?.url ?? "")
                              .then(
                            (value) {
                              _messageController.clear();
                            },
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        size: 30,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class MessageItemView extends StatelessWidget {
  const MessageItemView({super.key, required this.message});

  final MessageVO message;

  @override
  Widget build(BuildContext context) {
    // Determine the color and alignment based on the sender
    Color bubbleColor =
        (message.senderID == FirebaseAuth.instance.currentUser!.uid)
            ? kSecondaryColor
            : kMessageBubbleColor;

    var alignment = (message.senderID == FirebaseAuth.instance.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: alignment,
      child: Container(
        padding: message.message.startsWith('https')
            ? const EdgeInsets.all(2)
            : const EdgeInsets.all(10),
        constraints: const BoxConstraints(maxWidth: 220),
        decoration: BoxDecoration(
            color: bubbleColor, borderRadius: BorderRadius.circular(15)),
        child: message.message.startsWith('https')
            ? GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: SizedBox(
                        width: 200,
                        height: 350,
                        child: CachedNetworkImage(
                          imageUrl: message.message,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CupertinoActivityIndicator(),
                        )),
                  ),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: message.message,
                      width: 150,
                      height: 200,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CupertinoActivityIndicator(),
                    )),
              )
            : Text(
                message.message,
                style: const TextStyle(fontSize: 16),
              ),
      ),
    );
  }
}
