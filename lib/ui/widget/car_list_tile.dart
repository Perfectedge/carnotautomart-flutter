import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/helper/spacing_helper.dart';

class CarListTile extends StatelessWidget {
  const CarListTile({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
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
            CachedNetworkImage(
              fit: BoxFit.cover,
              width: 150,
              height: 125,
              imageUrl:
                  'https://cdn.pixabay.com/photo/2023/11/02/15/58/flower-8360946_1280.jpg',
              placeholder: (context, url) => const Center(
                child: CupertinoActivityIndicator(
                  color: colorDarkAsh,
                ),
              ),
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/default.png',
              ),
            ),
            SpaceHelper.horizontalSpaceSmall,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Black Toyota camry sport 2010'.toUpperCase(),
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
                      child: Text('2024',
                          style: textTheme.bodySmall
                              ?.copyWith(color: colorDeepOrange, fontSize: 12)),
                    ),
                    SpaceHelper.horizontalSpaceSmall,
                    Text('0 Mile',
                        style: textTheme.bodySmall
                            ?.copyWith(color: colorDeepOrange, fontSize: 12)),
                  ],
                ),
                Text(
                  '₦ 78,00,000 || 79000',
                  softWrap: true,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorDeepGray,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Maryland, Lagos',
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
