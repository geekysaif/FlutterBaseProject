import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutterbaseproject/businessUtils/fontFamily/font_family.dart';

/// Custom TextField Widget
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    this.borderRadius = 8.0,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: textStyle,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

/// Custom Text Widget
class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const CustomText({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? const TextStyle(fontSize: 16.0, color: Colors.black),
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}


class CustomStyle {
  // Headline Styles
  static const TextStyle headline1 = TextStyle(
    fontSize: 32.0,
    fontFamily: FontFamily.playFairDisplay,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 24.0,
    fontFamily: FontFamily.playFairDisplay,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  // Subtitle Styles
  static const TextStyle subtitle1 = TextStyle(
    fontSize: 18.0,
    fontFamily: FontFamily.playFairDisplay,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontSize: 16.0,
    fontFamily: FontFamily.playFairDisplay,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  // Body Text Styles
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 14.0,
    fontFamily: FontFamily.playFairDisplay,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 12.0,
    fontFamily: FontFamily.playFairDisplay,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

// Caption Style
}


/// Custom Dropdown Widget
class CustomDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? hint;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.value,
    this.onChanged,
    this.hint,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      items: items,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

/// Custom CachedNetworkImage Widget
class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CustomCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => placeholder ?? Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => errorWidget ?? Icon(Icons.error, color: Colors.red),
    );
  }
}
