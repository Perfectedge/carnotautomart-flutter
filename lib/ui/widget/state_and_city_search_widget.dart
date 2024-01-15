import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/helper/helper_functions.dart';
import '../utils/helper/spacing_helper.dart';
import '../../data/remote/model/state_response.dart';
import '../utils/app_colors.dart';

class StateAndCitySearchWidget extends StatefulWidget {
  const StateAndCitySearchWidget(
      {super.key, required this.notifier, required this.findFromSearch});

  final void Function(String text) notifier;
  final RxList<dynamic> findFromSearch;
  @override
  State<StateAndCitySearchWidget> createState() =>
      _StateAndCitySearchWidgetState();
}

class _StateAndCitySearchWidgetState extends State<StateAndCitySearchWidget> {
  RxList searchResult = [].obs;
  RxList findFromSearch = [].obs;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      findFromSearch.value = widget.findFromSearch;
      searchResult.value = widget.findFromSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        hideKyBoard(context);
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            // forceMaterialTransparency: true,
            automaticallyImplyLeading: false,
            elevation: 0,

            leading: IconButton(
              splashRadius: 30,
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.cancel_sharp),
            ),
            title: Text(
              'Select State'.toUpperCase(),
              style: textTheme.labelMedium,
            ),
            flexibleSpace: Image(
              height: Platform.isIOS ? 130 : 80, //
              // height: 115,
              width: double.infinity,
              image: const AssetImage(
                  'assets/images/bg_appbar.png'), // Replace with your image path
              fit: BoxFit.cover,
            ),

            bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      // width:DeviceInfo(context).width-120 ,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              // controller: _chatController.messageController,
                              autofocus: false,
                              maxLines: null,
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                                //  border:_border ,
                                // enabledBorder: _border,
                                //  focusedBorder: _border,
                                hintText: 'Type a message',
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    color: colorDarkAsh),
                              ),
                              keyboardType: TextInputType.multiline,
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              onChanged: (text) {
                                findFromSearch.value = searchResult
                                    .where((item) => item.name!
                                        .toLowerCase()
                                        .contains(text.toLowerCase()))
                                    .toList();
                              },
                              onTapOutside: (value) {
                                // log('onTapOutside called');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SpaceHelper.verticalSpaceMedium
                  ],
                )),
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Obx(
              () => ListView.separated(
                shrinkWrap: true,
                itemCount:findFromSearch.length,
                itemBuilder: (_, index) => ListTile(
                    onTap: () {
                      Get.back();
                      widget.notifier(findFromSearch[index].name ?? '');
                    },
                    dense: true,
                    minVerticalPadding: 0,
                    //  contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text(
                      '${findFromSearch[index].name}',
                      style:
                          textTheme.labelMedium?.copyWith(color: Colors.black),
                    )),
                separatorBuilder: (_, index) => Divider(),
              ),
            ),
          )),
    );
  }
}
