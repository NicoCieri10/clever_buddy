import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// A custom button widget.
class CustomButton extends StatelessWidget {
  /// A custom button widget.
  const CustomButton({
    this.active = true,
    this.onPressed,
    this.text,
    this.child,
    this.height,
    this.width,
    this.style,
    this.color,
    super.key,
  });

  /// The callback that is called when the button is pressed.
  final void Function()? onPressed;

  /// The text to display in the button.
  final String? text;

  /// The widget to display in the button.
  final Widget? child;

  /// Whether the button is active or not.
  final bool active;

  /// The height of the button.
  final double? height;

  /// The width of the button.
  final double? width;

  /// The style of the text.
  final TextStyle? style;

  /// The color of the button.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deafultColor = theme.primaryColor;

    return Container(
      height: height ?? 31.sp,
      width: width ?? double.infinity,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(
          color: color ?? deafultColor,
          width: 1.5.sp,
        ),
        color: active ? color ?? deafultColor : Colors.black38,
      ),
      child: MaterialButton(
        onPressed: active ? onPressed : null,
        padding: EdgeInsets.zero,
        child: SizedBox(
          width: width == null ? double.infinity : width! - 5.w,
          child: Center(
            child: child ??
                Text(
                  text ?? '',
                  maxLines: 1,
                  style: style ??
                      TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
          ),
        ),
      ),
    );
  }
}
