import 'package:flutter/material.dart';

class CustomImageLogoStoreWidget extends StatelessWidget {
  const CustomImageLogoStoreWidget({
    super.key,
    required this.height,
    required this.width,
    this.onTapLogo,
  });
  final double height;
  final double width;
  final VoidCallback? onTapLogo;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPnFSZinVzEYIqJ3sOwdpO2lW9gsi09e9nvQ&s',
              fit: BoxFit.fill,
              height: height,
              width: width,
              // height: 350,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTapLogo,
              ),
            )
          ],
        ),
      ),
    );
  }
}
