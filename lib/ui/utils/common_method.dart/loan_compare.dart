import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget loanComapre({required BuildContext context, required String buttonName,}) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
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
                      ),
                      
                    ],
                  ));
            });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        
        child: Text(
          
          buttonName, style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 10)),
      ),
    );
  }