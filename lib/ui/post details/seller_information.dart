import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:carnotautomart/ui/widget/comment_box.dart';
import 'package:carnotautomart/ui/widget/dynamic_post_car_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget/carnotmart_appbabr.dart';

class SellerInformationScreen extends StatefulWidget {
  const SellerInformationScreen({super.key});

  @override
  State<SellerInformationScreen> createState() => _SellerInformationScreenState();
}

class _SellerInformationScreenState extends State<SellerInformationScreen> {
  List<String> productReviewList = ["Car (4)", "Review (0)"];
  var index = 0;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
          decoration: const BoxDecoration(color: colorLightOrange),
          child: SafeArea(
            top: true,
            bottom: false,
            child: Scaffold(
              appBar: const CarnotMartAppbar(
                title: 'Seller page',
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpaceHelper.verticalSpace(10.0),
                      SizedBox(
                        height: 100.0,
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: "https://st4.depositphotos.com/1000423/23971/i/450/depositphotos_239719906-stock-photo-networking-as-global-concept.jpg",
                              height: 100,
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
                                  SpaceHelper.verticalSpace(2.0),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                  ),
                                  SpaceHelper.verticalSpace(5.0),
                                  BaseButton(
                                    height: 20,
                                    width: 70,
                                    onPress: (){}, 
                                    title: "Chat", 
                                    backgroundColor: colorDeepOrange, 
                                    textStyle: textTheme.bodySmall?.copyWith(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10.0)
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SpaceHelper.verticalSpace(10.0),
                      const Divider(
                        thickness: 0.5,
                      ),
                      Text(
                        "About Seller",
                        style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 12.0),
                      ),
                      SpaceHelper.verticalSpace(5.0),
                      Text(
                        "description",
                        style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 12.0),
                      ),
                      const Divider(
                        thickness: 0.5,
                      ),
                      SpaceHelper.verticalSpace(5.0),
                      SizedBox(
                        height: 25,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: productReviewList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index1) {
                            return MaterialButton(
                              splashColor: Colors.transparent,
                              //minWidth: 70,
                              shape: StadiumBorder(side: BorderSide(color: index == index1 ? Colors.transparent : colorLightOrange, width: 0.5)),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              color: index == index1 ? colorDeepGray : colorLightOrange,
                              onPressed: () {
                                setState(() {
                                  index = index1;
                                });
                              },
                              child: Text(
                                productReviewList[index1],
                                style: textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SpaceHelper.horizontalSpace(5.0);
                          },
                        ),
                      ),
                      SpaceHelper.verticalSpace(10.0),
                      index == 0
                          ? Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Column(
                                        children: [
                                          Container(
                                            height: 160,
                                            child: DynamicPostCarCard(
                                              image: 'https://imgd.aeplcdn.com/370x208/n/cw/ec/130591/fronx-exterior-right-front-three-quarter-109.jpeg?isig=0&q=80',
                                              title: "Black toyota corolla le 2016",
                                              price: "₦ 18000000?? ||'",
                                              location: "Ojodu,Lagos",
                                            ),
                                          ),
                                          SpaceHelper.verticalSpace(10.0)
                                        ],
                                      )),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  thickness: 0.5,
                                ),
                                Text(
                                  "Rate Seller",
                                  style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 12),
                                ),
                                SpaceHelper.verticalSpace(10.0),
                                CommentBox(
                                  title: "Type Here",
                                  borderRadius: 6.0,
                                ),
                                SpaceHelper.verticalSpace(10.0),
                                Row(
                                  children: List.generate(
                                      5,
                                      (index) => Icon(
                                            Icons.star,
                                            color: colorLightOrange,
                                            size: 13.0,
                                          )),
                                )
                                //Text("⭐⭐⭐⭐⭐",style: TextStyle(fontSize: 12.0),)
                              ],
                            )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
