import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class CustomTextFormFielWidget extends StatelessWidget {
  const CustomTextFormFielWidget({
    super.key,
    this.hintText,
    this.iconDataPrefix,
    this.unFocus,
    this.label,
    this.isFocused = false,
    this.isOtp = false,
    this.controller,
    this.isPhone = false,
    this.isPassword = false,
    this.iconDataSufix,
    this.isTapPrefixIcon,
    this.isPasswordVisible = false,
    this.onChanged,
    this.prefixText,
  });

  final String? hintText;
  final String? label;
  final Widget? iconDataPrefix;
  final IconData? iconDataSufix;
  final FocusNode? unFocus;
  final bool? isFocused;
  final bool? isOtp;
  final TextEditingController? controller;
  final bool? isPhone;
  final bool? isPassword;
  final VoidCallback? isTapPrefixIcon;
  final bool? isPasswordVisible;
  final Function(String)? onChanged;
  final String? prefixText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Asegurar que el controlador no sea nulo antes de acceder a él
    final controllerText = controller?.text ?? '';

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (context, child) {
            // Aplicar transformación en el eje Z para simular que viene de afuera
            final scaleValue = animation.value;
            final zValue = (1 - animation.value) * 1; // Ajusta este valor

            return Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0, zValue) // Movimiento en eje Z
                ..scale(scaleValue), // Escala suavemente con la animación
              alignment: Alignment.center,
              child: child,
            );
          },
        );
      },
      child: TextFormField(
        key: isOtp == true
            ? ValueKey(controllerText)
            : null, // Comprobar si el controller está vacío
        controller: controller,

        scrollPadding: EdgeInsets.zero,
        focusNode: unFocus,
        onChanged: onChanged,
        obscureText: isPassword!,
        style: isOtp == true
            ? textTheme.titleLarge!.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
              )
            : textTheme.titleMedium!.copyWith(
                color: Colors.black54,
              ),
        readOnly: isOtp == true ? false : false,
        showCursor: isOtp == true ? true : true,
        enableInteractiveSelection: isOtp == true ? false : true,
        cursorColor: isOtp == true ? Colors.transparent : AppColors.onPrimary,
        textAlign: isOtp == true ? TextAlign.center : TextAlign.left,
        keyboardType: isOtp == true
            ? TextInputType.number
            : isPhone == true
                ? TextInputType.number
                : TextInputType.text,
        inputFormatters: isOtp == true
            ? [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ]
            : null,
        decoration: InputDecoration(
          prefixText: isPhone == true ? "+51 " : null,
          prefixStyle: textTheme.titleSmall!.copyWith(
            color: Colors.black54,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          labelText: label,
          labelStyle: textTheme.titleSmall!.copyWith(
            color:
                isFocused == true ? AppColors.onPrimary : AppColors.textfield,
            fontWeight: FontWeight.w500,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color:
                isFocused == true ? AppColors.onPrimary : AppColors.textfield,
          ),
          prefixIcon:
              iconDataPrefix != null ? Container(child: iconDataPrefix) : null,
          suffixIcon: iconDataSufix != null
              ? IconButton(
                  onPressed: isFocused == true ? isTapPrefixIcon : null,
                  icon: Icon(
                    iconDataSufix,
                    color: isFocused == true
                        ? AppColors.onPrimary
                        : AppColors.textfield,
                  ),
                )
              : null,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: AppColors.textfield,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: AppColors.onPrimary,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
