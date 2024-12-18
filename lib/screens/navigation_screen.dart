import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/controller/appointment_controller.dart';
import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/controller/chat_controller.dart';
import 'package:dental_clinic_mobile/controller/order_controller.dart';

import 'package:dental_clinic_mobile/screens/appointment_screen.dart';
import 'package:dental_clinic_mobile/screens/contact_screen.dart';
import 'package:dental_clinic_mobile/screens/doctor_info_screen.dart';
import 'package:dental_clinic_mobile/screens/emergency_saving_screen.dart';
import 'package:dental_clinic_mobile/screens/profile_screen.dart';
import 'package:dental_clinic_mobile/screens/treatment_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _authController = Get.put(AuthController());
final _chatController = Get.put(ChatController());
final _appointmentController = Get.put(AppointmentController());
final _orderController = Get.put(OrderController());

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final items = const [
    Icon(
      Icons.person_search_sharp,
      color: kPrimaryColor,
    ),
    Icon(
      Icons.date_range,
      color: kPrimaryColor,
    ),
    Icon(
      Icons.medication_liquid_sharp,
      color: kPrimaryColor,
    ),
    Icon(
      Icons.medical_services_sharp,
      color: kPrimaryColor,
    ),
    Icon(
      Icons.messenger_outline_sharp,
      color: kPrimaryColor,
    ),
    Icon(
      Icons.person,
      color: kPrimaryColor,
    )
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: kPrimaryColor,
        color: kSecondaryColor,
        animationDuration: const Duration(milliseconds: 320),
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;

            if (selectedIndex == 4 || selectedIndex == 3) {
              _authController.getUser();
              _authController.callAdmin();
            }

            if (selectedIndex == 1) {
              _authController.getUser();
              _authController.callAdmin();
              _appointmentController.callAppointments();
            }

            if (selectedIndex == 3) {
              _chatController.callChattedUsers();
              _orderController.callOrders();
            }
          });
        },
        items: items,
        index: index,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
        child: getSelectedWidget(index: index),
      ),
    ));
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const DoctorInfoScreen();
        break;
      case 1:
        widget = const AppointmentScreen();
        break;
      case 2:
        widget = const TreatmentScreen();
      case 3:
        widget = const EmergencySavingScreen();
        break;
      case 4:
        widget = const ContactScreen();
        break;
      case 5:
        widget = ProfileScreen();
      default:
        widget = const DoctorInfoScreen();
    }

    return widget;
  }
}
