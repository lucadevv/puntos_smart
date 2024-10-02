import 'package:flutter/material.dart';

class OtpScrollPhysics extends ScrollPhysics {
  const OtpScrollPhysics({super.parent});

  @override
  OtpScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return OtpScrollPhysics(parent: buildParent(ancestor));
  }

  // Deshabilita la interacción del usuario para el desplazamiento
  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) {
    return false;
  }
}
