import 'dart:developer';

import 'package:carnotautomart/ui/filter/filter_controller.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/device_info.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:carnotautomart/ui/widget/carnotmart_appbabr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/state_and_city_search_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late FilterController _filterController;
  String sortValue='date'; 
  String orderBy='ascending'; 
  @override
  void initState() {
    super.initState();
    _filterController = Get.find<FilterController>();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      // await _filterController.getDropDownData();
      _filterController.selectName.value = 'Select State';
    });
  }

  @override
  void dispose() {
    super.dispose();
    _filterController.selectName.value = 'Select State';
  }

  RangeValues rangeValue = const RangeValues(1960, 2024);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: const BoxDecoration(color: colorLightOrange),
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
            appBar: const CarnotMartAppbar(
              title: 'Advanced search',
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpaceHelper.verticalSpaceMedium,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                                notifier: (text) {
                                  log('Selected result: $text');
                                  _filterController.selectName.value = text;
                                },
                                findFromSearch:
                                    _filterController.dropDownLocations,
                              );
                            });
                      },
                      child: Row(children: [
                        Obx(
                          () => Text(
                            _filterController.selectName.value,
                            style: textTheme.bodySmall?.copyWith(
                                color: _filterController.selectName.value ==
                                        'Select State'
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
                  //Brand
                  SpaceHelper.verticalSpaceSmall,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                                notifier: (text) {
                                  log('Selected result: $text');
                                  _filterController.selectName.value = text;
                                },
                                findFromSearch:
                                    _filterController.dropDownLocations,
                              );
                            });
                      },
                      child: Row(children: [
                        Obx(
                          () => Text(
                            _filterController.brands.value,
                            style: textTheme.bodySmall?.copyWith(
                                color: colorDeepGray,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                        showCupertinoModalPopup(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return StateAndCitySearchWidget(
                                notifier: (text) {
                                  log('Selected result: $text');
                                  _filterController.selectName.value = text;
                                },
                                findFromSearch:
                                    _filterController.dropDownLocations,
                              );
                            });
                      },
                      child: Row(children: [
                        Obx(
                          () => Text(
                            _filterController.brands.value,
                            style: textTheme.bodySmall
                                ?.copyWith(color: colorDeepGray),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Row(
                      children: [
                        PriceWIdget(
                          headerTitle: 'Price',
                          title: 'Min',
                        ),
                        Spacer(),
                        PriceWIdget(
                          headerTitle: 'Price',
                          title: 'Max',
                        ),
                      ],
                    ),
                  ),
                  SpaceHelper.verticalSpaceSmall,
                  //Menufacture year
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Text(
                      'Menufacture year',
                      style: textTheme.bodySmall
                          ?.copyWith(color: Colors.black, letterSpacing: .3, fontWeight: FontWeight.normal),
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
                          min: 1960,
                          max: 2024,
                          divisions: 2024-1960,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Row(
                      children: [
                        PriceWIdget(
                          headerTitle: 'From',
                          title: '${rangeValue.start.toInt()}',
                        ),
                        const Spacer(),
                        PriceWIdget(
                          headerTitle: 'To',
                          title: '${rangeValue.end.toInt()}',
                        ),
                      ],
                    ),
                  ),
                  SpaceHelper.verticalSpaceSmall,
                    //Fuel Type
                        Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Text(
                      'Fuel Type',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          letterSpacing: .3,
                          fontWeight: FontWeight.normal),
                    ),
                  ),

                  //Condition
                  SpaceHelper.verticalSpaceSmall,
                        Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Text(
                      'Condition',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          letterSpacing: .3,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  //Color
                   SpaceHelper.verticalSpaceSmall,
                        Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Text(
                      'Color',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          letterSpacing: .3,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  //GearBox
                    SpaceHelper.verticalSpaceSmall,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Text(
                      'Gear box',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          letterSpacing: .3,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                
                  //'Sort By'
                    SpaceHelper.verticalSpaceSmall,
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Text(
                      'Sort By',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          letterSpacing: .3,
                          fontWeight: FontWeight.normal),
                    ),
                  ),

                     Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Material(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            color: Colors.white,
                            elevation: 0,
                      child: Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                                    title: const Text("Date"),
                                    contentPadding: const EdgeInsets.all(0),
                                visualDensity: const VisualDensity( horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    activeColor: colorDeepOrange,
                                    splashRadius: 10,
                                    value: "date", 
                                    groupValue: sortValue, 
                                    onChanged: (value){
                                      setState(() {
                                          sortValue = value.toString();
                                      });
                                    },
                                ),
                          ),
                          Expanded(child: RadioListTile(
                            contentPadding: const EdgeInsets.all(0),
                                visualDensity: const VisualDensity( horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            title: const Text("Price"),
                            value: "price", 
                            groupValue: sortValue, 
                            onChanged: (value){
                              setState(() {
                                  sortValue = value.toString();
                              });
                            },
                        ),)
                        ],
                      ),
                    ),
                  ),

                    //'Sort By'
                    SpaceHelper.verticalSpaceSmall,
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Text(
                      'Order By',
                      style: textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          letterSpacing: .3,
                          fontWeight: FontWeight.normal),
                    ),
                  ),

                     Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Material(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            color: Colors.white,
                            elevation: 0,
                            
                      child: Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                                    title: const Text("Ascending"),
                                    contentPadding: const EdgeInsets.all(0),
                                        visualDensity: const VisualDensity( horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    activeColor: colorDeepOrange,
                                    value: "ascending", 
                                    groupValue: orderBy, 
                                    onChanged: (value){
                                      setState(() {
                                          orderBy = value.toString();
                                      });
                                    },
                                ),
                          ),
                          Expanded(child: RadioListTile(
                            contentPadding: const EdgeInsets.all(0),
                                visualDensity: const VisualDensity( horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            title: const Text("Descending"),
                            value: "descending", 
                            groupValue: orderBy, 
                            onChanged: (value){
                              setState(() {
                                  orderBy = value.toString();
                              });
                            },
                        ),)
                        ],
                      ),
                    ),
                  ),
                  SpaceHelper.verticalSpaceMedium,
                  Center(
                    child: SizedBox(
                      width: 150,
                      child: BaseButton(
                        onPress: (){}, 
                        title: 'Apply', backgroundColor: colorDeepOrange, textStyle: textTheme.bodyMedium?.copyWith(color: Colors.white)),
                    ),
                  ),

                  SpaceHelper.verticalSpaceLarge,
                  SpaceHelper.verticalSpaceLarge,
                ],
              ),
            )),
      ),
    );
  }
}

