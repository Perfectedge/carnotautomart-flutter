import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatefulWidget {
  final VoidCallback? onPress;
  final String title;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final bool? isBorder;

  const RoundedRectangleButton(
      {Key? key, required this.onPress, required this.title, required this.backgroundColor, required this.textStyle, this.isBorder = false})
      : super(key: key);

  @override
  State<RoundedRectangleButton> createState() => _RoundedRectangleBuState();
}

class _RoundedRectangleBuState extends State<RoundedRectangleButton> {
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
                padding: EdgeInsets.all(0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: widget.isBorder == false ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) : const RoundedRectangleBorder(),
                elevation: 0,
              )
            : ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                disabledBackgroundColor: widget.backgroundColor.withOpacity(.5),
                shape: const RoundedRectangleBorder(),
                elevation: 0.0,
                // shadowColor: AppColors.button1Color,
              ),
        child: Text(widget.title, style: widget.textStyle),
      ),
    );
  }
}
