import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/carnotmart_appbabr.dart';
import 'package:carnotautomart/ui/widget/comment_box.dart';
import 'package:carnotautomart/ui/widget/dynamic_comment_show.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const CarnotMartAppbar(
          title: 'Review',
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceHelper.verticalSpace(15.0),
                Text(
                  "Review Data",
                  style: textTheme.bodySmall?.copyWith(color: Colors.black),
                ),
                SpaceHelper.verticalSpace(15.0),
                Text(
                  "2 Comments",
                  style: textTheme.bodySmall?.copyWith(color: Colors.black),
                ),
                SpaceHelper.verticalSpace(10.0),
                ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return DynamicCommentShow();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SpaceHelper.verticalSpace(10.0);
                  },
                ),
                SpaceHelper.verticalSpace(30.0),
                const CommentBox(
                  title: "Type your message",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

