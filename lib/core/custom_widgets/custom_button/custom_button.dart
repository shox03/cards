import 'package:flutter/material.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final Widget child;
  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color color;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry alignment;

  CustomButton({
    Key? key,
    required this.onTap,
    this.height = 56,
    required this.child,
    this.margin = EdgeInsets.zero,
    this.borderRadius,
    this.color = AppColors.assets,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: () => onTap(),
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
        ).copyWith(
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return 0;
              return 0;
            },
          ),
        ),
        child: Container(
          height: height,
          padding: padding,
          alignment: alignment,
          child: child,
        ),
      ),
    );
  }
}
