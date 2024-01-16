import 'dart:developer';

import 'package:carnotautomart/ui/car_bike_parts/recent_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/remote/model/car_bike_spare_parts_response.dart';
import '../utils/app_colors.dart';
import '../utils/helper/spacing_helper.dart';
import '../widget/car_list_tile.dart';
import '../widget/carnotmart_appbabr.dart';

class RecentCarBikeSparePartsScreen extends StatefulWidget {
  const RecentCarBikeSparePartsScreen({super.key, required this.vehicleType,required this.appbarTitle});

  final String vehicleType;
  final String appbarTitle;

  @override
  State<RecentCarBikeSparePartsScreen> createState() =>
      _RecentCarBikeSparePartsScreenState();
}

class _RecentCarBikeSparePartsScreenState
    extends State<RecentCarBikeSparePartsScreen> {
  ScrollController scrollController = ScrollController();
  final RecentPostController _recentPostController =
      Get.put(RecentPostController());
  int currentPage = 1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      loadInitData(currentPage);
    });

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
       
        setState(() {
        currentPage++;
        });
         log('Scrolling to max');
        log(currentPage.toString());
        loadInitData(currentPage);
      }
    });
  }

  loadInitData(int page) {
    _recentPostController.getRecentPostData(
        vehicleType: widget.vehicleType, page: page);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: const BoxDecoration(color: colorLightOrange),
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          appBar:  CarnotMartAppbar(
            title: widget.appbarTitle,
            isFilter: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => ListView.separated(
                      // controller: scrollController,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount:
                          _recentPostController.carsBikeSpareParts.length,
                      itemBuilder: (context, index) {
                        RecentBikeCarSpareParts carsBikeSpareParts =
                            _recentPostController.carsBikeSpareParts[index];
                        return CarListTile(
                          tileData: carsBikeSpareParts,
                        );
                      },
                      separatorBuilder: (context, index) {
                        // return const Divider(
                        //   color: Colors.black,
                        //   thickness: .2,
                        // );
                        return Container(
                          color: Colors.black,
                          height: .3,
                        );
                      },
                    ),
                  ),
                  SpaceHelper.verticalSpaceSmall,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
