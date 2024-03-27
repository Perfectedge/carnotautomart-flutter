
import 'package:carnotautomart/ui/filter/filter_controller.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:carnotautomart/ui/widget/carnotmart_appbabr.dart';
import 'package:carnotautomart/ui/widget/state_and_city_search_widget.dart';
import 'package:carnotautomart/ui/widget/title_and_textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplyForLoan extends StatefulWidget {
  const ApplyForLoan({super.key});

  @override
  State<ApplyForLoan> createState() => _ApplyForLoanState();
}

class _ApplyForLoanState extends State<ApplyForLoan> {
  late FilterController _filterController;
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
        appBar: CarnotMartAppbar(
              title: 'Apply For Finance',
              
            ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SpaceHelper.verticalSpace(5.0),
                TextBoxtWithTitle(
                  title: 'First Name',
                  width: size.width,
                  keyboardType: TextInputType.number,
                ),
                SpaceHelper.verticalSpace(10.0),
                TextBoxtWithTitle(
                  title: 'Last Name',
                  width: size.width,
                  keyboardType: TextInputType.number,
                ),
                SpaceHelper.verticalSpace(10.0),
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
                            appBarTitle: 'Gender',
                            selectionType: 'Gender',
                            notifier: (seletedData) {
                              // log('Selected result: ${seletedData['name']}');
                               _filterController.model.value = 'Gender';
                              _filterController.selectLocationName.value = seletedData['Gender'];
                            },
                            findFromSearch: _filterController.dropDownLocations,
                          );
                        });
                  },
                  child: Row(children: [
                    Obx(
                      () => Text(
                        _filterController.selectLocationName.value,
                        style: textTheme.bodySmall?.copyWith(
                            color: _filterController.selectLocationName.value == 'Gender' ?  colorDeepGray : Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: colorDeepGray,
                    )
                  ]),
                ),
                SpaceHelper.verticalSpace(10.0),
                TextBoxtWithTitle(
                  title: 'Phone Number',
                  width: size.width,
                  keyboardType: TextInputType.number,
                ),
                SpaceHelper.verticalSpace(10.0),
                
                TextBoxtWithTitle(
                  title: 'Email Address',
                  width: size.width,
                  keyboardType: TextInputType.number,
                ),
                SpaceHelper.verticalSpace(10.0),
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
                            appBarTitle: 'Gender',
                            selectionType: 'Gender',
                            notifier: (seletedData) {
                              // log('Selected result: ${seletedData['name']}');
                               _filterController.model.value = 'Gender';
                              _filterController.selectLocationName.value = seletedData['Gender'];
                            },
                            findFromSearch: _filterController.dropDownLocations,
                          );
                        });
                  },
                  child: Row(children: [
                    Obx(
                      () => Text(
                        _filterController.selectLocationName.value,
                        style: textTheme.bodySmall?.copyWith(
                            color: _filterController.selectLocationName.value == 'Gender' ?  colorDeepGray : Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: colorDeepGray,
                    )
                  ]),
                ),
                SpaceHelper.verticalSpace(10.0),
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
                            appBarTitle: 'Gender',
                            selectionType: 'Gender',
                            notifier: (seletedData) {
                              // log('Selected result: ${seletedData['name']}');
                               _filterController.model.value = 'Gender';
                              _filterController.selectLocationName.value = seletedData['Gender'];
                            },
                            findFromSearch: _filterController.dropDownLocations,
                          );
                        });
                  },
                  child: Row(children: [
                    Obx(
                      () => Text(
                        _filterController.selectLocationName.value,
                        style: textTheme.bodySmall?.copyWith(
                            color: _filterController.selectLocationName.value == 'Gender' ?  colorDeepGray : Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: colorDeepGray,
                    )
                  ]),
                ),
                SpaceHelper.verticalSpace(10.0),
                TextBoxtWithTitle(
                  title: 'Address',
                  width: size.width,
                  keyboardType: TextInputType.number,
                ),
                SpaceHelper.verticalSpace(10.0),
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
                            appBarTitle: 'Gender',
                            selectionType: 'Gender',
                            notifier: (seletedData) {
                              // log('Selected result: ${seletedData['name']}');
                               _filterController.model.value = 'Gender';
                              _filterController.selectLocationName.value = seletedData['Gender'];
                            },
                            findFromSearch: _filterController.dropDownLocations,
                          );
                        });
                  },
                  child: Row(children: [
                    Obx(
                      () => Text(
                        _filterController.selectLocationName.value,
                        style: textTheme.bodySmall?.copyWith(
                            color: _filterController.selectLocationName.value == 'Gender' ?  colorDeepGray : Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: colorDeepGray,
                    )
                  ]),
                ),
                SpaceHelper.verticalSpace(10.0),
                TextBoxtWithTitle(
                  title: 'Refer',
                  width: size.width,
                  keyboardType: TextInputType.number,
                ),
                SpaceHelper.verticalSpace(30.0),
                BaseButton(
                  width: 150,
                  onPress: (){
                    
                  }, 
                  title: "Apply", 
                  backgroundColor: colorDeepOrange, 
                  textStyle: textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  SpaceHelper.verticalSpace(20.0),
                      
              ],
            ),
          ),
        ));
  }
}
