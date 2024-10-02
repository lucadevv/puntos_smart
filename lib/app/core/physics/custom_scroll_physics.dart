import 'package:flutter/material.dart';

class NoUserBouncingScrollPhysics extends BouncingScrollPhysics {
  const NoUserBouncingScrollPhysics({super.parent});

  @override
  NoUserBouncingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return NoUserBouncingScrollPhysics(parent: buildParent(ancestor));
  }

  // Deshabilitar la interacción del usuario para el desplazamiento
  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) {
    return false; // Bloquea el desplazamiento manual
  }
}
