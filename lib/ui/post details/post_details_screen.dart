import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/filter/filter_controller.dart';
import 'package:carnotautomart/ui/post%20details/pinch_image.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/animated_dialog.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:carnotautomart/ui/widget/carnotmart_appbabr.dart';
import 'package:carnotautomart/ui/widget/checklogin_dialog.dart';
import 'package:carnotautomart/ui/widget/state_and_city_search_widget.dart';
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
  late FilterController _filterController;

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
  final PageController pageController = PageController();
  List<Widget> _imageSliders = [];
  String featureIdsString = "18,17,16,15,14,10,9,8,7,6,5,4,3,2,1";
  List<int> featureIdsList = [];
  GlobalKey _globalKey = GlobalKey();

  //for just text login status
  bool isLogingUser = false;
  //for text
  String? yearsValue;
  //checkBox value
  bool? isCheckBoxValue;

  @override
  void initState() {
    _filterController = Get.find<FilterController>();
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
    _filterController.brands.value = 'Brand';
    _filterController.model.value = 'Model';
    log(_filterController.allFeature.length.toString());
    featureIdsList = featureIdsString.split(',').map((e) => int.parse(e)).toList();

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
            body: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildCarouselSlider(imageSliders: _imageSliders, carouselController: _carouselController, theme: theme),
                    _buildIdYearAndPriceSection(textTheme),
                    SpaceHelper.verticalSpace(5),
                    //Title
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text(
                          'Foreign Used 2012 Ford Explorer 7 WD With DVD And Reverse Camera',
                          style: textTheme.labelMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(children: [
                        SvgPicture.asset('assets/icons/ic_location_grey.svg'),
                        SpaceHelper.horizontalSpace(5),
                        Text(
                          'Maryland',
                          style: textTheme.bodySmall?.copyWith(color: colorDeepGray, fontWeight: FontWeight.normal, fontSize: 12),
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
                                    showAnimatedDialog(context, contactSeller(context));
                                  },
                                  title: 'Contact seller',
                                  backgroundColor: colorDeepGray.withOpacity(.2),
                                  textStyle: textTheme.bodySmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal))),
                          SizedBox(
                              height: 30,
                              width: 95,
                              child: RoundedRectangleButton(
                                  onPress: () {
                                    isLogingUser == false
                                        ? makeAnOffer(context)
                                        : showAnimatedDialog(
                                            context,
                                            const CheckLoginDialog(),
                                          );
                                  },
                                  title: 'Make an offer',
                                  backgroundColor: colorDeepGray.withOpacity(.2),
                                  textStyle: textTheme.bodySmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal))),
                          SizedBox(
                              height: 30,
                              width: 95,
                              child: RoundedRectangleButton(
                                  onPress: () {
                                    compare(
                                      context,
                                    );
                                  },
                                  title: 'Compare',
                                  backgroundColor: colorDeepGray.withOpacity(.2),
                                  textStyle: textTheme.bodySmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal))),
                          SizedBox(
                              height: 30,
                              width: 95,
                              child: RoundedRectangleButton(
                                  onPress: () {
                                    financePopup(context);
                                  },
                                  title: 'Finance',
                                  backgroundColor: colorDeepGray.withOpacity(.2),
                                  textStyle: textTheme.bodySmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal))),
                          SizedBox(
                              height: 30,
                              width: 95,
                              child: RoundedRectangleButton(
                                  onPress: () {},
                                  title: 'Insurance',
                                  backgroundColor: colorDeepGray.withOpacity(.2),
                                  textStyle: textTheme.bodySmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal))),
                          SizedBox(
                              height: 30,
                              width: 95,
                              child: RoundedRectangleButton(
                                  onPress: () {},
                                  title: 'Review',
                                  backgroundColor: colorDeepGray.withOpacity(.2),
                                  textStyle: textTheme.bodySmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal))),
                          SizedBox(
                              height: 30,
                              width: 180,
                              child: RoundedRectangleButton(
                                  onPress: () {},
                                  title: 'More from this seller',
                                  backgroundColor: colorLightOrange,
                                  textStyle: textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.normal))),
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
                            style: textTheme.bodySmall?.copyWith(color: colorLightOrange, fontWeight: FontWeight.w500),
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

  Future<dynamic> financePopup(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return dynamicCupertinoModelPopWithAppBar(
      context: context,
      appbarName: "LOAN PROVIDER",
      body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10.0, top: 10.0),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    height: 88,
                    width: 114,
                    fit: BoxFit.cover,
                    imageUrl: 'https://cdn.pixabay.com/photo/2023/11/02/15/58/flower-8360946_1280.jpg',
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
                  SpaceHelper.horizontalSpaceSmall,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fina Trust icrofinance Bank",
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, fontSize: 12.0, color: Colors.black),
                        ),
                        SpaceHelper.verticalSpace(5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Vehicle Amount",
                              style: textTheme.bodySmall?.copyWith(
                                color: colorDeepGray,
                                fontSize: 10,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text(
                                "Comapre",
                                style: textTheme.bodySmall?.copyWith(color: Colors.orange[900], fontWeight: FontWeight.normal, fontSize: 10.0),
                              ),
                            ),
                          ],
                        ),
                        SpaceHelper.verticalSpace(5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                columnTitle("LTV"),
                                columnTitle("30 %"),
                              ],
                            ),
                            Column(
                              children: [
                                columnTitle("Interest"),
                                columnTitle("35.00 %"),
                              ],
                            ),
                            Column(
                              children: [
                                columnTitle("Terms"),
                                columnTitle("12"),
                              ],
                            )
                          ],
                        ),
                        SpaceHelper.verticalSpace(5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25.0),
                                        topRight: Radius.circular(25.0),
                                      ),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height - 200.0,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Required Documents",
                                                    style: textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 12.0),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      icon: const Icon(
                                                        Icons.clear,
                                                        color: Colors.black,
                                                      ))
                                                ],
                                              )
                                            ],
                                          ));
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                    color: colorLightOrange.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: colorLightOrange)),
                                child: Text('Documents', style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 10)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                dynamicCupertinoModelPopWithAppBar(
                                    context: context,
                                    appbarName: "Eligibility Question".toUpperCase(),
                                    body: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "Please answer a few questions to determine if you're eligible or not",
                                            style: textTheme.bodySmall?.copyWith(
                                              color: colorDeepGray,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "Question 1 of 5",
                                            style: textTheme.bodySmall?.copyWith(
                                              color: colorDeepOrange,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: PageView(
                                            physics: NeverScrollableScrollPhysics(),
                                            onPageChanged: (value) {},
                                            controller: pageController,
                                            children: [
                                              radioButtonQuestion(context, "Are you 18 years and above ?"),
                                              radioButtonQuestion(context, "Are you a salary earner ?"),
                                              textButtonQuestion(context: context, question: "If yes how much do you earn ?"),
                                              checkBoxButtonQuestion(context),
                                              submitBottonQuestion(context)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                    color: colorLightOrange.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: colorLightOrange)),
                                child: Text('Check Eligibility', style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 10)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SpaceHelper.verticalSpace(10.0);
            },
          )),
    );
  }

  Container submitBottonQuestion(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Affordability Question",
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            SpaceHelper.verticalSpace(15.0),
            Text(
              "Vehicle Amount",
              style: textTheme.bodySmall?.copyWith(
                color: colorDeepGray,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            SpaceHelper.verticalSpace(5.0),
            Text(
              "₦ 18,000,000",
              style: textTheme.bodySmall?.copyWith(
                color: colorDeepOrange,
                fontSize: 10,
              ),
            ),
            const Divider(),
            SpaceHelper.verticalSpace(5.0),
            Text(
              "Maximum Loan Amount",
              style: textTheme.bodySmall?.copyWith(
                color: colorDeepGray,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            SpaceHelper.verticalSpace(5.0),
            Text(
              "₦ 12,600,000",
              style: textTheme.bodySmall?.copyWith(
                color: colorDeepOrange,
                fontSize: 10,
              ),
            ),
            const Divider(),
            SpaceHelper.verticalSpace(20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CupertinoRadio(
                    value: "yes",
                    groupValue: yearsValue,
                    onChanged: (value) {
                      yearsValue = value;
                    }),
                SpaceHelper.horizontalSpace(5.0),
                Text(
                  "Take Max Amount",
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                )
              ],
            ),
            SpaceHelper.verticalSpace(15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CupertinoRadio(
                    value: "No",
                    groupValue: yearsValue,
                    onChanged: (value) {
                      yearsValue = value;
                    }),
                SpaceHelper.horizontalSpace(5.0),
                Text(
                  "Custom Loan Amount",
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                )
              ],
            ),
            SpaceHelper.verticalSpace(10.0),
            monthlyIncomeTextFiled(autoFocus: false, labelText: "Monthly Income"),
            SpaceHelper.verticalSpace(5.0),
            monthlyIncomeTextFiled(autoFocus: false, labelText: "Custom Amount"),
            SpaceHelper.verticalSpace(10.0),
            Align(
              alignment: Alignment.center,
              child: nextButton(
                  title: "Submit",
                  context: context,
                  onPress: () async{
                   await showDialog(context: context, builder: (BuildContext ){
                       return CupertinoAlertDialog(
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Congratulations",style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal,color: Colors.black),)),
                          content: Align(
                            alignment: Alignment.centerLeft,
                            child: Text ("You are eligible for apply!",style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 12.0),)),
                         actions: [
                              TextButton(onPressed: (){}, child: Text("kjihj")),
                         ],
                       
                       );
                   });
                  }),
            ),
            SpaceHelper.verticalSpace(10.0),
            Align(
              alignment: Alignment.center,
              child: previousButton(
                  context: context,
                  onPress: () {
                    pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.ease);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Container monthlyIncomeTextFiled({required bool autoFocus, required String labelText}) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: colorDeepGray.withOpacity(0.2),
      child: TextFormField(
        autofocus: autoFocus,
        scrollPadding: EdgeInsets.zero,
        style: textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              "₦",
              style: textTheme.bodySmall?.copyWith(
                color: colorDeepOrange,
                fontSize: 12,
              ),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(maxHeight: 20, maxWidth: 25),
          labelText: labelText,
          labelStyle: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 12, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  Column checkBoxButtonQuestion(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          "Are you a business owner or an employee?",
          style: textTheme.bodySmall?.copyWith(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
        SpaceHelper.verticalSpace(10.0),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      side: BorderSide(color: Colors.redAccent),
                      value: false,
                      onChanged: (value) {
                        print(value);
                      }),
                  Text(
                    "data",
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                    ),
                  ),
                ],
              );
            }),
        SpaceHelper.verticalSpace(15.0),
        nextButton(
            context: context,
            onPress: () {
              pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
            }),
        SpaceHelper.verticalSpace(10.0),
        previousButton(
            context: context,
            onPress: () {
              pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.ease);
            }),
      ],
    );
  }

  Column textButtonQuestion({required BuildContext context, required String question}) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          question,
          style: textTheme.bodySmall?.copyWith(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
        SpaceHelper.verticalSpace(10.0),
        TextFormField(
          scrollPadding: EdgeInsets.zero,
          textAlign: TextAlign.center,
          style: textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 12.0),
          maxLines: 1,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
              border: InputBorder.none,
              hintText: "Answer",
              hintStyle: textTheme.bodySmall?.copyWith(
                color: colorDeepGray,
                fontSize: 10.0,
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 0.2,
            color: Colors.black,
          ),
        ),
        SpaceHelper.verticalSpace(15.0),
        nextButton(
            context: context,
            onPress: () {
              pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
            }),
        SpaceHelper.verticalSpace(10.0),
        previousButton(
            context: context,
            onPress: () {
              pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.ease);
            }),
      ],
    );
  }

  Column radioButtonQuestion(BuildContext context, String question) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          question,
          style: textTheme.bodySmall?.copyWith(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
        SpaceHelper.verticalSpace(5.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoRadio(
                    value: "yes",
                    groupValue: yearsValue,
                    onChanged: (value) {
                      yearsValue = value;
                    }),
                SpaceHelper.horizontalSpace(5.0),
                Text(
                  "Yes",
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoRadio(
                    value: "No",
                    groupValue: yearsValue,
                    onChanged: (value) {
                      yearsValue = value;
                    }),
                SpaceHelper.horizontalSpace(5.0),
                Text(
                  "No ",
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                )
              ],
            ),
            SpaceHelper.verticalSpace(10.0),
            nextButton(
                context: context,
                onPress: () {
                  pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
                }),
            SpaceHelper.verticalSpace(10.0),
            previousButton(
                context: context,
                onPress: () {
                  pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.ease);
                }),
          ],
        ),
      ],
    );
  }

  BaseButton nextButton({required BuildContext context, void Function()? onPress, String? title}) {
    return BaseButton(
      height: 30.0,
      width: 250,
      onPress: onPress,
      title: title ?? "Next Question",
      backgroundColor: Colors.redAccent,
      textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10.0),
    );
  }

  BaseButton previousButton({required BuildContext context, void Function()? onPress}) {
    return BaseButton(
      borderColor: Colors.redAccent,
      isBorder: true,
      height: 30.0,
      width: 250,
      onPress: onPress,
      title: "Previous Question",
      backgroundColor: Colors.transparent,
      textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10.0, color: colorDeepGray),
    );
  }

  //appbar with scafold
  Future<dynamic> dynamicCupertinoModelPopWithAppBar({required BuildContext context, required String appbarName, required Widget body}) {
    return showCupertinoModalPopup(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          final textTheme = Theme.of(context).textTheme;
          return Scaffold(
              appBar: AppBar(
                backgroundColor: colorLightOrange,
                automaticallyImplyLeading: false,
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                  splashRadius: 30,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                title: Text(appbarName, style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500, color: Colors.white)),
              ),
              body: body);
        });
  }

