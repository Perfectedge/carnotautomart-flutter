import 'package:cached_network_image/cached_network_image.dart';
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
    return Scaffold(
      appBar: CarnotMartAppbar(
        title: 'Loan company details',
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
           // SpaceHelper.verticalSpace(10.0),
            Row(
              children: [
                CachedNetworkImage(imageUrl: "https://st4.depositphotos.com/1000423/23971/i/450/depositphotos_239719906-stock-photo-networking-as-global-concept.jpg",height: 80,width: 110,
                fit: BoxFit.cover,),
                SpaceHelper.horizontalSpace(10.0),
                 Expanded(
                   child: SizedBox(
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fina Truest Microfinance Bank",style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400,color: Colors.black),),
                        SpaceHelper.verticalSpace(5.0),
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return Icon(Icons.star);
                           
                        })
                      ],
                                     ),
                   ),
                 )
              ],
            )
          ],
        ),
      ),
    );
  }
}
