import 'package:flutter/material.dart';

extension IntToSizedBox on int {
  Widget get hSpace => SizedBox(height: toDouble());
  Widget get wSpace => SizedBox(width: toDouble());
}
