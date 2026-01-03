import 'package:flutter/material.dart';
import 'package:widget_book_demo/common/button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;


@widgetbook.UseCase(name: 'AppButton', type: AppButton)
Widget buildCoolButtonUseCase(BuildContext context) {
  return AppButton();
}
