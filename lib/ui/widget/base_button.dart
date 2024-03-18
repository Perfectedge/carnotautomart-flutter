import 'package:flutter/material.dart';

class BaseButton extends StatefulWidget {
  final VoidCallback? onPress;
  final String title;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final bool? isBorder;

  const BaseButton(
      {Key? key, required this.onPress, required this.title, required this.backgroundColor, required this.textStyle, this.isBorder = false})
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
                backgroundColor: widget.backgroundColor,
                shape: widget.isBorder == false ? const StadiumBorder() : const StadiumBorder(side: BorderSide(color: Colors.white, width: 2)),
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
