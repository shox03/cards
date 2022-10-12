import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_functions.dart';
import 'package:sample_app_getx/controller/main/edit_page/edit_page_controller.dart';
import 'package:sample_app_getx/ui/main/home/edit_page/widget/circle_color_widget.dart';
import 'package:sample_app_getx/ui/main/home/edit_page/widget/color_picker.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_utils.dart';

class ChooseBackgroundWidget extends StatelessWidget {
  const ChooseBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCardController>(
      builder: (ctrl) {
        return Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Select card theme",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    MaterialColorPickerExample(
                        pickerColor: ctrl.currentColor,
                        onColorChanged: ctrl.changeColor),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: AppUtils.kBorderRadius12,
                          child: ctrl.isTheme == true
                              ? SvgPicture.asset(
                                  AppConstants.backgroundList[ctrl.chosenColor],
                                  fit: BoxFit.cover,
                                )
                              : ctrl.selectImage == true
                                  ? ClipRRect(
                                      borderRadius: AppUtils.kBorderRadius18,
                                      child: Image.file(
                                        File(ctrl.selfiePath),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : ctrl.isImage == true
                                      ? ClipRRect(
                                          borderRadius:
                                              AppUtils.kBorderRadius18,
                                          child: Image.asset(
                                            ctrl.image,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : ctrl.colorPicker == true
                                          ? ClipRRect(
                                              borderRadius:
                                                  AppUtils.kBorderRadius18,
                                              child: Expanded(
                                                child: Container(
                                                  color: ctrl.currentColor,
                                                ),
                                              ))
                                          : SvgPicture.asset(
                                              AppConstants.backgroundList[
                                                  ctrl.chosenColor],
                                              fit: BoxFit.cover,
                                            ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16.5,
                          bottom: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ctrl.cardNameController.text == ""
                                      ? "User card"
                                      : ctrl.cardNameController.text,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff7CFFC8)),
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 50,
                                    child: Image.asset(ctrl.checkCardType())),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "0.00 so'm",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    BaseFunctions.formatCardNumber(
                                      ctrl.cardNumberController.text == ""
                                          ? " "
                                          : ctrl.cardNumberController.text
                                              .replaceAll(' ', ''),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Text(
                                    ctrl.cardExpireController.text == ""
                                        ? "User card"
                                        : ctrl.cardExpireController.text,
                                    // BaseFunctions.formatExpDate('04/25'),
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      AppConstants.colors.length,
                      (index) => InkWell(
                        onTap: () {
                          ctrl.chooseColor(index);
                          ctrl.imageOrTheme(
                              imageTap: false,
                              selectImageTap: false,
                              themeTap: true,
                              colorPickerTap: false);
                        },
                        child: ColorPicker(
                          isSelected: ctrl.chosenColor == index,
                          color1: AppConstants.colors[index].color1,
                          color2: AppConstants.colors[index].color2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
