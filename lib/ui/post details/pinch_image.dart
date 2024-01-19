import 'dart:io';
import 'dart:math';
import 'dart:developer' as developer;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/helper/device_info.dart';

class PinchImageScreen extends StatefulWidget {
  PinchImageScreen({
    super.key,
    required this.image,
    required this.imgList,
    required this.currentIndex,
  });
  String image;
  List<String> imgList;
  int currentIndex;

  @override
  State<PinchImageScreen> createState() => _PinchImageScreenState();
}

class _PinchImageScreenState extends State<PinchImageScreen>
    with SingleTickerProviderStateMixin {
  final double minScale = 1;
  final double maxScale = 4;
  late TransformationController _transformationController;
  late AnimationController animationController;
  TapDownDetails? _tapDownDetails;
  Animation<Matrix4>? animation;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    print('Image patha ${widget.image}');
    _transformationController = TransformationController();
    _pageController = PageController(initialPage: widget.currentIndex);
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() => _transformationController.value = animation!.value);
  }

  @override
  void dispose() {
    super.dispose();
    _transformationController.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.cancel_outlined,
              size: 30,
            ), //Image.asset('assets/images/ic_close2.png',color: Colors.black,),
            splashRadius: 20,
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onDoubleTap: () {
          final position = _tapDownDetails?.localPosition;
          const double scale = 2;
          final x = -position!.dx * (scale - 1);
          final y = -position.dy * (scale - 1);
          final zoomed = Matrix4.identity()
            ..translate(x, y)
            ..scale(scale);
          final end = _transformationController.value.isIdentity()
              ? zoomed
              : Matrix4.identity();
          // _transformationController.value = value;
          animation =
              Matrix4Tween(begin: _transformationController.value, end: end)
                  .animate(CurveTween(curve: Curves.easeOut)
                      .animate(animationController));
          animationController.forward(from: 0);
        },
        onDoubleTapDown: (details) {
          _tapDownDetails = details;
        },
        child: SizedBox(
          height: DeviceInfo(context).height,
          width: DeviceInfo(context).width,
          child: InteractiveViewer(
            transformationController: _transformationController,
            clipBehavior: Clip.none,
            // panEnabled: false,

            minScale: minScale,
            maxScale: maxScale,
            onInteractionEnd: (details) {
              // resetAnimation();
            },
            child: PageView.builder(
                controller: _pageController,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.imgList.length,
                onPageChanged: (value) {
                  resetAnimation();
                },
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: widget.imgList[index],
                    placeholder: (context, url) => const SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: colorDeepGray,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: Center(
                            child: Text(
                          'No Image Found',
                          style: textTheme.labelMedium?.copyWith(
                              color: colorDeepGray,
                              fontWeight: FontWeight.bold),
                        ))),
                  );
                }),
          ),
        ),
      ),
    );
  }

  void resetAnimation() {
    animation = Matrix4Tween(
            begin: _transformationController.value, end: Matrix4.identity())
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut));
    animationController.forward(from: 0);
  }
}
