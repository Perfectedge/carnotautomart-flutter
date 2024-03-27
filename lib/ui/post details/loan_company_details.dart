import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
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
                                        Text("0.0 (0 Ratings)",style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, color: Colors.black54, fontSize: 10.0),)
                                  ],
                                ),
                                
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.phone_sharp,size: 12.0,),
                                  SpaceHelper.horizontalSpace(5.0),
                                  Text("018030824008",style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, color: Colors.black87, fontSize: 10.0),)
                                ],
                              ),
                              SpaceHelper.verticalSpace(5.0),
                              Row(
                                children: [
                                  const Icon(Icons.place,size: 13.0,),
                                  SpaceHelper.horizontalSpace(5.0),
                                  Expanded(
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      "46,Toyin Street,lkejs,Lagos Statesfsdfasdf",style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, color: Colors.black87, fontSize: 10.0),),
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
                  Text("About Company", style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 12.0),),
                  SpaceHelper.verticalSpace(5.0),
                  Text("description",style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 12.0),),
                   Divider(
                     thickness: 0.5,
                  ),
                  SpaceHelper.verticalSpace(5.0),
                  
                ],
              ),
            ),
          ),
        ));
  }
}
