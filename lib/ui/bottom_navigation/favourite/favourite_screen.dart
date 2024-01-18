import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widget/car_list_tile.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: const BoxDecoration(color: scaffoldBAckground),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                // return CarListTile();
                return Text('Favourite Screen');
              },
              separatorBuilder: (context, index) {
                // return const Divider(
                //   color: Colors.black,
                //   thickness: .2,
                // );
                return Container(
                  color: Colors.black,
                  height: .3,
                );
              },
            ),
            SpaceHelper.verticalSpaceLarge,
          ],
        ),
      ),
    );
  }
}
