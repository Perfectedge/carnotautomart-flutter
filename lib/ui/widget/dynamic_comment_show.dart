import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:flutter/material.dart';

class DynamicCommentShow extends StatelessWidget {
  const DynamicCommentShow({
    super.key,
    
  });
  @override
  Widget build(BuildContext context) {
    final  textTheme =Theme.of(context).textTheme;;
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(35.0),
            child: CachedNetworkImage(
              imageUrl:
                  "https://st4.depositphotos.com/1000423/23971/i/450/depositphotos_239719906-stock-photo-networking-as-global-concept.jpg",
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            )),
        SpaceHelper.horizontalSpaceSmall,
        Expanded(
          child: SizedBox(
            height: 65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Peter Omorugie",
                        style: textTheme.bodySmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "15 Nov,2020 06:06 AM ",
                      style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontSize: 10.0, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SpaceHelper.verticalSpace(10.0),
                Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    "hi..still available?",
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54, fontSize: 12.0))
              ],
            ),
          ),
        )
      ],
    );
  }
}