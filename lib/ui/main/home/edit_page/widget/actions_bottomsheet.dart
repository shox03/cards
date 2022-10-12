import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/edit_page/edit_page_controller.dart';
import '../../../../../core/bottomsheet/custom_modal_bottom_widget.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../../../../../core/theme/app_utils.dart';

class ActionsBottomSheet extends StatelessWidget {
  const ActionsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCardController>(
      builder: (ctrl) {
        return CustomModalBottomWidget(
          title: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 13.0,
            ),
            child: Text(
              'Actions',
              style: AppTextStyles.bottomSheetTitle,
            ),
          ),
          minChildren: [
            const Divider(height: 1),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      borderRadius: AppUtils.kBorderRadius8,
                      color: Color(0xffEEF4FF),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/svg/ic_gallery.svg',
                        color: AppColors.assets,
                      ),
                    ),
                  ),
                  title: const Text(
                    'Select From Gallery',
                    style: AppTextStyles.stockTitle,
                  ),
                  onTap: () async {
                    Get.back();
                    final result = await ctrl.getImageGallery();


                    // ctrl.showHide();
                    // ctrl.mainController.setIsGallery(false);
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 70.0),
                  child: Divider(height: 1),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
