
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/filter/filter_controller.dart';
import 'package:carnotautomart/ui/post%20details/eligilility_screen.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/common_method.dart/common_method.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadProviderScreen extends StatefulWidget {
  const LoadProviderScreen({super.key});

  @override
  State<LoadProviderScreen> createState() => _LoadProviderScreenState();
}

class _LoadProviderScreenState extends State<LoadProviderScreen> {
  late FilterController _filterController;

      // String? yearsValue;
  @override
  void initState() {
    _filterController = Get.find<FilterController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorLightOrange,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            splashRadius: 30,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: Text("Loan Provider", style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500, color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10.0, top: 10.0),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    height: 88,
                    width: 114,
                    fit: BoxFit.cover,
                    imageUrl: 'https://cdn.pixabay.com/photo/2023/11/02/15/58/flower-8360946_1280.jpg',
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
                  SpaceHelper.horizontalSpaceSmall,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fina Trust icrofinance Bank",
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, fontSize: 12.0, color: Colors.black),
                        ),
                        SpaceHelper.verticalSpace(5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Vehicle Amount",
                              style: textTheme.bodySmall?.copyWith(
                                color: colorDeepGray,
                                fontSize: 10,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text(
                                "Comapre",
                                style: textTheme.bodySmall?.copyWith(color: Colors.orange[900], fontWeight: FontWeight.normal, fontSize: 10.0),
                              ),
                            ),
                          ],
                        ),
                        SpaceHelper.verticalSpace(5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                loanProviderTitle(context,"LTV"),
                                loanProviderTitle(context,"30 %"),
                              ],
                            ),
                            Column(
                              children: [
                                loanProviderTitle(context,"Interest"),
                                loanProviderTitle(context,"35.00 %"),
                              ],
                            ),
                            Column(
                              children: [
                                loanProviderTitle(context,"Terms"),
                                loanProviderTitle(context,"12"),
                              ],
                            )
                          ],
                        ),
                        SpaceHelper.verticalSpace(5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25.0),
                                        topRight: Radius.circular(25.0),
                                      ),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height - 200.0,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Required Documents",
                                                    style: textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 12.0),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      icon: const Icon(
                                                        Icons.clear,
                                                        color: Colors.black,
                                                      ))
                                                ],
                                              )
                                            ],
                                          ));
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                    color: colorLightOrange.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: colorLightOrange)),
                                child: Text('Documents', style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 10)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {

                                Get.to(()=> EligibilityScreen(),transition: Transition.downToUp,duration: Duration(seconds: 1));
                                
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                                decoration: BoxDecoration(
                                    color: colorLightOrange.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: colorLightOrange)),
                                child: Text('Check Eligibility', style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 10)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SpaceHelper.verticalSpace(10.0);
            },
           )
          ),
    
        
        );
  }

  


  // Future<dynamic> dynamicCupertinoModelPopWithAppBar({required BuildContext context, required String appbarName, required Widget body}) {
  //   return showCupertinoModalPopup(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (_) {
  //         final textTheme = Theme.of(context).textTheme;
  //         return Scaffold(
  //             appBar: AppBar(
  //               backgroundColor: colorLightOrange,
  //               automaticallyImplyLeading: false,
  //               elevation: 0,
  //               centerTitle: true,
  //               leading: IconButton(
  //                 splashRadius: 30,
  //                 onPressed: () {
  //                   Get.back();
  //                 },
  //                 icon: const Icon(Icons.arrow_back_ios_new_rounded),
  //               ),
  //               title: Text(appbarName, style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500, color: Colors.white)),
  //             ),
  //             body: body);
  //       });
  // }

