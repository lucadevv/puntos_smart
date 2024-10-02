import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';

class RateStoreScreen extends StatefulWidget {
  const RateStoreScreen({super.key, required this.idTienda});
  final String idTienda;

  @override
  State<RateStoreScreen> createState() => _RateStoreScreenState();
}

class _RateStoreScreenState extends State<RateStoreScreen> {
  double valueSlider = 0.0;

  setValueSlirer(double value) {
    setState(() {
      valueSlider = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: size.height * 0.7,
            width: size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 1,
                  spreadRadius: 1,
                )
              ],
              border: Border.all(color: Colors.grey.withOpacity(0.4), width: 2),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Califica a MarcDonals',
                        style: textTheme.headlineSmall!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                          (index) {
                            return Icon(
                              index < valueSlider
                                  ? Iconsax.star4
                                  : Iconsax.star,
                              size: 40,
                              shadows: [
                                Shadow(
                                  color: Colors.amber,
                                  blurRadius: index < valueSlider ? 10 : 0,
                                )
                              ],
                              color: index < valueSlider
                                  ? Colors.amber
                                  : Colors.grey,
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      AnimatedDefaultTextStyle(
                        style: textTheme.headlineSmall!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          qualityRatings[valueSlider
                              .round()], // Mostrar el texto según el valor del slider
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 350,
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(
                              rateList.length,
                              (index) {
                                final mappedIndex =
                                    rateList.length - valueSlider.round();
                                final asset = rateList[index];
                                return AnimatedDefaultTextStyle(
                                  style: textTheme.headlineSmall!.copyWith(
                                    fontSize:
                                        index == mappedIndex.round() ? 55 : 40,
                                    color: Colors.amber,
                                  ),
                                  duration: const Duration(milliseconds: 300),
                                  child: Text(
                                    asset,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 12,
                                activeTrackColor: AppColors
                                    .colorStar, // Color del track activo
                                inactiveTrackColor: Colors.grey.withOpacity(
                                    0.3), // Color del track inactivo (fondo)
                                thumbColor: AppColors
                                    .colorStar, // Color del thumb (círculo que se mueve)
                                activeTickMarkColor: Colors
                                    .white, // Color de los puntos en la parte activa
                                inactiveTickMarkColor: Colors
                                    .grey, // Color de los puntos en la parte inactiva
                                tickMarkShape: const RoundSliderTickMarkShape(
                                    tickMarkRadius: 0.0),
                                overlayColor: Colors.amber.withOpacity(0.2),
                              ),
                              child: Slider(
                                min: 0.0,
                                max: 5.0,
                                divisions: 5,
                                thumbColor: AppColors.colorStar,
                                activeColor: AppColors.colorStar,
                                value: valueSlider,
                                onChanged: (value) => setValueSlirer(value),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButtonWidget(
                  title: 'Enviar',
                  width: 200,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final rateList = [
  '😁',
  '🙂',
  '😐',
  '🙁',
  '😧',
];

final List<String> qualityRatings = [
  "", // Índice 0 (Valor 0 del slider)
  "Pésimo", // Índice 1 (Valor 1 del slider)
  "Malo", // Índice 2 (Valor 2 del slider)
  "Regular", // Índice 3 (Valor 3 del slider)
  "Bueno", // Índice 4 (Valor 4 del slider)
  "Excelente" // Índice 5 (Valor 5 del slider)
];
