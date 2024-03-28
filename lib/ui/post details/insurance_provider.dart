import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/common_method.dart/documents.dart';
import 'package:carnotautomart/ui/utils/common_method.dart/eligibbility.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/carnotmart_appbabr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InsuranceProviderScreen extends StatefulWidget {
  const InsuranceProviderScreen({super.key});

  @override
  State<InsuranceProviderScreen> createState() => _InsuranceProviderScreenState();
}

class _InsuranceProviderScreenState extends State<InsuranceProviderScreen> {
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
          title: 'Insurance provider',
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10.0, top: 10.0),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Unversal Insurance",
                          style: textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w400),
                        ),
                        SpaceHelper.verticalSpace(5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "3rd Party Commercial",
                                    style: textTheme.bodySmall?.copyWith(color: colorDeepGray, fontSize: 10.0, fontWeight: FontWeight.w400),
                                  ),
                                  SpaceHelper.verticalSpace(5.0),
                                  Text(
                                    "7500",
                                    style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 10.0, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Duration",
                                  style: textTheme.bodySmall?.copyWith(color: colorDeepGray, fontSize: 10.0, fontWeight: FontWeight.w400),
                                ),
                                SpaceHelper.verticalSpace(5.0),
                                Text(
                                  "12",
                                  style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 10.0, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Text(
                              "Compare",
                              style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 10.0, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SpaceHelper.verticalSpace(10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [documents(context: context, buttonName: "Documnets"), eligibbility(context)],
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
          ),
        ),
      ),
        )
    );
  }
}
