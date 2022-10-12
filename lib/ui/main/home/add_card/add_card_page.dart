import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/add_card/add_card_controller.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/routes/app_routes.dart';
import 'package:sample_app_getx/ui/main/home/add_card/widgets/choose_type_card.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCardController>(builder: (ctr) {
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "What type do you want to add",
                  style: AppTextStyles.normalGrey20,
                  textAlign: TextAlign.center,
                ),
              ),
              ChooseTypeCard(
                  icon: 'assets/png/ic_uzcard.png',
                  name: 'Uzcard',
                  onTap: () {
                    Get.toNamed(
                      Routes.editCard,
                      arguments: ['uzcard'],
                    );
                  }),
              ChooseTypeCard(
                  icon: 'assets/png/humocard1.png',
                  name: 'Humo',
                  onTap: () {
                    Get.toNamed(
                      Routes.editCard,
                      arguments: ['humo'],
                    );
                  }),
              ChooseTypeCard(
                  icon: 'assets/png/system-visa_c.png',
                  name: 'Visa',
                  onTap: () {
                    Get.toNamed(
                      Routes.editCard,
                      arguments: ['visa'],
                    );
                  }),
            ],
          ));
    });
  }
}
