import 'dart:developer';

import 'package:carnotautomart/ui/filter/filter_controller.dart';
import 'package:carnotautomart/ui/post%20details/apply_for_loan.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:carnotautomart/ui/widget/state_and_city_search_widget.dart';
import 'package:carnotautomart/ui/widget/title_and_textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EligibilityScreen extends StatefulWidget {
  const EligibilityScreen({super.key});

  @override
  State<EligibilityScreen> createState() => _EligibilityScreenState();
}

class _EligibilityScreenState extends State<EligibilityScreen> {
  late FilterController _filterController;
  final PageController pageController = PageController();
  String? yearsValue;

  @override
  void initState() {
    _filterController = Get.find<FilterController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
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
          title: Text("Eligibility Question", style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500, color: Colors.white)),
        ),
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
                  onPress: () async {
                    await showDialog(
                        context: context,
                        builder: (BuildContext) {
                          return CupertinoAlertDialog(
                            title: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Congratulations",
                                  style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0),
                                )),
                            content: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "You are eligible for apply!",
                                  style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 12.0),
                                )),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    "CANCEL",
                                    style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal, color: Colors.redAccent, fontSize: 10.0),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Get.to(() => ApplyForLoan(), transition: Transition.downToUp, duration: Duration(seconds: 1));
                                  },
                                  child: Text(
                                    "APPLY",
                                    style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal, color: Colors.redAccent, fontSize: 10.0),
                                  )),
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
}
