// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:widget_book_demo/common/color.dart';
import 'package:widget_book_demo/common/typography.dart';

enum InputSize { medium, large, small }

class InputNormal extends StatefulWidget {
  final InputSize size;
  final String? hintText;
  final int? maxLines;
  final String? labelText;
  final String? errorText;
  final Widget? errorWidget;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function(String value)? onFieldSubmitted;

  final FocusNode? focusNode;
  final TextStyle? style;
  final String? initialValue;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? enabled;
  final bool activeCounter;
  final TextStyle? hintStyle;
  final Color? enableBackGroundColor;
  final InputBorder? enabledBorder;

  const InputNormal({
    super.key,
    this.size = InputSize.medium,
    this.hintText,
    this.maxLines,
    this.labelText,
    this.errorText,
    this.errorWidget,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.onChanged,
    this.onFieldSubmitted,
    this.controller,
    this.focusNode,
    this.style,
    this.initialValue,
    this.maxLength,
    this.inputFormatters,
    this.keyboardType,
    this.enabled,
    this.activeCounter = false,
    this.hintStyle,
    this.enableBackGroundColor,
    this.enabledBorder,
  });

  @override
  State<InputNormal> createState() => _InputNormalState();
}

class _InputNormalState extends State<InputNormal> {
  final ScrollController scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant InputNormal oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.px),
              child: Text(widget.labelText ?? "", style: labelStyle),
            ),
          ),
        Focus(
          focusNode: widget.focusNode,
          onFocusChange: (value) {
            if (!value) {
              if (widget.controller?.text == "") {
                return;
              } else {
                scrollController.jumpTo(0);
              }
            }
          },
          child: Localizations.override(
            context: context,
            locale: const Locale('en', 'US'),
            child: TextFormField(
              enabled: widget.enabled,
              keyboardType: widget.keyboardType,
              inputFormatters: widget.inputFormatters,
              scrollController: scrollController,
              controller: widget.controller,
              initialValue: widget.initialValue,
              obscureText: widget.obscureText,
              buildCounter: widget.activeCounter
                  ? null
                  : (context, {required currentLength, required isFocused, required maxLength}) {
                      return null;
                    },
              decoration: InputDecoration(
                prefixIcon: widget.prefixIcon == null
                    ? SizedBox(width: leadingWidth)
                    : Padding(


                        padding: EdgeInsets.only(right: 8.px, left: 16.px),
                        child: widget.prefixIcon,
                      ),
                prefixIconConstraints: BoxConstraints(minWidth: leadingWidth ?? prefixIconWidth),
                suffixIcon: widget.suffixIcon == null
                    ? null
                    : Padding(
                        padding: EdgeInsets.only(right: 16.px, left: 8.px),
                        child: widget.suffixIcon,
                      ),
                suffixIconConstraints: BoxConstraints(minWidth: prefixIconWidth),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.px),
                  borderSide: BorderSide(width: 1.px, color: colorGrayGray4),
                ),
                enabledBorder:
                    widget.enabledBorder ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.px),

                      borderSide: BorderSide(width: 1.px, color: colorGrayGray4),
                    ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.px),
                  borderSide: BorderSide(width: 1.px, color: colorAlertBlue),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.px),
                  borderSide: BorderSide(width: 1.px, color: colorGrayGray4),
                ),
                contentPadding: contentPadding,
                hintText: widget.hintText,
                hintStyle:
                    widget.hintStyle ??
                    tStyle
                        .fs(fontSize: fontSize, height: fontHeight / fontSize)
                        .fw(FontWeight.w300)
                        .tColor(colorGrayGray4)
                        .tFamily("Inter"),
                errorStyle: errorStyle,
                errorMaxLines: 200,
                errorText: widget.errorText,
                filled: true,
                fillColor: widget.enabled == false
                    ? colorGrayGray2.withOpacity(0.1)
                    : (widget.errorWidget == null && widget.errorText == null
                          ? widget.enableBackGroundColor ?? Colors.transparent
                          : colorAlertRed.withOpacity(0.1)),
              ),
              maxLines: widget.maxLines ?? (widget.obscureText ? 1 : null),
              style:
                  widget.style ??
                  tStyle
                      .fs(fontSize: fontSize, height: fontHeight / fontSize)
                      .tColor(colorBackgroundBlack)
                      .tFamily("Inter"),
              cursorColor: colorAlertBlue,
              textInputAction: widget.textInputAction,
              onChanged: widget.onChanged,
              onFieldSubmitted: (value) {
                if (widget.textInputAction == TextInputAction.next) {
                  widget.focusNode?.nextFocus();
                }
                widget.onFieldSubmitted?.call(value);
              },
              maxLength: widget.maxLength,
            ),
          ),
        ),
      ],
    );
  }

  EdgeInsetsGeometry get contentPadding {
    return EdgeInsets.zero;
    switch (widget.size) {
      case InputSize.large:
        return EdgeInsets.only(right: 16.px, top: 15.px, bottom: 15.px);
      case InputSize.medium:
        return EdgeInsets.only(right: 16.px, top: 12.px, bottom: 12.px);
      case InputSize.small:
        return EdgeInsets.only(right: 16.px, top: 10.px, bottom: 10.px);
    }
  }

  double? get leadingWidth {
    if (widget.prefixIcon == null) {
      return 16.px;
    } else {
      return null;
    }
  }

  double get fontSize {
    switch (widget.size) {
      case InputSize.large:
        return 18;
      case InputSize.medium:
        return 16;
      case InputSize.small:
        return 14;
    }
  }

  double get fontHeight {
    switch (widget.size) {
      case InputSize.large:
        return 24;
      case InputSize.medium:
        return 22;
      case InputSize.small:
        return 20;
    }
  }

  TextStyle get labelStyle {
    switch (widget.size) {
      case InputSize.large:
        return tStyle.body2.Bold.tColor(colorGrayGray2).tFamily("Inter");
      case InputSize.medium:
        return tStyle.body3.Bold.tColor(colorGrayGray2).tFamily("Inter");
      case InputSize.small:
        return tStyle.body4.Bold.tColor(colorGrayGray2).tFamily("Inter");
    }
  }

  TextStyle get errorStyle {
    switch (widget.size) {
      case InputSize.large:
        return tStyle.fs(fontSize: 14, height: 20 / 14).fw(FontWeight.w400).tColor(colorAlertRed).tFamily("Inter");
      case InputSize.medium:
        return tStyle.fs(fontSize: 14, height: 20 / 14).fw(FontWeight.w400).tColor(colorAlertRed).tFamily("Inter");
      case InputSize.small:
        return tStyle.fs(fontSize: 12, height: 16 / 12).fw(FontWeight.w400).tColor(colorAlertRed).tFamily("Inter");
    }
  }

  double get prefixIconWidth {
    switch (widget.size) {
      case InputSize.large:
        return 50.px;
      case InputSize.medium:
        return 48.px;
      case InputSize.small:
        return 44.px;
    }
  }
}
