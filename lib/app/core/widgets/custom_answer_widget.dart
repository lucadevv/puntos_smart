import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class CustomItemAnswerWidget extends StatefulWidget {
  const CustomItemAnswerWidget({
    super.key,
    required this.index,
    this.indexAnimation = 1,
  });

  final int index;
  final int? indexAnimation;

  @override
  State<CustomItemAnswerWidget> createState() => _CustomItemAnswerWidgetState();
}

class _CustomItemAnswerWidgetState extends State<CustomItemAnswerWidget> {
  double width = 0;
  bool myAnimation = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((time) {
      setState(() {
        myAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AnimatedContainer(
      duration: Duration(
          milliseconds: widget.indexAnimation! + 650 + ((widget.index) * 250)),
      transform: Matrix4.translationValues(myAnimation ? 0 : -560, 0, 0),
      curve: Curves.easeInOut,
      child: Container(
        width: 175,
        margin: const EdgeInsets.only(
          left: 6,
          right: 0,
          top: 10,
          bottom: 10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), //12
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.greymedium.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.greyligth,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const Spacer(),
            Text(
              'Hamburguesas',
              style: textTheme.bodySmall!.copyWith(
                color: Colors.black54,
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 4),
            Text(
              'Titulo de la Encuesta, maximo tres lineas y longitud',
              style: textTheme.bodySmall!.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 2),
            Text(
              'Gana 20 PS',
              style: textTheme.bodySmall!.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.end,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
