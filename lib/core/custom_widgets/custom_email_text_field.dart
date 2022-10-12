// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';

class CustomEmailTextField extends StatelessWidget {
  final int maxLines;
  final int? maxLength;
  final String? labelText;
  final bool? showError;
  final Color? cursorColor;
  final TextEditingController? controller;
  final bool autoFocus;
  final Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final String? prefixText;
  final String? errorText;
  final TextInputAction? inputAction;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final String? hintText;
  final bool? obscureText;
  final BuildContext? context;
  final Function()? onTap, onComplete;
  final String validationText;
  final bool readOnly;
  final double radius;
  final double labelPadding;
  final String? suffixText;
  final Widget? suffixIcon, prefixIcon;
  final TextStyle? suffixStyle, labelStyle, textStyle;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Color? fillColor,
      focusedBorderColor,
      enabledBorderColor,
      errorBorderColor,
      focusedErrorBorderColor;
  final EdgeInsets? contentPadding;
  final InputBorder? focusedBorder,
      enabledBorder,
      errorBorder,
      focusedErrorBorder;
  final bool required;
  final FocusNode? focusNode;
  bool isDate = false;
  final TextCapitalization? textCapitalization;
  bool isEmail;
  bool? enabled;

  CustomEmailTextField({
    Key? key,
    this.labelText,
    this.showError,
    this.controller,
    this.autoFocus = false,
    this.onChanged,
    this.keyboardType,
    this.prefixText,
    this.errorText,
    this.inputAction,
    this.currentFocus,
    this.nextFocus,
    this.obscureText,
    this.hintText,
    this.context,
    this.onTap,
    this.readOnly = false,
    this.suffixText,
    this.suffixIcon,
    this.suffixStyle,
    this.prefixIcon,
    this.inputFormatters,
    this.fillColor,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.onComplete,
    this.required = false,
    this.focusNode,
    this.validator,
    this.radius = 12,
    this.labelPadding = 12,
    this.labelStyle,
    this.textStyle,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    this.isDate = false,
    required this.validationText,
    this.isEmail = false,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.textCapitalization,
    this.cursorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(bottom: labelPadding),
            child: RichText(
              text: TextSpan(
                text: labelText ?? '',
                style: labelStyle ??
                    const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackSecondary,
                    ),
                children: required
                    ? [
                        const TextSpan(
                          text: ' *',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.red,
                          ),
                        ),
                      ]
                    : [],
              ),
            ),
          ),
        TextFormField(
          enabled: enabled,
          validator: validator ??
              (value) {
                if (value == null || value.replaceAll('0', '').isEmpty) {
                  return validationText;
                }
                if (isEmail) {
                  if (!GetUtils.isEmail(value)) {
                    return 'Incorrect email format: "example.@gmail.com"';
                  }
                  if (value.length <= 10) {
                    return 'Email cannot be too short';
                  }
                  return null;
                }
                return null;
              },
          inputFormatters: inputFormatters,
          autocorrect: false,
          style: textStyle ??
              const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: AppColors.black,
              ),
          obscureText: obscureText ?? false,
          readOnly: readOnly,
          controller: controller,
          focusNode:  focusNode,
          onTap: onTap,
          maxLines: maxLines,
          maxLength: maxLength,
          autofocus: autoFocus,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          onChanged: onChanged,
          onFieldSubmitted: (term) {
            _fieldFocusChange(
              context,
              focusNode,
              nextFocus,
            );
          },
          obscuringCharacter: '*',
          textInputAction: inputAction,
          decoration: InputDecoration(
            constraints: const BoxConstraints(minHeight: 50),
            prefixIcon: prefixIcon,
            suffixText: suffixText,
            suffixStyle: suffixStyle ??
                const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: AppColors.black,
                ),
            suffixIcon: suffixIcon,
            prefixText: prefixText,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
            isDense: true,
            filled: true,
            prefixStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppColors.black,
            ),
            hintText: hintText,
            fillColor: fillColor ?? AppColors.textFieldColor,
            hintStyle:
                AppTextStyles.searchNotFound.copyWith(color: AppColors.grey),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.assets, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                      // color: focusedBorderColor ?? AppColors.assets, width: 1),
                      color: AppColors.newSoftBlue),
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: enabledBorderColor ?? Colors.black.withOpacity(0.12),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
            errorBorder: errorBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorBorderColor ?? AppColors.red, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
            focusedErrorBorder: focusedErrorBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                      color: focusedBorderColor ?? AppColors.red, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
            errorText: showError ?? false ? validationText : null,
          ),
          cursorColor: AppColors.newSoftBlue,
          showCursor: true,
          keyboardType: keyboardType,
          onEditingComplete: onComplete,
        ),
      ],
    );
  }

  _fieldFocusChange(
    BuildContext context,
    FocusNode? currentFocus,
    FocusNode? nextFocus,
  ) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}
