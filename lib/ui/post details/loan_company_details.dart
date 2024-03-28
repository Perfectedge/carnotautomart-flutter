import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget/carnotmart_appbabr.dart';

class LoanCompanyDetailsScreen extends StatefulWidget {
  const LoanCompanyDetailsScreen({super.key});

  @override
  State<LoanCompanyDetailsScreen> createState() => _LoanCompanyDetailsScreenState();
}

class _LoanCompanyDetailsScreenState extends State<LoanCompanyDetailsScreen> {
  List<String> productReviewList = ["Products (4)", "Review (0)"];
  var index = 0;
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
              title: 'Loan company details',
            ),
            body: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpaceHelper.verticalSpace(10.0),
                  SizedBox(
                    height: 80.0,
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "https://st4.depositphotos.com/1000423/23971/i/450/depositphotos_239719906-stock-photo-networking-as-global-concept.jpg",
                          height: 80,
                          width: 110,
                          fit: BoxFit.cover,
                        ),
                        SpaceHelper.horizontalSpace(10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Fina Truest Microfinance Bank",
                                style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 12.0),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return const Icon(
                                            Icons.star,
                                            size: 13,
                                          );
                                        }),
                                    SpaceHelper.horizontalSpace(5.0),
                                    Text(
                                      "0.0 (0 Ratings)",
                                      style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, color: Colors.black54, fontSize: 10.0),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.phone_sharp,
                                    size: 12.0,
                                  ),
                                  SpaceHelper.horizontalSpace(5.0),
                                  Text(
                                    "018030824008",
                                    style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, color: Colors.black87, fontSize: 10.0),
                                  )
                                ],
                              ),
                              SpaceHelper.verticalSpace(5.0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.place,
                                    size: 13.0,
                                  ),
                                  SpaceHelper.horizontalSpace(5.0),
                                  Expanded(
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      "46,Toyin Street,lkejs,Lagos Statesfsdfasdf",
                                      style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, color: Colors.black87, fontSize: 10.0),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SpaceHelper.verticalSpace(10.0),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    "About Company",
                    style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 12.0),
                  ),
                  SpaceHelper.verticalSpace(5.0),
                  Text(
                    "description",
                    style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 12.0),
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  SpaceHelper.verticalSpace(5.0),
                  SizedBox(
                    height: 25,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: productReviewList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index1) {
                        return MaterialButton(
                          //minWidth: 70,
                          shape: StadiumBorder(side: BorderSide(color: index == index1 ? Colors.transparent : colorLightOrange, width: 0.5)),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          color: index == index1 ? colorDeepGray : colorLightOrange.withOpacity(.1),
                          onPressed: () {
                            setState(() {
                              index = index1;
                            });
                          },
                          child: Text(
                            productReviewList[index1],
                            style: textTheme.bodySmall?.copyWith(color: index == index1 ? Colors.white : colorDeepOrange, fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SpaceHelper.horizontalSpace(5.0);
                      },
                    ),
                  ),
                  SpaceHelper.verticalSpace(10.0),
                  Expanded(
                    child: index == 0
                        ? Wrap(
                            children: List.generate(
                              7,
                              (index) => Container(
                                padding: EdgeInsets.zero,
                                width: 100,
                                child: Card(
                                  elevation: 4,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Fina Auto Loan",
                                          style: textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 10),
                                        ),
                                        SpaceHelper.verticalSpace(5.0),
                                        Text(
                                          "% interest",
                                          style: textTheme.bodySmall?.copyWith(color: Colors.grey, fontSize: 8),
                                        ),
                                        SpaceHelper.verticalSpace(5.0),
                                        Text(
                                          "35.00,70.00",
                                          style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 10),
                                        ),
                                        SpaceHelper.verticalSpace(5.0),
                                        Text(
                                          "12,24 Month",
                                          style: textTheme.bodySmall?.copyWith(color: colorDeepGray, fontSize: 10),
                                        ),
                                        SpaceHelper.verticalSpace(5.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Text("Review"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
