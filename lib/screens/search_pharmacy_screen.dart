// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dental_clinic_mobile/constants/colors.dart';

import 'package:dental_clinic_mobile/controller/pharmacy_controller.dart';

import 'package:dental_clinic_mobile/data/pharmacy_vo.dart';

import 'package:dental_clinic_mobile/widgets/loading_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

final _pharmacyController = Get.put(PharmacyController());

class SearchPharmacyScreen extends StatefulWidget {
  const SearchPharmacyScreen({super.key});

  @override
  State<SearchPharmacyScreen> createState() => _SearchPharmacyScreenState();
}

class _SearchPharmacyScreenState extends State<SearchPharmacyScreen> {
  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _pharmacyController.callSearch(searchResultList);
    super.didChangeDependencies();
  }

  _onSearchChanged() {
    searchResultList();
  }

  searchResultList() {
    List<PharmacyVO> showResults = [];
    if (_searchController.text.isNotEmpty) {
      for (var snapShot in _pharmacyController.searchList) {
        String name = snapShot.name.toLowerCase();

        if (name.contains(_searchController.text.toLowerCase())) {
          showResults.add(snapShot);
        }
      }
    } else {
      showResults = List.from(_pharmacyController.searchList);
    }

    _pharmacyController.searchedPharmacy.value = showResults;
  }

  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            )),
        title: CupertinoSearchTextField(
          controller: _searchController,
        ),
      ),
      body: Obx(() => _pharmacyController.pharmacies.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {},
                        child: searchItemTile(
                            context,
                            _pharmacyController.searchedPharmacy[index].name,
                            _pharmacyController.searchedPharmacy[index].price,
                            _pharmacyController.searchedPharmacy[index].url),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: _pharmacyController.searchedPharmacy.length),
            )),
    ));
  }

  Widget searchItemTile(
      BuildContext context, String name, double price, String url) {
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
                  child: CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const LoadingWidget(),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  ),
                  SizedBox(
                    width: 90,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "$price Ks",
                            style: const TextStyle(color: kSecondaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          IconButton(
              onPressed: () {
                _pharmacyController.addItemToCart(name, url, price);
                _pharmacyController.update();

                Fluttertoast.showToast(
                    msg: "Item Added to cart",
                    backgroundColor: kSecondaryColor,
                    textColor: kFourthColor);
              },
              icon: const Icon(Icons.add_shopping_cart_sharp))
        ],
      ),
    );
  }
}
