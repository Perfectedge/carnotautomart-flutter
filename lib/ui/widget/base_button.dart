import 'package:flutter/material.dart';

class BaseButton extends StatefulWidget {
  final VoidCallback? onPress;
  final String title;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final bool? isBorder;
  final double? width ;
  final double? height ;
  final Color? borderColor;

  const BaseButton(
      {Key? key, required this.onPress, required this.title, required this.backgroundColor, required this.textStyle, this.isBorder = false, this.width, this.height, this.borderColor})
      : super(key: key);

  @override
  State<BaseButton> createState() => _BaseBuState();
}

class _BaseBuState extends State<BaseButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ??  40.0,
      child: ElevatedButton(
        onPressed: widget.onPress,
        style: widget.onPress != null
            ? ElevatedButton.styleFrom(
                backgroundColor: widget.backgroundColor,
                shape: widget.isBorder == false ? const StadiumBorder() :  StadiumBorder(side: BorderSide(color: widget.borderColor?? Colors.white, width: 1)),
                elevation: 0,
                // shadowColor: AppColors.button1Color,
              )
            : ElevatedButton.styleFrom(
                disabledBackgroundColor: widget.backgroundColor.withOpacity(.5),
                shape: const StadiumBorder(),
                elevation: 0.0,
                // shadowColor: AppColors.button1Color,
              ),
        child: Text(widget.title, style: widget.textStyle),
      ),
    );
  }
}
