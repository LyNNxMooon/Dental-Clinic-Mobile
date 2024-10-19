// ignore_for_file: deprecated_member_use

import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchItemTile extends StatelessWidget {
  const SearchItemTile(
      {super.key,
      required this.url,
      required this.name,
      required this.specialist});

  final String url;
  final String name;
  final String specialist;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: kBtnGrayColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 3, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, 3), // Offset of the shadow
          ),
        ], //border corner radius
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(url, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 90,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 85,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      specialist,
                      style: const TextStyle(color: kSecondaryColor),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