class PriceWIdget extends StatelessWidget {
  const PriceWIdget(
      {super.key, required this.headerTitle, required this.title});
  final String headerTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerTitle,
          style: textTheme.bodySmall?.copyWith(
              color: Colors.black,
              letterSpacing: .3,
              fontWeight: FontWeight.normal),
        ),
        SpaceHelper.verticalSpaceSmall,
        Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Colors.white,
          elevation: 0,
          child: Container(
            width: DeviceInfo(context).width / 2 - 20,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextFormField(
                // controller: _chatController.messageController,
                autofocus: false,
                maxLines: null,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  //  border:_border ,
                  // enabledBorder: _border,
                  //  focusedBorder: _border,
                  hintText: title,
                  hintStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: colorDarkAsh),
                ),
                keyboardType: TextInputType.multiline,
                style: const TextStyle(fontSize: 16.0, color: Colors.black),
                onChanged: (text) {},
                onTapOutside: (value) {
                  // log('onTapOutside called');
                },
              ),
            ),
          ),
        ),
        //    TextFormField(
        //   // controller: _chatController.messageController,
        //   autofocus: false,
        //   maxLines: null,
        //   decoration: const InputDecoration(
        //     isDense: true,
        //     contentPadding: EdgeInsets.zero,
        //     border: InputBorder.none,
        //     //  border:_border ,
        //     // enabledBorder: _border,
        //     //  focusedBorder: _border,
        //     hintText: 'Type a message',
        //     hintStyle: TextStyle(
        //         fontSize: 16.0,
        //         fontWeight: FontWeight.normal,
        //         color: colorDarkAsh),
        //   ),
        //   keyboardType: TextInputType.multiline,
        //   style: const TextStyle(
        //       fontSize: 16.0, color: Colors.black),
        //   onChanged: (text) {

        //   },
        //   onTapOutside: (value) {
        //     // log('onTapOutside called');
        //   },
        // ),
      ],
    );
  }
}
