import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/helper/spacing_helper.dart';

class CarListTile extends StatelessWidget {
  const CarListTile({
    super.key,
    required this.tileData
  });
  final dynamic tileData;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialButton(
      onPressed: () {},
      color: Colors.white,
      padding: const EdgeInsets.all(0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashColor: colorLightOrange.withOpacity(.1),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: 130,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 150,
                height: 125,
                imageUrl: tileData?.photo??'',
                placeholder: (context, url) => const Center(
                  child: CupertinoActivityIndicator(
                    color: colorDarkAsh,
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                   fit: BoxFit.cover,
                  width: 150,
                height: 125,
                  'assets/images/default.png',
                ),
              ),
            ),
            SpaceHelper.horizontalSpaceSmall,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                 tileData?.title??''.toUpperCase(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(color: colorDarkAsh),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                          color: colorLightOrange.withOpacity(.1),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: colorLightOrange)),
                      child: Text(  tileData?.manufactureYear??'',
                          style: textTheme.bodySmall
                              ?.copyWith(color: colorDeepOrange, fontSize: 12)),
                    ),
                    SpaceHelper.horizontalSpaceSmall,
                    Text('${tileData.mileage??''} Mile',
                        style: textTheme.bodySmall
                            ?.copyWith(color: colorDeepOrange, fontSize: 12)),
                  ],
                ),
                Text(
                  '₦ ${tileData?.priceinnaira??''}',
                  softWrap: true,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorDeepGray,
                    fontSize: 12,
                  ),
                ),
                Text(
                  tileData?.location??'',
                  softWrap: true,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorDeepGray,
                    fontSize: 12,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
