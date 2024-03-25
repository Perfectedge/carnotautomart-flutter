import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/device_info.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:carnotautomart/ui/widget/title_and_textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


GlobalKey _globalKey = GlobalKey();
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