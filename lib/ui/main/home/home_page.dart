import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_functions.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/core/constants/constants.dart';
import 'package:sample_app_getx/core/custom_widgets/custom_button/custom_button.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';
import 'package:sample_app_getx/routes/app_routes.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        backgroundColor: AppColors.greyMain,
        appBar: AppBar(
          leading: SizedBox(),
          title: const Text(
            'All cards',
            style: AppTextStyles.appBarTitle,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ctrl.cards.isEmpty
              ? Center(
                  child: Text(
                    'You don\'t have any pocket',
                    style: AppTextStyles.appBarTitle
                        .copyWith(color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  padding: AppUtils.kPadding16,
                  itemCount: ctrl.cards.length,
                  itemBuilder: (ctx, index) {
                    final double balance = 123;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 180,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: AppUtils.kBorderRadius12,
                                child: ctrl.cards[index].isTheme == true
                                    ? SvgPicture.asset(
                                        ctrl.cards[index].image,
                                        fit: BoxFit.cover,
                                      )
                                    : ctrl.cards[index].selectImage == true
                                        ? ClipRRect(
                                            borderRadius:
                                                AppUtils.kBorderRadius18,
                                            child: Image.file(
                                              File(ctrl.cards[index].image),
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : ctrl.cards[index].isImage == true
                                            ? ClipRRect(
                                                borderRadius:
                                                    AppUtils.kBorderRadius18,
                                                child: Image.asset(
                                                  ctrl.cards[index].image,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : ctrl.cards[index].selectColor ==
                                                    true
                                                ? ClipRRect(
                                                    borderRadius: AppUtils
                                                        .kBorderRadius18,
                                                    child: Expanded(
                                                      child: Container(
                                                        color: ctrl
                                                            .cards[index].color,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ctrl.cards[index].cardNumber,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.white),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        width: 50,
                                        child: Image.asset(
                                          ctrl.checkCardType(index),
                                        ),
                                      ),
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
                                              ctrl.cards[index].cardNumber),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          BaseFunctions.formatExpDate(ctrl
                                              .cards[index].cardExpireNumber),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
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
                    );
                  },
                ),
        ),
        bottomNavigationBar: SafeArea(
          minimum: AppUtils.kPadding16,
          child: CustomButton(
            onTap: () {
              Get.toNamed(Routes.addCard);
            },
            color: AppColors.assets,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                Text(
                  'Add card',
                  style: AppTextStyles.defaultButtonStyle,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
