import 'package:carnotautomart/ui/bottom_navigation%20/service/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/helper/spacing_helper.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  late ServiceController _serviceController;

  @override
  void initState() {
    super.initState();
    _serviceController = Get.put(ServiceController());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpaceHelper.verticalSpaceMedium,
              Text('Select a Service',style: textTheme.bodyMedium?.copyWith(color: Colors.black,fontWeight: FontWeight.normal),),
              if(_serviceController.serviceList.isNotEmpty)
              Padding(padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8,),
              child: _serviceSection(textTheme)
              )
            ],
          ),
        ));
  }

   _serviceSection(TextTheme textTheme) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,

      ),
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: _serviceController.serviceList.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(5),
        height: 100,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            
             boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // shadow color
                  spreadRadius: 3, // how wide the shadow should be
                  blurRadius: 3, // how soft the shadow should be
                  offset: const Offset(0, 0), // changes the position of the shadow
                ),
              ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _serviceController.serviceList[index].imagePath ?? '',
                height: 50,
                width: 50,
              ),
              SpaceHelper.verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  _serviceController.serviceList[index].name ?? '',
                  style: textTheme.bodySmall?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.normal,fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
      
    );
  }
}
