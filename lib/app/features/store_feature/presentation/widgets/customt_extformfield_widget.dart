import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puntos_smart_user/app/core/constants/validations.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class CustomTextFormFielWidget extends StatefulWidget /*StatelessWidget*/ {
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
    this.isSearch = false,
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
  final bool? isSearch;

  @override
  _CustomTextFormFielWidgetState createState() =>
      _CustomTextFormFielWidgetState();
}

class _CustomTextFormFielWidgetState extends State<CustomTextFormFielWidget> {
  final Validations validations = Validations();
  String errorMessage = '';
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Asegurar que el controlador no sea nulo antes de acceder a él
    final controllerText = widget.controller?.text ?? '';

    // Validaciones
    void validateInput(String value) {
      setState(() {
        if (widget.isPhone == true) {
          if (validations.isValidPhoneNumber(value)) {
            isValid = true;
            errorMessage = '';
          } else {
            isValid = false;
            errorMessage = 'Formato no válido';
          }
        } else if (widget.isPassword == true) {
          if (validations.isValidPassword(value)) {
            isValid = true;
            errorMessage = '';
          } else {
            isValid = false;
            errorMessage = 'Mínimo 8 caracteres';
          }
        }
      });
    }

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            key: widget.isOtp == true
                ? ValueKey(controllerText)
                : null, // Comprobar si el controller está vacío
            controller: widget.controller,

            scrollPadding: EdgeInsets.zero,
            focusNode: widget.unFocus,
            // onChanged: widget.onChanged,
            onChanged: (value) {
              if (widget.onChanged != null) widget.onChanged!(value);
              validateInput(value); // Validar en cada cambio de texto
            },
            obscureText: widget.isPassword!,
            style: widget.isOtp == true
                ? textTheme.titleLarge!.copyWith(
                    color: AppColors.blacknew,
                    fontWeight: FontWeight.w700,
                  )
                : textTheme.titleMedium!.copyWith(
                    color: AppColors.blacknew,
                  ),
            readOnly: widget.isOtp == true ? false : false,
            showCursor: widget.isOtp == true ? true : true,
            enableInteractiveSelection: widget.isOtp == true ? false : true,
            cursorColor:
                widget.isOtp == true ? Colors.transparent : AppColors.onPrimary,
            textAlign: widget.isOtp == true ? TextAlign.center : TextAlign.left,
            keyboardType: widget.isOtp == true
                ? TextInputType.number
                : widget.isPhone == true
                    ? TextInputType.number
                    : TextInputType.text,
            inputFormatters: widget.isOtp == true
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ]
                : null,
            decoration: InputDecoration(
              border: InputBorder.none, // Desactiva el subrayado

              //
              prefixText: widget.isPhone == true ? "+51 " : null,
              prefixStyle: textTheme.titleSmall!
                  .copyWith(color: AppColors.greymedium, fontSize: 16.0),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15.0).copyWith(right: 5),
              labelText: widget.label,
              labelStyle: textTheme.titleSmall!.copyWith(
                // color: widget.isFocused == true
                //     ? AppColors.onPrimary
                //     : AppColors.textfield,
                color: isValid
                    ? (widget.isFocused == true
                        ? AppColors.onPrimary
                        : AppColors.textfield)
                    : Colors.red, // Si no es válido, borde rojo
                fontWeight: FontWeight.w500,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: widget.isFocused == true
                    ? AppColors.onPrimary
                    : AppColors.greymedium /*textfield*/,
              ),
              prefixIcon: widget.iconDataPrefix != null
                  ? Container(child: widget.iconDataPrefix)
                  : null,
              suffixIcon: widget.iconDataSufix != null
                  ? IconButton(
                      onPressed: widget.isFocused == true
                          ? widget.isTapPrefixIcon
                          : null,
                      icon: Icon(
                        widget.iconDataSufix,
                        color: widget.isFocused == true
                            ? AppColors.onPrimary
                            : AppColors.textfield,
                      ),
                    )
                  : null,
              //dar color de fondo
              filled: widget.isSearch == true
                  ? true
                  : false, // Esto activa el fondo
              fillColor: widget.isSearch == true
                  ? AppColors.greyligth
                  : Colors.transparent,

              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  //color: AppColors.textfield,
                  color: isValid
                      ? (widget.isSearch == true
                          ? Colors.transparent
                          : AppColors.onPrimary)
                      : Colors.red, // Si no es válido, borde rojo
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  //color: AppColors.onPrimary,
                  // color: widget.isSearch == true
                  //     ? Colors.transparent
                  //     : AppColors.onPrimary,
                  color: isValid
                      ? (widget.isSearch == true
                          ? Colors.transparent
                          : AppColors.onPrimary)
                      : Colors.red, // Si no es válido, borde rojo
                  width: 1,
                ),
              ),
            ),
          ),
          //mensaje de error
          if (!isValid && errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 4.0),
              child: Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
