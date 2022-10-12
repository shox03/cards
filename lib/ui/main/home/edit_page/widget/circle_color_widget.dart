import 'package:flutter/material.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({Key? key, required this.isSelected, this.color1, this.color2})
      : super(key: key);
  final bool isSelected;
  final color1;
  final color2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ]
            )
          ),
        ),
        Positioned(
          left: 2,
          right: 2,
          top: 2,
          bottom: 2,
          child: Container(
            height: 30.0,
            width: 30.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.white : Colors.transparent,
                  width: 3,
                )),
          ),
        )
      ],
    );
  }
}
