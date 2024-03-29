import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/filter/filter_controller.dart';
import 'package:carnotautomart/ui/post%20details/pinch_image.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:carnotautomart/ui/widget/carnotmart_appbabr.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/helper/device_info.dart';
import '../widget/rounded_rectangle_button.dart';
import '../widget/title_and_textbox.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  final filterController = Get.find<FilterController>();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  List<Widget> _imageSliders = [];
  String featureIdsString = "18,17,16,15,14,10,9,8,7,6,5,4,3,2,1";
  List<int> featureIdsList = [];
  GlobalKey _globalKey=GlobalKey();
  @override
  void initState() {
    _imageSliders = List.generate(
      imgList.length,
      (index) => CachedNetworkImage(
        fit: BoxFit.cover,
        width: double.infinity,
        imageUrl:
            // 'https://cdn.pixabay.com/photo/2023/11/02/15/58/flower-8360946_1280.jpg',
            // 'https://imagedelivery.net/bc3AzSC5rzsaweEH1LLxAQ/eac56afb-a0c8-4bfc-a1e8-f5c6af9d6b00/Medium',
            imgList[index],
        placeholder: (context, url) => const Center(
          child: CupertinoActivityIndicator(
            color: colorDarkAsh,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          'assets/images/default.png',
          fit: BoxFit.cover,
          height: 65,
        ),
      ),

      // Image.network(imgList[index],
      //     fit: BoxFit.cover, width: double.infinity)
    );

    log(filterController.allFeature.length.toString());
    featureIdsList =
        featureIdsString.split(',').map((e) => int.parse(e)).toList();

    print(featureIdsList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Container(
        decoration: const BoxDecoration(color: colorLightOrange),
        child: SafeArea(
          top: true,
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            appBar: CarnotMartAppbar(
              title: 'Post Details',
              actionItem: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border_sharp,
                  )),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildCarouselSlider(
                      imageSliders: _imageSliders,
                      carouselController: _carouselController,
                      theme: theme),
                  _buildIdYearAndPriceSection(textTheme),
                  SpaceHelper.verticalSpace(5),
                  //Title
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        'Foreign Used 2012 Ford Explorer 7 WD With DVD And Reverse Camera',
                        style: textTheme.labelMedium?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(children: [
                      SvgPicture.asset('assets/icons/ic_location_grey.svg'),
                      SpaceHelper.horizontalSpace(5),
                      Text(
                        'Maryland',
                        style: textTheme.bodySmall?.copyWith(
                            color: colorDeepGray,
                            fontWeight: FontWeight.normal,
                            fontSize: 12),
                      )
                    ]),
                  ),
                  Wrap(
                      spacing: 10,
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.center,
                      runSpacing: 10,
                      children: [
                        SizedBox(
                            height: 30,
                            width: 95,
                            child: RoundedRectangleButton(
                                onPress: () {
                                  showGeneralDialog(
                                    // barrierLabel: "Contact Seller",
                                    barrierDismissible: true,
                                    barrierColor: Colors.black.withOpacity(0.5),
                                    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                                    transitionDuration:
                                        const Duration(milliseconds: 350),
                                    context: context,
                                    pageBuilder: (context, anim1, anim2) {
                                        return Scaffold(
                                          backgroundColor: Colors.transparent,
                                          resizeToAvoidBottomInset: true,
                                          body: Center(
                                            child: Material(
                                              color: Colors.grey.shade100,
                                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                                              child: ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  maxHeight: double.infinity,
                                                    maxWidth: DeviceInfo(context).width -40),
                                                child: Padding(
                                                  padding:const EdgeInsets.symmetric( horizontal: 10,),
                                                  child: Column(
                                                    mainAxisSize:MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:MainAxisAlignment.center,
                                                        children: [
                                                          Spacer(),
                                                          Align(alignment: Alignment.center,
                                                              child: Text(
                                                                'Contact Seller',
                                                                style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
                                                              )),
                                                          Expanded(
                                                            child: Align(
                                                              alignment: Alignment.centerRight,
                                                              child: IconButton(
                                                                splashRadius: 20,
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                icon: Icon(Icons.cancel),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      // SpaceHelper.verticalSpaceSmall,
                                                      Row(
                                                        mainAxisAlignment:MainAxisAlignment.center,
                                                        children: [
                                                          IconButton(
                                                              padding:const EdgeInsets.all(0),
                                                              splashRadius: 20,
                                                              onPressed: () {},
                                                              icon: SvgPicture.asset('assets/icons/ic_call.svg')),
                                                          SpaceHelper
                                                              .horizontalSpaceSmall,
                                                          IconButton(
                                                              padding:const EdgeInsets.all(0),
                                                              splashRadius: 20,
                                                              onPressed: () {},
                                                              icon: SvgPicture.asset(
                                                                  'assets/icons/ic_whatsapp.svg')),
                                                          SpaceHelper.horizontalSpaceSmall,
                                                          IconButton(
                                                              padding:const EdgeInsets.all(0),
                                                              splashRadius: 20,
                                                              onPressed: () {},
                                                              icon: SvgPicture.asset('assets/icons/ic_chat.svg')),
                                                        ],
                                                      ),
                                                      SpaceHelper.verticalSpaceSmall,
                                                     Row(
                                                        children: [
                                                          TextBoxtWithTitle(
                                                            headerTitle: 'Full Name',
                                                            title: 'Full Name',
                                                            width: (DeviceInfo(context).width-40) / 2 - 20,
                                                            keyboardType: TextInputType.text,
                                                          ),
                                                        const Spacer(),
                                                          TextBoxtWithTitle(
                                                            headerTitle: 'Email',
                                                            title: 'Email',
                                                            width: (DeviceInfo(context).width-40) / 2 - 20,
                                                            keyboardType: TextInputType.emailAddress,
                                                          ),
                                                        ],
                                                      ),
                                                      SpaceHelper.verticalSpaceSmall,
                                                        const TextBoxtWithTitle(
                                                            headerTitle: 'Phone Number',
                                                            title: 'Phone Number',
                                                            width: double.infinity,
                                                            keyboardType: TextInputType.number,
                                                          ),
                                                      SpaceHelper.verticalSpaceSmall,
                                                      Text('Message'),
                                                    Material(
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                        color: Colors.white,
                                                        child: TextFormField(
                                                          key: _globalKey,
                                                          // controller: _chatController.messageController,
                                                          autofocus: false,
                                                          maxLines: 5,
                                                          // minLines: 5,
                                                          decoration: InputDecoration(
                                                            isDense: true,
                                                            contentPadding: EdgeInsets.zero,
                                                            border: InputBorder.none,
                                                            //  border:_border ,
                                                            // enabledBorder: _border,
                                                            //  focusedBorder: _border,
                                                            
                                                            hintStyle: const TextStyle(
                                                                fontSize: 16.0,
                                                                fontWeight: FontWeight.normal,
                                                                color: colorDarkAsh),
                                                          ),
                                                          keyboardType: TextInputType.text,
                                                          style: const TextStyle(fontSize: 16.0, color: Colors.black),
                                                          onChanged: (text) {},
                                                          onTapOutside: (value) {
                                                            // log('onTapOutside called');
                                                          },
                                                          
                                                        ),
                                                      ),
                                                      SpaceHelper.verticalSpaceMedium,
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                     
                                    },
                                    transitionBuilder:(context, anim1, anim2, child) {
                                      return SlideTransition(
                                        position: Tween(begin: const Offset(0, -1),end: const Offset(0, 0)).animate(anim1),
                                        child: child,
                                      );
                                    },
                                  );
                                },
                                title: 'Contact seller',
                                backgroundColor: colorDeepGray.withOpacity(.2),
                                textStyle: textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal))),
                        SizedBox(
                            height: 30,
                            width: 95,
                            child: RoundedRectangleButton(
                                onPress: () {},
                                title: 'Make an offer',
                                backgroundColor: colorDeepGray.withOpacity(.2),
                                textStyle: textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal))),
                        SizedBox(
                            height: 30,
                            width: 95,
                            child: RoundedRectangleButton(
                                onPress: () {},
                                title: 'Compare',
                                backgroundColor: colorDeepGray.withOpacity(.2),
                                textStyle: textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal))),
                        SizedBox(
                            height: 30,
                            width: 95,
                            child: RoundedRectangleButton(
                                onPress: () {},
                                title: 'Finance',
                                backgroundColor: colorDeepGray.withOpacity(.2),
                                textStyle: textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal))),
                        SizedBox(
                            height: 30,
                            width: 95,
                            child: RoundedRectangleButton(
                                onPress: () {},
                                title: 'Insurance',
                                backgroundColor: colorDeepGray.withOpacity(.2),
                                textStyle: textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal))),
                        SizedBox(
                            height: 30,
                            width: 95,
                            child: RoundedRectangleButton(
                                onPress: () {},
                                title: 'Review',
                                backgroundColor: colorDeepGray.withOpacity(.2),
                                textStyle: textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal))),
                        SizedBox(
                            height: 30,
                            width: 180,
                            child: RoundedRectangleButton(
                                onPress: () {},
                                title: 'More from this seller',
                                backgroundColor: colorLightOrange,
                                textStyle: textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal))),
                      ]),
                  SpaceHelper.verticalSpaceMedium,
                  buildBrandTable(textTheme),
                  SpaceHelper.verticalSpaceMedium,
                  buildDescriptionBox(textTheme),
                  SpaceHelper.verticalSpaceMedium,
                  buildRegistrationInfo(textTheme),
                  SpaceHelper.verticalSpaceMedium,
                  buildOthersInfo(textTheme),
                  SpaceHelper.verticalSpaceMedium,
                  //Special Feature
                  SpaceHelper.verticalSpaceMedium,
                  buildSpecialFeature(context, textTheme),
                  SpaceHelper.verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Similar Products',
                          style: textTheme.bodySmall?.copyWith(
                              color: colorLightOrange,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  //  _buildSimilarProducts
                  SpaceHelper.verticalSpaceLarge,
                  SpaceHelper.verticalSpaceLarge,
                  SpaceHelper.verticalSpaceLarge,
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: SizedBox(
              height: 45,
              width: 45,
              child: FloatingActionButton(
                  backgroundColor: colorLightOrange,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {},
                  child: SvgPicture.asset(
                    'assets/icons/ic_chat_fav.svg',
                    height: 25,
                    width: 25,
                  )),
            ),
          ),
        ));
  }

  Container buildSpecialFeature(BuildContext context, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorLightGray.withOpacity(.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Special Features',
                style: textTheme.bodySmall?.copyWith(
                    color: colorLightOrange, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SpaceHelper.verticalSpaceSmall,
          Wrap(
            spacing: 10,
            runSpacing: 12,
            direction: Axis.horizontal,
            children: List.generate(featureIdsList.length, (index) {
              final featureId = featureIdsList[index].toString();
              final feature = filterController.allFeature
                  .firstWhere((item) => item.id == featureId);
              return SizedBox(
                width: DeviceInfo(context).width * .40,
                child: Row(
                  children: [
                    Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            color: colorDeepOrange,
                            borderRadius: BorderRadius.circular(1)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 1),
                        child: SvgPicture.asset(
                          'assets/icons/ic_check_orange.svg',
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                        )),
                    SpaceHelper.horizontalSpaceSmall,
                    Text(
                      '${feature.title}',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Container buildDescriptionBox(TextTheme textTheme) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorLightGray.withOpacity(.5)),
        child: Column(
          children: [
            SpaceHelper.verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: textTheme.bodySmall?.copyWith(
                        color: colorLightOrange, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                'Toyota Land cruiser comes with four wheel drive available transmission include 8 speed shiftable automatic. Land cruiser use car based platforms that increase fuel economy and ride comfort but they also limit towing capacity and off road capability. Land Cruiser’s old school design results in drawbacks when it comes to on road performance. Braking, steering and handling all suffer as a result of the Land Cruiser’s size. Land Cruiser is a relatively large vehicle but rear cargo space is lacking ant the third row is rather small',
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SpaceHelper.verticalSpaceSmall,
          ],
        ));
  }

  buildBrandTable(TextTheme textTheme) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorLightGray.withOpacity(.5)),
        child: Column(
          children: [
            SpaceHelper.verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brand Name',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Ford',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Driven',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('2500',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fuel Type',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Petrol',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Color',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Brown',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            SpaceHelper.verticalSpaceSmall,
          ],
        ));
  }

  buildRegistrationInfo(TextTheme textTheme) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorLightGray.withOpacity(.5)),
        child: Column(
          children: [
            SpaceHelper.verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Registration Info',
                    style: textTheme.bodySmall?.copyWith(
                        color: colorLightOrange, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brand Name',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('FORD',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Registration Number',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('None',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Body Type',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('SUV',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Model Name',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Explorer',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            SpaceHelper.verticalSpaceSmall,
          ],
        ));
  }

  buildOthersInfo(TextTheme textTheme) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorLightGray.withOpacity(.5)),
        child: Column(
          children: [
            SpaceHelper.verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Others Info',
                    style: textTheme.bodySmall?.copyWith(
                        color: colorLightOrange, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Type',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Car',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fuel Type',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Petrol',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Color',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Grey',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gear Box',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Automatic',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Condition',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Foregin Used',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Owners',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('1st',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Alloy Wheels',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('13" Alloy Wheels',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            SpaceHelper.verticalSpaceSmall,
          ],
        ));
  }

  Padding _buildIdYearAndPriceSection(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '#ID-46025',
                style: textTheme.bodySmall?.copyWith(color: colorDeepOrange),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: colorLightOrange.withOpacity(.1),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: colorLightOrange)),
                child: Text('2024',
                    style: textTheme.bodySmall
                        ?.copyWith(color: colorDeepOrange, fontSize: 12)),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '₦ 7,500000,000',
                style: textTheme.bodySmall?.copyWith(color: colorDeepOrange),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildCarouselSlider(
      {required List<Widget> imageSliders,
      required CarouselController carouselController,
      required ThemeData theme}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => PinchImageScreen(
                  image: imgList[_current],
                  imgList: imgList,
                  currentIndex: _current,
                ));
          },
          child: CarouselSlider(
            items: imageSliders,
            carouselController: carouselController,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: false,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        // SpaceHelper.verticalSpace(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () {
                log('Entry key: ${entry.key}');
                carouselController.animateToPage(entry.key);
                setState(() {
                  _current = entry.key;
                });
              },
              child: Container(
                width: 5.0,
                height: 5.0,
                margin:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key
                        ? colorDeepOrange
                        : Colors.black.withOpacity(0.4)
                    // (theme.brightness == Brightness.dark
                    //         ? Colors.black
                    //         : colorDeepOrange)
                    //     .withOpacity(_current == entry.key ? 0.9 : 0.4)
                    ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

// _buildSimilarProducts(TextTheme textTheme, List<BikeCarSpareParts> dataItem) {
//     if (dataItem.isEmpty) {
//       return Text(
//         'No Recent post found',
//         style: textTheme.bodySmall?.copyWith(color: colorDarkAsh),
//       );
//     }
//     return SizedBox(
//       height: 160,
//       child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           shrinkWrap: true,
//           physics: const BouncingScrollPhysics(),
//           itemCount: dataItem.length,
//           separatorBuilder: (context, index) =>
//               SpaceHelper.horizontalSpaceSmall,
//           itemBuilder: (context, index) {
//             BikeCarSpareParts bikeCarSpareParts = dataItem[index];
//             return GestureDetector(
//                onTap: () {
//       Get.to(() => const PostDetailsScreen());
//     },
//               child: SizedBox(
//                 width: 140,
//                 child: Card(
//                   elevation: 2,
//                   shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)) ,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: double.infinity,
//                         child: ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(8),
//                               topRight: Radius.circular(8)),
//                           child: CachedNetworkImage(
//                             fit: BoxFit.cover,
//                             height: 65,
//                             imageUrl:
//                                 // 'https://cdn.pixabay.com/photo/2023/11/02/15/58/flower-8360946_1280.jpg',
//                                 // 'https://imagedelivery.net/bc3AzSC5rzsaweEH1LLxAQ/eac56afb-a0c8-4bfc-a1e8-f5c6af9d6b00/Medium',
//                                 bikeCarSpareParts.photo ?? '',
//                             placeholder: (context, url) => const Center(
//                               child: CupertinoActivityIndicator(
//                                 color: colorDarkAsh,
//                               ),
//                             ),
//                             errorWidget: (context, url, error) => ClipRRect(
//                               borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(10),
//                                   topRight: Radius.circular(10)),
//                               child: Image.asset(
//                                 'assets/images/default.png',
//                                 fit: BoxFit.cover,
//                                 height: 65,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SpaceHelper.verticalSpace(2),
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 bikeCarSpareParts.title ?? '',
//                                 softWrap: true,
//                                 textAlign: TextAlign.left,
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 2,
//                                 style: textTheme.bodySmall?.copyWith(
//                                   color: colorDarkAsh,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               Text(
//                                 // '₦ 78,00,000 || 79000',
//                             (bikeCarSpareParts.mileage == '0') ?'₦ ${bikeCarSpareParts.priceinnaira}' ' | ''0'  :(bikeCarSpareParts.mileage != null)? '₦ ${bikeCarSpareParts.priceinnaira}' ' | ''${numberFormat(int.parse(bikeCarSpareParts.mileage.toString()))} Miles':'₦ ${bikeCarSpareParts.priceinnaira}' ' | ''0',
//                                 softWrap: true,
//                                 textAlign: TextAlign.left,
//                                 style: textTheme.bodySmall?.copyWith(
//                                   color: colorDeepOrange,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment.bottomLeft,
//                                 child: Text(
//                                   bikeCarSpareParts.location ?? '',
//                                   softWrap: true,
//                                   style: textTheme.bodySmall?.copyWith(
//                                     color: colorDeepOrange,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
}
