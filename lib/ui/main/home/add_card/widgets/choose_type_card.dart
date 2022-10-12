import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';

class ChooseTypeCard extends StatelessWidget {
  const ChooseTypeCard({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.name,
  }) : super(key: key);
  final String icon;
  final String name;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // final split = name.split(' ');
    // final title = name.length <= 1
    //     ? name.toUpperCase()
    //     : (split.length > 1 ? split[0][0] + split[1][0] : name[0] + name[1])
    //         .toUpperCase();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: AppColors.greyMain,
          borderRadius: AppUtils.kBorderRadius12,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: AppUtils.kPadding12,
              decoration: const BoxDecoration(
                borderRadius: AppUtils.kBorderRadius12,
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.greyMain, width: 0.5),
                        color: AppColors.assets,
                        shape: BoxShape.circle),
                    child: ClipRRect(
                      child: SizedBox(
                        height: 40,
                        width: 50,
                        child: Image.asset(
                          icon,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: name.length > 30 ? Get.width * 0.8 : null,
                        child: Text(
                          name,
                          style: AppTextStyles.appBarTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
