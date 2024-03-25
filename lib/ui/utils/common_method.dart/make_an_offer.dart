import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/device_info.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/animated_dialog.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:carnotautomart/ui/widget/title_and_textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
