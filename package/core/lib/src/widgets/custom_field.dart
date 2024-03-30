import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Custom TextFormField
class CustomField extends StatelessWidget {
  /// Custom TextFormField
  const CustomField({
    super.key,
    this.height,
    this.controller,
    this.obscureText = false,
    this.error = false,
    this.style,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.onChanged,
    this.onTap,
    this.maxLength,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.onSaved,
    this.focusNode,
    this.autoFocus = false,
    this.readOnly = false,
    this.enabled,
    this.initialValue,
    this.contentPadding,
  });

  /// The height of the field.
  final double? height;

  /// The controller of the field.
  final TextEditingController? controller;

  /// Whether the field is obscure or not.
  final bool obscureText;

  /// Whether the field is obscure or not.
  final bool error;

  /// The style of the field.
  final TextStyle? style;

  /// The validator of the field.
  final String? Function(String?)? validator;

  /// The hint text of the field.
  final String? hintText;

  /// The hint style of the field.
  final TextStyle? hintStyle;

  /// The suffix icon of the field.
  final Widget? suffixIcon;

  /// The keyboard type of the field.
  final TextInputType? keyboardType;

  /// The text align of the field.
  final TextAlign textAlign;

  /// The on editing complete of the field.
  final void Function()? onEditingComplete;

  /// The on field submitted of the field.
  final void Function(String)? onFieldSubmitted;

  /// The on tap outside of the field.
  final void Function(PointerDownEvent)? onTapOutside;

  /// The on changed of the field.
  final void Function(String)? onChanged;

  /// The on saved of the field.
  final void Function(String?)? onSaved;

  /// The on tap of the field.
  final void Function()? onTap;

  /// The max length of the field.
  final int? maxLength;

  /// The max lines of the field.
  final int maxLines;

  /// The text capitalization of the field.
  final TextCapitalization textCapitalization;

  /// The focus node of the field.
  final FocusNode? focusNode;

  /// Whether the field is auto focused or not.
  final bool autoFocus;

  /// Whether the field is read only or not.
  final bool readOnly;

  /// Whether the field is enabled or not.
  final bool? enabled;

  /// The initial value of the field.
  final String? initialValue;

  /// The content padding of the field.
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final outlineBorderRadius = BorderRadius.circular(15.sp);

    const primaryText = Colors.black87;

    final enabledBorderOutline = OutlineInputBorder(
      borderSide: BorderSide(
        color: primaryText,
        width: 1.sp,
      ),
      borderRadius: outlineBorderRadius,
    );

    final focusedBorderOutline = OutlineInputBorder(
      borderSide: const BorderSide(color: primaryText),
      borderRadius: outlineBorderRadius,
    );

    final errorBorderOutline = OutlineInputBorder(
      borderSide: const BorderSide(color: ThemeColors.error),
      borderRadius: outlineBorderRadius,
    );

    final focusedErrorOutline = OutlineInputBorder(
      borderSide: const BorderSide(color: ThemeColors.error),
      borderRadius: outlineBorderRadius,
    );

    final decoration = InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle ?? TextStyle(fontSize: 9.sp),
      enabledBorder: !error ? enabledBorderOutline : errorBorderOutline,
      focusedBorder: !error ? focusedBorderOutline : errorBorderOutline,
      errorBorder: errorBorderOutline,
      focusedErrorBorder: focusedErrorOutline,
      errorMaxLines: 2,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding ??
          EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 5.w,
          ),
    );

    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: decoration,
        style: style ?? TextStyle(fontSize: 9.sp),
        keyboardType: keyboardType,
        validator: validator,
        textAlign: textAlign,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        onTapOutside: onTapOutside,
        onChanged: onChanged,
        onSaved: onSaved,
        onTap: onTap,
        maxLength: maxLength,
        textCapitalization: textCapitalization,
        focusNode: focusNode,
        autofocus: autoFocus,
        maxLines: maxLines,
        readOnly: readOnly,
        initialValue: initialValue,
        enabled: enabled,
      ),
    );
  }
}
