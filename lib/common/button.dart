// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:widget_book_demo/common/color.dart';
import 'package:widget_book_demo/common/typography.dart';

enum AppButtonSize { large, medium, small, tiny }

enum AppButtonType { outlined, contained, text }

enum AppButtonColor { blue, red, purple, yellow, gray, green, white }

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool disable;
  final MainAxisSize mainAxisSize;
  final AppButtonSize size;
  final AppButtonType type;
  final AppButtonColor color;
  final Color? customColor;
  final Color? customTextColor;
  final String? title;
  final Widget? child;
  final ButtonStyle? customStyle;
  final double? customBorderWidth;

  const AppButton({
    super.key,
    this.onTap,
    this.onLongPress,
    this.disable = false,
    this.mainAxisSize = MainAxisSize.min,
    this.size = AppButtonSize.large,
    this.type = AppButtonType.contained,
    this.color = AppButtonColor.blue,
    this.customColor,
    this.customTextColor,
    this.title,
    this.child,
    this.customStyle,
    this.customBorderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onLongPress: disable ? null : onLongPress,
      onPressed: disable ? null : onTap,
      style: (customStyle ?? const ButtonStyle()).copyWith(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fixedSize: customStyle?.fixedSize,
        maximumSize:
            customStyle?.maximumSize ??
            (mainAxisSize == MainAxisSize.min ? null : WidgetStatePropertyAll(Size(double.infinity, height))),
        minimumSize:
            customStyle?.minimumSize ??
            (mainAxisSize == MainAxisSize.min ? null : WidgetStatePropertyAll(Size(double.infinity, height))),
        elevation: customStyle?.elevation ?? const WidgetStatePropertyAll(0),
        shape:
            customStyle?.shape ??
            WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(color: borderColor, width: borderWidth),
              ),
            ),
        backgroundColor: customStyle?.backgroundColor ?? WidgetStatePropertyAll(backgroundColor),
        overlayColor: customStyle?.overlayColor ?? WidgetStatePropertyAll(overlayColor),
        padding: customStyle?.padding ?? WidgetStatePropertyAll(padding),
      ),
      child: child ?? Text(title ?? "Button", style: titleStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }

  double get height {
    switch (size) {
      case AppButtonSize.large:
        return 52.px;
      case AppButtonSize.medium:
        return 48.px;
      case AppButtonSize.small:
        return 36.px;
      case AppButtonSize.tiny:
        return 30.px;
    }
  }

  double get radius {
    return 8.px;
  }

  Color get borderColor {
    if (customColor != null) {
      switch (type) {
        case AppButtonType.contained:
          return disable ? textColor : customColor!;

        case AppButtonType.outlined:
          return disable ? textColor : customColor!;

        case AppButtonType.text:
          return backgroundColor;
      }
    } else {
      if (type == AppButtonType.text || type == AppButtonType.contained) {
        return backgroundColor;
      }
      switch (color) {
        case AppButtonColor.blue:
          return disable ? colorGrayGray5 : colorAlertBlue;
        case AppButtonColor.red:
          return disable ? colorGrayGray5 : colorAlertRed;
        case AppButtonColor.purple:
          return disable ? colorGrayGray5 : colorAlertPurple;
        case AppButtonColor.yellow:
          return disable ? colorGrayGray5 : colorAlertYellow;
        case AppButtonColor.gray:
          return disable ? colorGrayGray5 : colorGrayGray4;
        case AppButtonColor.green:
          return disable ? colorGrayGray5 : colorAlertGreen;
        case AppButtonColor.white:
          return disable ? colorDefaultWhite : colorDefaultWhite;
      }
    }
  }

  double get borderWidth {
    switch (type) {
      case AppButtonType.contained:
        return 0;

      case AppButtonType.outlined:
        return customBorderWidth ?? 1.px;

      case AppButtonType.text:
        return 0;
    }
  }

  TextStyle get titleStyle {
    switch (size) {
      case AppButtonSize.large:
        return tStyle.body1.Bold.tColor(textColor).tFamily("Inter");

      case AppButtonSize.medium:
        return tStyle.body2.Bold.tColor(textColor).tFamily("Inter");

      case AppButtonSize.small:
        return tStyle.body3.Bold.tColor(textColor).tFamily("Inter");
      case AppButtonSize.tiny:
        return tStyle.body3.Bold.tColor(textColor).tFamily("Inter");
    }
  }

  Color get textColor {
    if (customTextColor != null) {
      return customTextColor!;
    } else {
      if ([AppButtonType.outlined, AppButtonType.text].contains(type)) {
        switch (color) {
          case AppButtonColor.blue:
            return disable ? colorGrayGray5 : colorAlertBlue;
          case AppButtonColor.red:
            return disable ? colorGrayGray5 : colorAlertRed;
          case AppButtonColor.purple:
            return disable ? colorGrayGray5 : colorAlertPurple;
          case AppButtonColor.yellow:
            return disable ? colorGrayGray5 : colorAlertYellow;
          case AppButtonColor.gray:
            return disable ? colorGrayGray5 : colorGrayGray6;
          case AppButtonColor.green:
            return disable ? colorGrayGray5 : colorAlertGreen;
          case AppButtonColor.white:
            return disable ? colorAlertBlue : colorAlertBlue;
        }
      }
      switch (color) {
        case AppButtonColor.blue:
        case AppButtonColor.red:
        case AppButtonColor.purple:
        case AppButtonColor.yellow:

        case AppButtonColor.white:
        case AppButtonColor.green:
          return disable ? colorGrayGray4 : colorGrayWhite;
        case AppButtonColor.gray:
          return disable
              ? ([AppButtonType.text, AppButtonType.contained].contains(type) ? colorGrayGray4 : colorGrayGray7)
              : colorGrayGray6;
      }
    }
  }

  EdgeInsets get padding {
    switch (size) {
      case AppButtonSize.large:
        return EdgeInsets.symmetric(vertical: 14.px, horizontal: 25.px);

      case AppButtonSize.medium:
        return EdgeInsets.symmetric(vertical: 13.px, horizontal: 20.px);

      case AppButtonSize.small:
        return EdgeInsets.symmetric(vertical: 8.px, horizontal: 15.px);
      case AppButtonSize.tiny:
        return EdgeInsets.symmetric(vertical: 5.px, horizontal: 15.px);
    }
  }

  Color get backgroundColor {
    if (customColor != null) {
      switch (type) {
        case AppButtonType.contained:
          return disable ? customColor!.withOpacity(0.5) : customColor!;

        case AppButtonType.outlined:
          return disable ? Colors.transparent : customColor!.withOpacity(0.2);

        case AppButtonType.text:
          return disable ? Colors.transparent : customColor!.withOpacity(0.2);
      }
    } else {
      if (type == AppButtonType.text) {
        return Colors.transparent;
      } else if (type == AppButtonType.outlined) {
        return Colors.transparent;
      } else {
        switch (color) {
          case AppButtonColor.blue:
            return disable ? ([AppButtonSize.small].contains(size) ? colorAlertGray : colorGrayGray5) : colorAlertBlue;
          case AppButtonColor.red:
            return disable ? ([AppButtonSize.small].contains(size) ? colorAlertGray : colorGrayGray5) : colorAlertRed;
          case AppButtonColor.purple:
            return disable
                ? ([AppButtonSize.small].contains(size) ? colorAlertGray : colorGrayGray5)
                : colorAlertPurple;
          case AppButtonColor.yellow:
            return disable
                ? ([AppButtonSize.small].contains(size) ? colorAlertGray : colorGrayGray5)
                : colorAlertYellow;
          case AppButtonColor.green:
            return disable ? ([AppButtonSize.small].contains(size) ? colorAlertGray : colorGrayGray5) : colorAlertGreen;
          case AppButtonColor.gray:
            return disable ? ([AppButtonSize.small].contains(size) ? colorAlertGray : colorGrayGray5) : colorAlertGray;
          case AppButtonColor.white:
            return colorDefaultWhite;
        }
      }
    }
  }

  Color get overlayColor {
    if (customColor != null) {
      switch (type) {
        case AppButtonType.contained:
          return disable ? Colors.transparent : Color.lerp(customColor, Colors.black, 0.2)!;

        case AppButtonType.outlined:
          return disable ? Colors.transparent : customColor!.withOpacity(0.2);

        case AppButtonType.text:
          return disable ? Colors.transparent : customColor!.withOpacity(0.2);
      }
    } else {
      if (disable) return Colors.transparent;

      switch (color) {
        case AppButtonColor.blue:
          return [AppButtonType.outlined, AppButtonType.text].contains(type)
              ? colorAlertBlue.withOpacity(0.2)
              : Color.lerp(colorAlertBlue, Colors.black, 0.2)!;
        case AppButtonColor.red:
          return [AppButtonType.outlined, AppButtonType.text].contains(type)
              ? colorAlertRed.withOpacity(0.2)
              : Color.lerp(colorAlertRed, Colors.black, 0.2)!;
        case AppButtonColor.purple:
          return [AppButtonType.outlined, AppButtonType.text].contains(type)
              ? colorAlertPurple.withOpacity(0.2)
              : Color.lerp(colorAlertPurple, Colors.black, 0.2)!;
        case AppButtonColor.yellow:
          return [AppButtonType.outlined, AppButtonType.text].contains(type)
              ? colorAlertYellow.withOpacity(0.2)
              : Color.lerp(colorAlertYellow, Colors.black, 0.2)!;
        case AppButtonColor.green:
          return [AppButtonType.outlined, AppButtonType.text].contains(type)
              ? colorAlertGreen.withOpacity(0.2)
              : Color.lerp(colorAlertGreen, Colors.black, 0.2)!;
        case AppButtonColor.gray:
          return [AppButtonType.outlined, AppButtonType.text].contains(type)
              ? colorAlertGray.withOpacity(0.2)
              : Color.lerp(colorAlertGray, Colors.black, 0.2)!;
        case AppButtonColor.white:
          return [AppButtonType.outlined, AppButtonType.text].contains(type)
              ? colorAlertGray.withOpacity(0.2)
              : Color.lerp(colorAlertGray, Colors.black, 0.2)!;
      }
    }
  }
}
