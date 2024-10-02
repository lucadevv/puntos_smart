import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Proximamente",
              style: textTheme.headlineLarge!.copyWith(
                color: Colors.black54,
              ),
            ),
            const Icon(
              Iconsax.game,
              color: Colors.black54,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
