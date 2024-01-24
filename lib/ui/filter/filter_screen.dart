import 'dart:developer';

import 'package:carnotautomart/ui/filter/filter_controller.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/device_info.dart';
import 'package:carnotautomart/ui/utils/helper/helper_functions.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:carnotautomart/ui/widget/carnotmart_appbabr.dart';
import 'package:carnotautomart/ui/widget/dropdown_string_search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/state_and_city_search_widget.dart';
import '../widget/title_and_textbox.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late FilterController _filterController;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late RangeValues rangeValue;


  @override
  void initState() {
    super.initState();
    _filterController = Get.find<FilterController>();
     rangeValue =RangeValues(double.parse(_filterController.manufacturingYears.last) , double.parse(_filterController.manufacturingYears.first));
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      // await _filterController.getDropDownData();
      log(_filterController.manufacturingYears.first.toString());
      _filterController.selectLocationName.value = 'Select State';
      _filterController.brands.value = 'Brand';
      _filterController.model.value = 'Model';
      _filterController.fuels.value = 'Select fuel';
      _filterController.condition.value = 'Select condition';
      _filterController.carColor.value ='Select color';
      _filterController.gearBox.value ='Select gearbox';
    });
  }

  @override
  void dispose() {
    super.dispose();
    _filterController.selectLocationName.value = 'Select State';
    _filterController.brands.value = 'Brand';
    _filterController.model.value = 'Model';
    _filterController.fuels.value == 'Select Fuel';
    _filterController.condition.value = 'Select condition';
    _filterController.carColor.value ='Select color';
    _filterController.gearBox.value ='Select gearbox';
  }


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;     
    return Container(
      decoration: const BoxDecoration(color: colorLightOrange),
      child: GestureDetector(
        onTap: () {
          hideKyBoard(context);
        },
        child: SafeArea(
          top: true,
          bottom: false,
          child: Scaffold(
              key: scaffoldKey,
              appBar: const CarnotMartAppbar(
                title: 'Advanced search',
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SpaceHelper.verticalSpaceMedium,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        'Location',
                        style: textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            letterSpacing: .3,
                            fontWeight: FontWeight.normal),
                      ),
                    ),

                    /// Location
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
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
                                  appBarTitle: 'Select State',
                                  selectionType: 'Location',
                                  notifier: (seletedData) {
                                    // log('Selected result: ${seletedData['name']}');
                                    _filterController.selectLocationName.value = seletedData['name'];
                                  },
                                  findFromSearch:
                                      _filterController.dropDownLocations,
                                );
                              });
                        },
                        child: Row(children: [
                          Obx(
                            () => Text(
                              _filterController.selectLocationName.value,
                              style: textTheme.bodySmall?.copyWith(
                                  color: _filterController.selectLocationName.value == 'Select State'? colorDeepGray : Colors.black,
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
                    ),
                    //Brand
                    SpaceHelper.verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        'Brand',
                        style: textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            letterSpacing: .3,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
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
                                    _filterController.brands.value =
                                        seletedData['name'];
                                    //Get Model Data
                                    _filterController.model.value = 'Model';
                                    _filterController.getModelByBrand(
                                        brandId: seletedData['id']);
                                  },
                                  findFromSearch: _filterController.dropDownBrand,
                                );
                              });
                        },
                        child: Row(children: [
                          Obx(
                            () => Text(
                              _filterController.brands.value,
                              style: textTheme.bodySmall?.copyWith(
                                  color:_filterController.brands.value == 'Brand'? colorDeepGray: Colors.black,
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
                    ),
                    //Model
                    SpaceHelper.verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        'Model',
                        style: textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            letterSpacing: .3,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.white,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        highlightElevation: .5,
                        elevation: 0,
                        onPressed: () {
                          if (_filterController.brands.isEmpty ||
                              _filterController.brands.value == 'Brand') {
                            log('Select Brand');

                            errorDialog(textTheme);
                          } else {
                            showCupertinoModalPopup(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) {
                                  return StateAndCitySearchWidget(
                                    appBarTitle: 'Select Model',
                                    selectionType: 'Model',
                                    notifier: (selectedData) {
                                      log('Selected result: ${selectedData['name']}');
                                      _filterController.model.value =
                                          selectedData['name'];
                                    },
                                    findFromSearch:
                                        _filterController.dropDownModel,
                                  );
                                });
                          }
                        },
                        child: Row(children: [
                          Obx(
                            () => Text(
                              _filterController.model.value,
                              style: textTheme.bodySmall?.copyWith(
                                  color:
                                      _filterController.model.value == 'Model'
                                          ? colorDeepGray
                                          : Colors.black),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: colorDeepGray,
                          )
                        ]),
                      ),
                    ),
                    //Price
                    SpaceHelper.verticalSpaceSmall,
                     Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: Row(
                        children: [
                          TextBoxtWithTitle(
                            headerTitle: 'Price',
                            title: 'Min',
                            width: DeviceInfo(context).width / 2 - 20,
                            keyboardType: TextInputType.number,
                          ),
                         const Spacer(),
                          TextBoxtWithTitle(
                            headerTitle: 'Price',
                            title: 'Max',
                            width: DeviceInfo(context).width / 2 - 20,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    SpaceHelper.verticalSpaceSmall,
                    //Menufacture year
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        'Menufacture year',
                        style: textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            letterSpacing: .3,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      height: 50,
                      child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.white,
                        elevation: 0,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 1,
                            activeTrackColor: colorDeepOrange,
                            inactiveTrackColor: Colors.grey.shade300,
                          ),
                          child: RangeSlider(
                            min: double.parse(_filterController.manufacturingYears.last),
                            max: double.parse(_filterController.manufacturingYears.first),
                            divisions: int.parse(_filterController.manufacturingYears.first) - int.parse(_filterController.manufacturingYears.last),
                            values: rangeValue,
                            onChanged: (value) {
                              setState(() {
                                rangeValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SpaceHelper.verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Row(
                        children: [
                          TextBoxtWithTitle(
                            headerTitle: 'From',
                            title: '${rangeValue.start.toInt()}',
                            width: DeviceInfo(context).width / 2 - 20,
                            keyboardType: TextInputType.number,
                          ),
                          const Spacer(),
                          TextBoxtWithTitle(
                            headerTitle: 'To',
                            title: '${rangeValue.end.toInt()}',
                            width: DeviceInfo(context).width / 2 - 20,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    SpaceHelper.verticalSpaceSmall,
                    //Fuel Type
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        'Fuel Type',
                        style: textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            letterSpacing: .3,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
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
                                  appBarTitle: 'Select Fuel',
                                  selectionType: 'Fuel',
                                  notifier: (seletedData) {
                                    log('Selected result: ${seletedData['name']}');
                                   _filterController.fuels.value=seletedData['name'];
                                  },
                                  findFromSearch: _filterController.dropDownFuels,
                                );
                              });
                        },
                        child: Row(children: [
                          Obx(
                            () => Text(
                              _filterController.fuels.value,
                              // 'Fule',
                              style: textTheme.bodySmall?.copyWith(
                                  color: _filterController.fuels.value =='Select fuel'
                                      ? colorDeepGray
                                      : Colors.black,
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
                    ),

                    //Condition
                    SpaceHelper.verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        'Condition',
                        style: textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            letterSpacing: .3,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.white,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        highlightElevation: .5,
                        elevation: 0,
                        onPressed: () {
                          showCupertinoModalPopup(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) {
                                return DropDownStringSearchWidget<String>(
                                  appBarTitle: 'Select Contition',
                                  selectionType: 'Condition',
                                  onSelected: (seletedData) {
                                    log('Selected result: ${seletedData}');
                                    _filterController.condition.value =seletedData??'';
                                  },
                                  findFromSearch:_filterController.dropDownVehicleConditions,
                                );
                              });
                        },
                        child: Row(children: [
                          Obx(
                            () => Text(
                              _filterController.condition.value,
                              style: textTheme.bodySmall?.copyWith(
                                  color: _filterController.condition.value =='Select condition'
                                      ? colorDeepGray
                                      : Colors.black,
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
                    ),
                    //Color
                    SpaceHelper.verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        'Color',
                        style: textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            letterSpacing: .3,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
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
                                  appBarTitle: 'Select Color',
                                  selectionType: 'Color',
                                  notifier: (seletedData) {
                                    // log('Selected result: ${seletedData['name']}');
                                    _filterController.carColor.value = seletedData['name'];
                                  },
                                  findFromSearch:_filterController.dropDownCarColors,
                                );
                              });
                        },
                        child: Row(children: [
                          Obx(
                            () => Text(
                              _filterController.carColor.value,
                              style: textTheme.bodySmall?.copyWith(
                                  color: _filterController.carColor.value =='Select color'
                                      ? colorDeepGray
                                      : Colors.black,
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
                    ),
                    //GearBox
                    SpaceHelper.verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        'Gear box',
                        style: textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            letterSpacing: .3,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.white,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        highlightElevation: .5,
                        elevation: 0,
                        onPressed: () {
                          showCupertinoModalPopup(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) {
                                return DropDownStringSearchWidget<String>(
                                  appBarTitle: 'Select State',
                                  selectionType: 'Location',
                                  onSelected: (seletedData) {
                                    log('Selected result: ${seletedData}');
                                    _filterController.gearBox.value =seletedData.toString();
                                  },
                                  findFromSearch:
                                      _filterController.dropDownGareBox,
                                );
                              });
                        },
                        child: Row(children: [
                          Obx(
                            () => Text(
                              _filterController.gearBox.value,
                              style: textTheme.bodySmall?.copyWith(
                                  color: _filterController.gearBox.value =='Select gearbox'
                                      ? colorDeepGray
                                      : Colors.black,
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
                    ),

                    //'Sort By'
                    SpaceHelper.verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        'Sort By',
                        style: textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            letterSpacing: .3,
                            fontWeight: FontWeight.normal),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.white,
                        elevation: 0,
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                title: const Text("Date"),
                                contentPadding: const EdgeInsets.all(0),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: colorDeepOrange,
                                splashRadius: 10,
                                value: "date",
                                groupValue: _filterController.sortValue.value,
                                onChanged: (value) {
                                  setState(() {
                                     _filterController.sortValue.value = value.toString();
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                contentPadding: const EdgeInsets.all(0),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                title: const Text("Price"),
                                value: "price",
                                groupValue: _filterController.sortValue.value,
                                onChanged: (value) {
                                  setState(() {
                                    _filterController.sortValue.value = value.toString();
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    //'Sort By'
                    SpaceHelper.verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        'Order By',
                        style: textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            letterSpacing: .3,
                            fontWeight: FontWeight.normal),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.white,
                        elevation: 0,
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                title: const Text("Ascending"),
                                contentPadding: const EdgeInsets.all(0),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: colorDeepOrange,
                                value: "ascending",
                                groupValue:  _filterController.orderBy.value,
                                onChanged: (value) {
                                  setState(() {
                                     _filterController.orderBy.value = value.toString();
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                contentPadding: const EdgeInsets.all(0),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                title: const Text("Descending"),
                                value: "descending",
                                groupValue:  _filterController.orderBy.value,
                                onChanged: (value) {
                                  setState(() {
                                     _filterController.orderBy.value = value.toString();
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SpaceHelper.verticalSpaceMedium,
                    Center(
                      child: SizedBox(
                        width: 150,
                        child: BaseButton(
                            onPress: () {},
                            title: 'Apply',
                            backgroundColor: colorDeepOrange,
                            textStyle: textTheme.bodyMedium
                                ?.copyWith(color: Colors.white)),
                      ),
                    ),

                    SpaceHelper.verticalSpaceLarge,
                    SpaceHelper.verticalSpaceLarge,
                  ],
                ),
              )),
        ),
      ),
    );
  }

  errorDialog(TextTheme textTheme) {
    Get.snackbar('', '',
        messageText: Text(
          'Please select the Brand first',
          style: textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
        snackStyle: SnackStyle.GROUNDED,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(0),
        borderRadius: 0,
        maxWidth: double.infinity,
        backgroundColor: Colors.red,
        padding: const EdgeInsets.only(top: 20, bottom: 10));
  }
}
