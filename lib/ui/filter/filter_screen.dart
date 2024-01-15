import 'dart:developer';

import 'package:carnotautomart/ui/filter/filter_controller.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
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
  @override
  void initState() {
    super.initState();
    _filterController = Get.find<FilterController>();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      // await _filterController.getDropDownData();
    });
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
            appBar: CarnotMartAppbar(
              title: 'Advanced search',
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpaceHelper.verticalSpaceMedium,

                  // Obx(() => Text(_filterController.dropDownLocations.length.toString())),
                  SpaceHelper.verticalSpaceMedium,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Text(
                      'Location',
                      style: textTheme.bodySmall
                          ?.copyWith(color: Colors.black, letterSpacing: .3),
                    ),
                  ),

                  /// Dropdown Button
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
                                findFromSearch: _filterController.dropDownLocations,
                              );
                            });
                      },
                      child: Row(children: [
                        Obx(
                          ()=> Text(
                             _filterController.selectName.value,
                            style: textTheme.bodySmall
                                ?.copyWith(color: colorDarkAsh),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: colorDarkAsh,
                        )
                      ]),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
