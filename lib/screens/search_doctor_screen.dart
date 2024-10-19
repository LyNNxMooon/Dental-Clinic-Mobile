import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/controller/doctor_controller.dart';
import 'package:dental_clinic_mobile/data/doctor_vo.dart';
import 'package:dental_clinic_mobile/screens/doctor_detail_screen.dart';
import 'package:dental_clinic_mobile/widgets/search_item_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _doctorController = Get.put(DoctorController());

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
    _doctorController.callSearch(searchResultList);
    super.didChangeDependencies();
  }

  _onSearchChanged() {
    searchResultList();
  }

  searchResultList() {
    List<DoctorVO> showResults = [];
    if (_searchController.text.isNotEmpty) {
      for (var snapShot in _doctorController.searchList) {
        String name = snapShot.name.toLowerCase();

        if (name.contains(_searchController.text.toLowerCase())) {
          showResults.add(snapShot);
        }
      }
    } else {
      showResults = List.from(_doctorController.searchList);
    }

    _doctorController.searchedDoctors.value = showResults;
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
      body: Obx(() => _doctorController.doctorsList.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.to(() => DoctorDetailScreen(
                              doctor:
                                  _doctorController.searchedDoctors[index]));
                        },
                        child: SearchItemTile(
                            url: _doctorController.searchedDoctors[index].url,
                            name: _doctorController.searchedDoctors[index].name,
                            specialist: _doctorController
                                .searchedDoctors[index].specialist),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: _doctorController.searchedDoctors.length),
            )),
    ));
  }
}
