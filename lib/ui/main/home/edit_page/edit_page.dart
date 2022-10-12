import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/edit_page/edit_page_controller.dart';
import 'package:sample_app_getx/core/bottomsheet/custom_bottom_sheet.dart';
import 'package:sample_app_getx/core/custom_widgets/custom_button/custom_button.dart';
import 'package:sample_app_getx/core/custom_widgets/custom_email_text_field.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';
import 'package:sample_app_getx/routes/app_routes.dart';
import 'package:sample_app_getx/ui/main/home/edit_page/widget/actions_bottomsheet.dart';
import 'package:sample_app_getx/ui/main/home/edit_page/widget/choose_background_widget.dart';
import 'package:sample_app_getx/ui/main/home/edit_page/widget/color_picker.dart';

class EditCardPage extends StatelessWidget {
  const EditCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCardController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.greyMain,
          appBar: AppBar(
            title: const Text(
              'Add card',
              style: AppTextStyles.appBarTitle,
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius12,
                  color: AppColors.white,
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'Select pocket image',
                        style: AppTextStyles.appBarTitle,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 160,
                      child: ListView.separated(
                        itemCount: 6,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return index == 0
                              ? InkWell(
                                  onTap: () {
                                    customBottomSheet(
                                      context: context,
                                      child: const ActionsBottomSheet(),
                                    );
                                    controller.chooseIcon(index);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: AppUtils.kBorderRadius18,
                                      color: AppColors.greyMain,
                                      gradient: controller.chosenIcon == index
                                          ? LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: controller.gradientColor,
                                            )
                                          : null,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    height: controller.chosenIcon == index
                                        ? 140
                                        : 120,
                                    width: controller.chosenIcon == index
                                        ? 190
                                        : 180,
                                    child: controller.selfiePath == ""
                                        ? SvgPicture.asset(
                                            'assets/svg/ic_camera_new.svg',
                                            fit: BoxFit.cover,
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                AppUtils.kBorderRadius18,
                                            child: Image.file(
                                              File(controller.selfiePath),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    controller.chooseIcon(index);
                                    controller.imageOrTheme(
                                        imageTap: true,
                                        selectImageTap: false,
                                        themeTap: false,
                                      colorPickerTap: false
                                    );
                                  },
                                  child: Container(
                                    height: controller.chosenIcon == index
                                        ? 140
                                        : 120,
                                    width: controller.chosenIcon == index
                                        ? 190
                                        : 180,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: AppUtils.kBorderRadius18,
                                      color: AppColors.greyMain,
                                      gradient: controller.chosenIcon == index
                                          ? LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: controller.gradientColor,
                                            )
                                          : null,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: AppUtils.kBorderRadius18,
                                      child: Image.asset(
                                        controller.imagesList[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                        },
                        separatorBuilder: (ctx, index) =>
                            const SizedBox(width: 8),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              const ChooseBackgroundWidget(),
              const SizedBox(height: 12),
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: AppUtils.kBorderRadius12,
                    color: AppColors.white,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CustomEmailTextField(
                        labelText: 'Card number',
                        labelStyle: AppTextStyles.normalTriarity15,
                        controller: controller.cardNumberController,
                        hintText: 'Enter card number',
                        focusNode: controller.nameFocus,
                        validationText: 'Enter card number for new card',
                        labelPadding: 4,
                        keyboardType: TextInputType.number,
                        errorText: "Required field",
                        showError: controller.errorText1,
                        fillColor: AppColors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 13),
                        textStyle: AppTextStyles.normalBlack17,
                        inputFormatters: [controller.cardNumberFormatter],
                        onChanged: (value) {
                          controller.onChangedNumber(value);
                        },
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.assets, width: 1),
                          borderRadius: AppUtils.kBorderRadius12,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.black.withOpacity(0.12),
                            width: 0.5,
                          ),
                          borderRadius: AppUtils.kBorderRadius12,
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.red, width: 1),
                          borderRadius: AppUtils.kBorderRadius12,
                        ),
                      ),
                      CustomEmailTextField(
                        labelText: 'Card name',
                        labelStyle: AppTextStyles.normalTriarity15,
                        controller: controller.cardNameController,
                        hintText: 'Enter card name',
                        showError: controller.errorText2,
                        validationText: 'Enter name for new card',
                        labelPadding: 4,
                        fillColor: AppColors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 13),
                        textStyle: AppTextStyles.normalBlack17,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Zа-яА-Я0-9 ]')),
                        ],
                        onChanged: (value) {
                          controller.onChangedName(value);
                        },
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.assets, width: 1),
                          borderRadius: AppUtils.kBorderRadius12,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.black.withOpacity(0.12),
                            width: 0.5,
                          ),
                          borderRadius: AppUtils.kBorderRadius12,
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.red, width: 1),
                          borderRadius: AppUtils.kBorderRadius12,
                        ),
                      ),
                      CustomEmailTextField(
                        labelText: 'Expire date',
                        labelStyle: AppTextStyles.normalTriarity15,
                        controller: controller.cardExpireController,
                        hintText: 'Enter expire date',
                        validationText: controller.expireError,
                        labelPadding: 4,
                        keyboardType: TextInputType.number,
                        showError: controller.errorText3,
                        fillColor: AppColors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 13),
                        textStyle: AppTextStyles.normalBlack17,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(5),
                          controller.mask
                        ],
                        onChanged: (value) {
                          controller.onChangedExpire(value);
                        },
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.assets, width: 1),
                          borderRadius: AppUtils.kBorderRadius12,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.black.withOpacity(0.12),
                            width: 0.5,
                          ),
                          borderRadius: AppUtils.kBorderRadius12,
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.red, width: 1),
                          borderRadius: AppUtils.kBorderRadius12,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 12),
            ],
          ),
          bottomNavigationBar: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CustomButton(
              color: controller.isValidd ? AppColors.assets : AppColors.grey,
              onTap: () async {
                if (controller.isValidd == true) {
                  await controller.addNewCard();
                  await controller.homeController.getLocal();
                  Get.back();
                  Get.back();
                }
              },
              child: const Text(
                'Add',
                style: AppTextStyles.buttonTextStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
