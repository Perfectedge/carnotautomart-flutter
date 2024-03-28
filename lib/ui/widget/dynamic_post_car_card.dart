import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicPostCarCard extends StatelessWidget {
  DynamicPostCarCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    this.location,
  });

  String image, title, price;
  String? location;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 140,
      
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 65,
                  imageUrl:
                      // 'https://cdn.pixabay.com/photo/2023/11/02/15/58/flower-8360946_1280.jpg',
                      // 'https://imagedelivery.net/bc3AzSC5rzsaweEH1LLxAQ/eac56afb-a0c8-4bfc-a1e8-f5c6af9d6b00/Medium',
                      image,
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
              ),
            ),
            SpaceHelper.verticalSpace(2),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorDarkAsh,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      price,
                      softWrap: true,
                      textAlign: TextAlign.left,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorDeepOrange,
                        fontSize: 12,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        location ?? '',
                        softWrap: true,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorDeepOrange,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
