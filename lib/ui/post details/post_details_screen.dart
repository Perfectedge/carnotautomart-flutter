import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/post%20details/pinch_image.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/carnotmart_appbabr.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/helper/device_info.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  List<Widget> _imageSliders = [];
  @override
  void initState() {
    _imageSliders = List.generate(
      imgList.length,
      (index) => CachedNetworkImage(
        fit: BoxFit.cover,
        width: double.infinity,
        imageUrl:
            // 'https://cdn.pixabay.com/photo/2023/11/02/15/58/flower-8360946_1280.jpg',
            // 'https://imagedelivery.net/bc3AzSC5rzsaweEH1LLxAQ/eac56afb-a0c8-4bfc-a1e8-f5c6af9d6b00/Medium',
            imgList[index],
        placeholder: (context, url) => const Center(
          child: CupertinoActivityIndicator(
            color: colorDarkAsh,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          'assets/images/default.png',
          fit: BoxFit.cover,
          height: 65,
        ),
      ),

      // Image.network(imgList[index],
      //     fit: BoxFit.cover, width: double.infinity)
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Container(
        decoration: const BoxDecoration(color: colorLightOrange),
        child: SafeArea(
          top: true,
          bottom: false,
          child: Scaffold(
            appBar: CarnotMartAppbar(
              title: 'Post Details',
              actionItem: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_sharp,
                  )),
            ),
            body: Container(
              height: DeviceInfo(context).height,
              width: DeviceInfo(context).width,
              // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  _buildCarouselSlider(
                      imageSliders: _imageSliders,
                      carouselController: _carouselController,
                      theme: theme),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          '#ID-46025',
                          style: textTheme.bodySmall
                              ?.copyWith(color: colorDeepOrange),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  _buildCarouselSlider(
      {required List<Widget> imageSliders,
      required CarouselController carouselController,
      required ThemeData theme}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(()=>PinchImageScreen(image: imgList[_current], imgList:imgList,currentIndex: _current,));
          },
          child: CarouselSlider(
            items: imageSliders,
            carouselController: carouselController,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: false,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        SpaceHelper.verticalSpace(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselController.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
