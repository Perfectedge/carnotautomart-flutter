import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/filter/filter_screen.dart';
import 'package:carnotautomart/ui/post%20details/post_details_screen.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/remote/model/recentry_post_response.dart';
import '../../car_bike_parts/recent_car_bike_spare_parts_screen.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.index});
  final ValueChanged index;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = Get.put(HomeController());
    if (_homeController.carData.isEmpty || _homeController.bikeData.isEmpty || _homeController.sparePartsData.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timestamp) {
        _homeController.getRecentHomePageData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpaceHelper.verticalSpaceMedium,
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Welcome to Carnotautomart',
                  style: textTheme.bodySmall?.copyWith(color: colorDarkAsh, letterSpacing: .3),
                )),
            SpaceHelper.verticalSpaceSmall,
            //Title and See All
            _titleAndSeeAll(textTheme, 'What would you like to do?', () {
              widget.index(1);
            }),
            SpaceHelper.verticalSpaceSmall,
            if (_homeController.homeServiceList.isNotEmpty) _serviceSection(textTheme),
            SpaceHelper.verticalSpaceMedium,
            _titleAndSeeAll(textTheme, 'Recently Posted Cars', () {
              Get.to(() => const RecentCarBikeSparePartsScreen(
                    vehicleType: 'car',
                    appbarTitle: 'Recently Posted Car',
                  ));
            }),
            SpaceHelper.verticalSpaceSmall,
            Obx(() => _recentlyPostdItems(textTheme, _homeController.carData)),
            SpaceHelper.verticalSpaceSmall,
            //Title and See All
            _titleAndSeeAll(textTheme, 'Recently Posted Motorbike', () {
              Get.to(() => const RecentCarBikeSparePartsScreen(
                    vehicleType: 'motorbike',
                    appbarTitle: 'Recently Posted Motorbike',
                  ));
            }),
            SpaceHelper.verticalSpaceSmall,
            Obx(
              () => _recentlyPostdItems(textTheme, _homeController.bikeData),
            ),
            SpaceHelper.verticalSpaceSmall,
            //Title and See All
            _titleAndSeeAll(textTheme, 'Recently Posted Spare Parts', () {
              Get.to(() => const RecentCarBikeSparePartsScreen(vehicleType: 'spare-parts', appbarTitle: 'Recently Posted Spare Parts'));
            }),
            SpaceHelper.verticalSpaceSmall,
            Obx(
              () => _recentlyPostdItems(textTheme, _homeController.sparePartsData),
            ),

            SpaceHelper.verticalSpaceSmall,
            Text(
              'Get Financing For Your Car',
              style: textTheme.bodyMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
            ),
            SpaceHelper.verticalSpaceSmall,
            Text(
              'We can help you get your dream car on load',
              style: textTheme.labelSmall?.copyWith(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 12, letterSpacing: 0),
            ),
            SpaceHelper.verticalSpaceSmall,
            SizedBox(
                width: 200,
                child: BaseButton(
                  onPress: () {},
                  title: 'Get Started',
                  backgroundColor: colorDeepOrange,
                  textStyle: textTheme.labelMedium?.copyWith(color: Colors.white),
                )),
            SpaceHelper.verticalSpaceLarge,
          ],
        ),
      ),
    );
  }

  _recentlyPostdItems(TextTheme textTheme, List<BikeCarSpareParts> dataItem) {
    if (dataItem.isEmpty) {
      return Text(
        'No Recent post found',
        style: textTheme.bodySmall?.copyWith(color: colorDarkAsh),
      );
    }
    return GestureDetector(
      onTap: () {
        Get.to(() => const PostDetailsScreen());
      },
      child: SizedBox(
        height: 160,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: dataItem.length,
            separatorBuilder: (context, index) => SpaceHelper.horizontalSpaceSmall,
            itemBuilder: (context, index) {
              BikeCarSpareParts bikeCarSpareParts = dataItem[index];
              return SizedBox(
                width: 140,
                child: Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            height: 65,
                            imageUrl:
                                // 'https://cdn.pixabay.com/photo/2023/11/02/15/58/flower-8360946_1280.jpg',
                                // 'https://imagedelivery.net/bc3AzSC5rzsaweEH1LLxAQ/eac56afb-a0c8-4bfc-a1e8-f5c6af9d6b00/Medium',
                                bikeCarSpareParts.photo ?? '',
                            placeholder: (context, url) => const Center(
                              child: CupertinoActivityIndicator(
                                color: colorDarkAsh,
                              ),
                            ),
                            errorWidget: (context, url, error) => ClipRRect(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: Image.asset(
                                'assets/images/default.png',
                                fit: BoxFit.cover,
                                height: 65,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SpaceHelper.verticalSpace(2),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                bikeCarSpareParts.title ?? '',
                                softWrap: true,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorDarkAsh,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                // '₦ 78,00,000 || 79000',
                                '₦ ${bikeCarSpareParts.priceinnaira}??'
                                ' ||',

                                softWrap: true,
                                textAlign: TextAlign.left,
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorDeepOrange,
                                  fontSize: 12,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  bikeCarSpareParts.location ?? '',
                                  softWrap: true,
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorDeepOrange,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  SizedBox _serviceSection(TextTheme textTheme) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: _homeController.homeServiceList.length,
        itemBuilder: (context, index) => Container(
          // padding: const EdgeInsets.all(5),
          width: 130,
          child: Card(
            elevation: 4,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _homeController.homeServiceList[index].imagePath ?? '',
                    height: 50,
                    width: 50,
                  ),
                  SpaceHelper.verticalSpaceSmall,
                  Text(
                    _homeController.homeServiceList[index].name ?? '',
                    style: textTheme.bodySmall?.copyWith(color: colorDarkAsh, fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => SpaceHelper.horizontalSpaceMedium,
      ),
    );
  }

  Row _titleAndSeeAll(TextTheme textTheme, String text, VoidCallback ontTap) {
    return Row(
      children: [
        Text(
          text,
          style: textTheme.bodySmall?.copyWith(color: colorDarkAsh, letterSpacing: .3),
        ),
        const Spacer(),
        InkWell(
          onTap: ontTap,
          child: Row(
            children: [
              Text('See all', style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, letterSpacing: 0)),
              SpaceHelper.horizontalSpace(2),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 10,
                color: colorDeepOrange,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
