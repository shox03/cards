import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color color;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry alignment;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.onTap,
    this.height = 48,
    required this.child,
    this.margin = EdgeInsets.zero,
    this.borderRadius,
    this.color = AppColors.assets,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ElevatedButton(
        autofocus: true,
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: isLoading ? AppColors.white1 : color,
          onPrimary: AppColors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? AppUtils.kBorderRadius12,
          ),
        ).copyWith(
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return 0;
              return 0;
            },
          ),
          fixedSize: MaterialStateProperty.all(Size(double.infinity, height)),
        ),
        child: Container(
          padding: padding,
          alignment: alignment,
          child: isLoading
              ? Platform.isAndroid
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Color(0xff888888),
                      ),
                    )
                  : const CupertinoActivityIndicator(
                      radius: 13,
                      animating: true,
                      color: Color(0xff888888),
                    )
              : child,
        ),
      ),
    );
  }
}