//    Column radioButtonQuestion(BuildContext context, String question) {
//     final textTheme = Theme.of(context).textTheme;
//     return Column(
//       children: [
//         Text(
//           question,
//           style: textTheme.bodySmall?.copyWith(
//             color: Colors.black,
//             fontSize: 12,
//           ),
//         ),
//         SpaceHelper.verticalSpace(5.0),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CupertinoRadio(
//                     value: "yes",
//                     groupValue: yearsValue,
//                     onChanged: (value) {
//                       yearsValue = value;
//                     }),
//                 SpaceHelper.horizontalSpace(5.0),
//                 Text(
//                   "Yes",
//                   style: textTheme.bodySmall?.copyWith(
//                     color: Colors.black,
//                     fontWeight: FontWeight.normal,
//                     fontSize: 10,
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CupertinoRadio(
//                     value: "No",
//                     groupValue: yearsValue,
//                     onChanged: (value) {
//                       yearsValue = value;
//                     }),
//                 SpaceHelper.horizontalSpace(5.0),
//                 Text(
//                   "No ",
//                   style: textTheme.bodySmall?.copyWith(
//                     color: Colors.black,
//                     fontWeight: FontWeight.normal,
//                     fontSize: 10,
//                   ),
//                 )
//               ],
//             ),
//             SpaceHelper.verticalSpace(10.0),
//             nextButton(
//                 context: context,
//                 onPress: () {
//                   pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
//                 }),
//             SpaceHelper.verticalSpace(10.0),
//             previousButton(
//                 context: context,
//                 onPress: () {
//                   pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.ease);
//                 }),
//           ],
//         ),
//       ],
//     );
//   }

//   BaseButton nextButton({required BuildContext context, void Function()? onPress, String? title}) {
//     return BaseButton(
//       height: 30.0,
//       width: 250,
//       onPress: onPress,
//       title: title ?? "Next Question",
//       backgroundColor: Colors.redAccent,
//       textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10.0),
//     );
//   }

//   BaseButton previousButton({required BuildContext context, void Function()? onPress}) {
//     return BaseButton(
//       borderColor: Colors.redAccent,
//       isBorder: true,
//       height: 30.0,
//       width: 250,
//       onPress: onPress,
//       title: "Previous Question",
//       backgroundColor: Colors.transparent,
//       textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10.0, color: colorDeepGray),
//     );
//   }

 
//  Column textButtonQuestion({required BuildContext context, required String question}) {
//     final textTheme = Theme.of(context).textTheme;
//     return Column(
//       children: [
//         Text(
//           question,
//           style: textTheme.bodySmall?.copyWith(
//             color: Colors.black,
//             fontSize: 12,
//           ),
//         ),
//         SpaceHelper.verticalSpace(10.0),
//         TextFormField(
//           scrollPadding: EdgeInsets.zero,
//           textAlign: TextAlign.center,
//           style: textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 12.0),
//           maxLines: 1,
//           decoration: InputDecoration(
//               isDense: true,
//               contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
//               border: InputBorder.none,
//               hintText: "Answer",
//               hintStyle: textTheme.bodySmall?.copyWith(
//                 color: colorDeepGray,
//                 fontSize: 10.0,
//               )),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Container(
//             height: 0.2,
//             color: Colors.black,
//           ),
//         ),
//         SpaceHelper.verticalSpace(15.0),
//         nextButton(
//             context: context,
//             onPress: () {
//               pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
//             }),
//         SpaceHelper.verticalSpace(10.0),
//         previousButton(
//             context: context,
//             onPress: () {
//               pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.ease);
//             }),
//       ],
//     );
//   }


// Column checkBoxButtonQuestion(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Column(
//       children: [
//         Text(
//           "Are you a business owner or an employee?",
//           style: textTheme.bodySmall?.copyWith(
//             color: Colors.black,
//             fontSize: 12,
//           ),
//         ),
//         SpaceHelper.verticalSpace(10.0),
//         ListView.builder(
//             shrinkWrap: true,
//             itemCount: 3,
//             itemBuilder: (context, index) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Checkbox(
//                       side: BorderSide(color: Colors.redAccent),
//                       value: false,
//                       onChanged: (value) {
//                         print(value);
//                       }),
//                   Text(
//                     "data",
//                     style: textTheme.bodySmall?.copyWith(
//                       color: Colors.black,
//                       fontWeight: FontWeight.normal,
//                       fontSize: 10,
//                     ),
//                   ),
//                 ],
//               );
//             }),
//         SpaceHelper.verticalSpace(15.0),
//         nextButton(
//             context: context,
//             onPress: () {
//               pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
//             }),
//         SpaceHelper.verticalSpace(10.0),
//         previousButton(
//             context: context,
//             onPress: () {
//               pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.ease);
//             }),
//       ],
//     );
//   }


//   Container submitBottonQuestion(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.center,
//               child: Text(
//                 "Affordability Question",
//                 style: textTheme.bodySmall?.copyWith(
//                   color: Colors.black,
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//             SpaceHelper.verticalSpace(15.0),
//             Text(
//               "Vehicle Amount",
//               style: textTheme.bodySmall?.copyWith(
//                 color: colorDeepGray,
//                 fontSize: 12,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//             SpaceHelper.verticalSpace(5.0),
//             Text(
//               "₦ 18,000,000",
//               style: textTheme.bodySmall?.copyWith(
//                 color: colorDeepOrange,
//                 fontSize: 10,
//               ),
//             ),
//             const Divider(),
//             SpaceHelper.verticalSpace(5.0),
//             Text(
//               "Maximum Loan Amount",
//               style: textTheme.bodySmall?.copyWith(
//                 color: colorDeepGray,
//                 fontSize: 12,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//             SpaceHelper.verticalSpace(5.0),
//             Text(
//               "₦ 12,600,000",
//               style: textTheme.bodySmall?.copyWith(
//                 color: colorDeepOrange,
//                 fontSize: 10,
//               ),
//             ),
//             const Divider(),
//             SpaceHelper.verticalSpace(20.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 CupertinoRadio(
//                     value: "yes",
//                     groupValue: yearsValue,
//                     onChanged: (value) {
//                       yearsValue = value;
//                     }),
//                 SpaceHelper.horizontalSpace(5.0),
//                 Text(
//                   "Take Max Amount",
//                   style: textTheme.bodySmall?.copyWith(
//                     color: Colors.black,
//                     fontWeight: FontWeight.normal,
//                     fontSize: 10,
//                   ),
//                 )
//               ],
//             ),
//             SpaceHelper.verticalSpace(15.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 CupertinoRadio(
//                     value: "No",
//                     groupValue: yearsValue,
//                     onChanged: (value) {
//                       yearsValue = value;
//                     }),
//                 SpaceHelper.horizontalSpace(5.0),
//                 Text(
//                   "Custom Loan Amount",
//                   style: textTheme.bodySmall?.copyWith(
//                     color: Colors.black,
//                     fontWeight: FontWeight.normal,
//                     fontSize: 10,
//                   ),
//                 )
//               ],
//             ),
//             SpaceHelper.verticalSpace(10.0),
//             monthlyIncomeTextFiled(autoFocus: false, labelText: "Monthly Income"),
//             SpaceHelper.verticalSpace(5.0),
//             monthlyIncomeTextFiled(autoFocus: false, labelText: "Custom Amount"),
//             SpaceHelper.verticalSpace(10.0),
//             Align(
//               alignment: Alignment.center,
//               child: nextButton(
//                   title: "Submit",
//                   context: context,
//                   onPress: () async{
//                    await showDialog(context: context, builder: (BuildContext ){
//                        return CupertinoAlertDialog(
//                         title: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text("Congratulations",style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16.0),)),
//                           content: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text ("You are eligible for apply!",style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 12.0),)),
//                          actions: [
//                               TextButton(onPressed: (){
//                                 Get.back();
//                               }, child: Text("CANCEL",style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal,color: Colors.redAccent,fontSize: 10.0),)),
//                               TextButton(onPressed: (){
//                                  Get.to(()=> ApplyForLoan(),transition: Transition.downToUp,duration: Duration(seconds: 1));
//                               }, child: Text("APPLY",style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal,color: Colors.redAccent,fontSize: 10.0),)),
//                          ],
                       
//                        );
//                    });
//                   }),
//             ),
//             SpaceHelper.verticalSpace(10.0),
//             Align(
//               alignment: Alignment.center,
//               child: previousButton(
//                   context: context,
//                   onPress: () {
//                     pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.ease);
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }


// Container monthlyIncomeTextFiled({required bool autoFocus, required String labelText}) {
//     final textTheme = Theme.of(context).textTheme;
//     return Container(
//       color: colorDeepGray.withOpacity(0.2),
//       child: TextFormField(
//         autofocus: autoFocus,
//         scrollPadding: EdgeInsets.zero,
//         style: textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
//           border: InputBorder.none,
//           prefixIcon: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             child: Text(
//               "₦",
//               style: textTheme.bodySmall?.copyWith(
//                 color: colorDeepOrange,
//                 fontSize: 12,
//               ),
//             ),
//           ),
//           prefixIconConstraints: const BoxConstraints(maxHeight: 20, maxWidth: 25),
//           labelText: labelText,
//           labelStyle: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 12, fontWeight: FontWeight.normal),
//         ),
//       ),
//     );
//   }



}