//text title with 1 column two tex
  Text columnTitle(String text) {
    final textTheme = Theme.of(context).textTheme;
    return Text(text, style: textTheme.bodySmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 10.0));
  }

  Future<dynamic> compare(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return customCupertinoModelPopup(
        context,
        "Compare",
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Brand',
                style: textTheme.bodySmall?.copyWith(color: Colors.black, letterSpacing: .3, fontWeight: FontWeight.normal),
              ),
              SpaceHelper.verticalSpace(5.0),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                color: Colors.white,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                highlightElevation: .5,
                elevation: 0,
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return StateAndCitySearchWidget(
                          appBarTitle: 'Select Brand',
                          selectionType: 'Brand',
                          notifier: (seletedData) {
                            log('Selected result: ${seletedData['name']}');
                            _filterController.brands.value = seletedData['name'];
                          },
                          findFromSearch: _filterController.dropDownBrand,
                        );
                      });
                },
                child: Row(children: [
                  Obx(
                    () => Text(
                      _filterController.brands.value,
                      style: textTheme.bodySmall
                          ?.copyWith(color: _filterController.brands.value == 'Brand' ? colorDeepGray : Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: colorDeepGray,
                  )
                ]),
              ),
              SpaceHelper.verticalSpaceSmall,
              Text(
                'Model',
                style: textTheme.bodySmall?.copyWith(color: Colors.black, letterSpacing: .3, fontWeight: FontWeight.normal),
              ),
              SpaceHelper.verticalSpace(5.0),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                color: Colors.white,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                highlightElevation: .5,
                elevation: 0,
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return StateAndCitySearchWidget(
                          appBarTitle: 'Select Model',
                          selectionType: 'Model',
                          notifier: (seletedData) {
                            log('Selected result: ${seletedData['name']}');
                            _filterController.model.value = seletedData['name'];
                          },
                          findFromSearch: _filterController.dropDownModel,
                        );
                      });
                },
                child: Row(children: [
                  Obx(
                    () => Text(
                      _filterController.model.value,
                      style: textTheme.bodySmall
                          ?.copyWith(color: _filterController.model.value == 'Model' ? colorDeepGray : Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: colorDeepGray,
                  )
                ]),
              ),
              SpaceHelper.verticalSpaceSmall,
              Text(
                'Select Year',
                style: textTheme.bodySmall?.copyWith(color: Colors.black, letterSpacing: .3, fontWeight: FontWeight.normal),
              ),
              SpaceHelper.verticalSpace(5.0),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                color: Colors.white,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                highlightElevation: .5,
                elevation: 0,
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return StateAndCitySearchWidget(
                          appBarTitle: 'Select Year',
                          selectionType: 'Select Year',
                          notifier: (seletedData) {
                            log('Selected result: ${seletedData['name']}');
                            _filterController.model.value = seletedData['name'];
                          },
                          findFromSearch: _filterController.dropDownModel,
                        );
                      });
                },
                child: Row(children: [
                  Obx(
                    () => Text(
                      _filterController.model.value,
                      style: textTheme.bodySmall
                          ?.copyWith(color: _filterController.model.value == 'Model' ? colorDeepGray : Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: colorDeepGray,
                  )
                ]),
              ),
              SpaceHelper.verticalSpaceMedium,
              Align(
                alignment: Alignment.center,
                child: BaseButton(
                    onPress: () {},
                    height: 30.0,
                    width: 90.0,
                    title: "Search",
                    backgroundColor: Colors.red,
                    textStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
              ),
              SpaceHelper.verticalSpace(10.0),
            ],
          ),
        ));
  }

  makeAnOffer(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    showAnimateDialogWithBox(
        context,
        "Make an offer",
        Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: colorDeepGray.withOpacity(.2),
                ),
                child: RichText(
                  text: TextSpan(
                      style: textTheme.bodySmall?.copyWith(color: Colors.black, letterSpacing: .3, fontWeight: FontWeight.normal),
                      text: "Original Price :",
                      children: [
                        TextSpan(
                          style: textTheme.bodySmall?.copyWith(color: colorDeepOrange),
                          text: "₦ 7,500000,000",
                        )
                      ]),
                )),
            SpaceHelper.verticalSpaceMedium,
            TextBoxtWithTitle(
              headerTitle: 'Offer Price',
              title: 'Offer Price',
              width: (DeviceInfo(context).width - 40) - 20,
              keyboardType: TextInputType.text,
            ),
            SpaceHelper.verticalSpaceSmall,
            TextBoxtWithTitle(
              headerTitle: 'Full Name',
              title: 'Full Name',
              width: (DeviceInfo(context).width - 40) - 20,
              keyboardType: TextInputType.text,
            ),
            SpaceHelper.verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Message',
                  style: textTheme.bodySmall?.copyWith(color: Colors.black, letterSpacing: .3, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            SpaceHelper.verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                color: Colors.white,
                child: TextFormField(
                  scrollPhysics: BouncingScrollPhysics(),
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

                    hintStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: colorDarkAsh),
                  ),
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  onChanged: (text) {},
                  onTapOutside: (value) {
                    // log('onTapOutside called');
                  },
                ),
              ),
            ),
            SpaceHelper.verticalSpaceMedium,
            Align(
              alignment: Alignment.center,
              child: BaseButton(
                  onPress: () {},
                  height: 30.0,
                  width: 90.0,
                  title: "Send",
                  backgroundColor: Colors.red,
                  textStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
            ),
            SpaceHelper.verticalSpace(10.0),
          ],
        ));
  }

  contactSeller(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Material(
        color: Colors.grey.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: double.infinity, maxWidth: DeviceInfo(context).width - 40),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Align(
                          alignment: Alignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          padding: const EdgeInsets.all(0), splashRadius: 20, onPressed: () {}, icon: SvgPicture.asset('assets/icons/ic_call.svg')),
                      SpaceHelper.horizontalSpaceSmall,
                      IconButton(
                          padding: const EdgeInsets.all(0),
                          splashRadius: 20,
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/icons/ic_whatsapp.svg')),
                      SpaceHelper.horizontalSpaceSmall,
                      IconButton(
                          padding: const EdgeInsets.all(0), splashRadius: 20, onPressed: () {}, icon: SvgPicture.asset('assets/icons/ic_chat.svg')),
                    ],
                  ),
                  SpaceHelper.verticalSpaceSmall,
                  Row(
                    children: [
                      TextBoxtWithTitle(
                        headerTitle: 'Full Name',
                        title: 'Full Name',
                        width: (DeviceInfo(context).width - 40) / 2 - 20,
                        keyboardType: TextInputType.text,
                      ),
                      const Spacer(),
                      TextBoxtWithTitle(
                        headerTitle: 'Email Address',
                        title: 'Email',
                        width: (DeviceInfo(context).width - 40) / 2 - 20,
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Message',
                      style: textTheme.bodySmall?.copyWith(color: Colors.black, letterSpacing: .3, fontWeight: FontWeight.normal),
                    ),
                  ),
                  SpaceHelper.verticalSpaceSmall,
                  Material(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    color: Colors.white,
                    child: TextFormField(
                      scrollPhysics: BouncingScrollPhysics(),
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

                        hintStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: colorDarkAsh),
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
                  Align(
                    alignment: Alignment.center,
                    child: BaseButton(
                        onPress: () {},
                        height: 30.0,
                        width: 90.0,
                        title: "Send",
                        backgroundColor: Colors.red,
                        textStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
                  ),
                  SpaceHelper.verticalSpace(10.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildSpecialFeature(BuildContext context, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorLightGray.withOpacity(.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Special Features',
                style: textTheme.bodySmall?.copyWith(color: colorLightOrange, fontWeight: FontWeight.w500),
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
              final feature = _filterController.allFeature.firstWhere((item) => item.id == featureId);
              return SizedBox(
                width: DeviceInfo(context).width * .40,
                child: Row(
                  children: [
                    Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(color: colorDeepOrange, borderRadius: BorderRadius.circular(1)),
                        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                        child: SvgPicture.asset(
                          'assets/icons/ic_check_orange.svg',
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        )),
                    SpaceHelper.horizontalSpaceSmall,
                    Text(
                      '${feature.title}',
                      style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorLightGray.withOpacity(.5)),
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
                    style: textTheme.bodySmall?.copyWith(color: colorLightOrange, fontWeight: FontWeight.w500),
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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorLightGray.withOpacity(.5)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Ford', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('2500', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Petrol', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Brown', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorLightGray.withOpacity(.5)),
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
                    style: textTheme.bodySmall?.copyWith(color: colorLightOrange, fontWeight: FontWeight.w500),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('FORD', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('None', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('SUV', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Explorer', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorLightGray.withOpacity(.5)),
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
                    style: textTheme.bodySmall?.copyWith(color: colorLightOrange, fontWeight: FontWeight.w500),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Car', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Petrol', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Grey', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Automatic', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('Foregin Used', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('1st', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                  Text('13" Alloy Wheels', style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontWeight: FontWeight.normal)),
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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: colorLightOrange.withOpacity(.1), borderRadius: BorderRadius.circular(25), border: Border.all(color: colorLightOrange)),
                child: Text('2024', style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 12)),
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

  _buildCarouselSlider({required List<Widget> imageSliders, required CarouselController carouselController, required ThemeData theme}) {
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
                margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5),
                decoration: BoxDecoration(shape: BoxShape.circle, color: _current == entry.key ? colorDeepOrange : Colors.black.withOpacity(0.4)
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
