import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatefulWidget {
  final VoidCallback? onPress;
  final String title;

  const BaseButton({Key? key, required this.onPress, required this.title})
      : super(key: key);

  @override
  State<BaseButton> createState() => _BaseBuState();
}

class _BaseBuState extends State<BaseButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        onPressed: widget.onPress,
        style: widget.onPress != null
            ? ElevatedButton.styleFrom(
                backgroundColor: colorDeepOrange,
                shape: const StadiumBorder(),
                elevation: 0,
                // shadowColor: AppColors.button1Color,
              )
            : ElevatedButton.styleFrom(
                disabledBackgroundColor:colorDeepGray.withOpacity(.5),
                shape: const StadiumBorder(),
                elevation: 0.0,
                // shadowColor: AppColors.button1Color,
              ),
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(letterSpacing: 0.26,fontWeight: FontWeight.w700,fontSize: 16)
        ),
      ),
    );
  }
}
