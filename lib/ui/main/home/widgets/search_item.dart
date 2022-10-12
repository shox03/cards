import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app_getx/base/base_functions.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/data/models/categories/category_response.dart';
import 'package:get/get.dart';

class SearchItem extends StatelessWidget {
  final Products? product;
  final Function()? onTap;

  const SearchItem({Key? key, this.product, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          leading: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.productBackground,
            ),
            padding: const EdgeInsets.all(8),
            child: CachedNetworkImage(
              imageUrl: product?.image ?? '',
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const Center(child: CupertinoActivityIndicator()),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/png/logo.png"),
            ),
          ),
          title:
              Text(product?.name ?? "", style: AppTextStyles.searchItemTitle),
          trailing: Text(
            '${BaseFunctions.moneyFormat(double.parse(product?.price ?? "0"))} ${'sum'.tr}',
            style: AppTextStyles.searchItemPrice,
          ),
        ),
      ),
    );
  }
}
