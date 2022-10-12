import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/core/custom_widgets/custom_button/custom_button.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';

class InternetConnectionPage extends StatefulWidget {
  const InternetConnectionPage({Key? key}) : super(key: key);

  @override
  _InternetConnectionPageState createState() => _InternetConnectionPageState();
}

class _InternetConnectionPageState extends State<InternetConnectionPage> {
  bool _isLoading = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result != ConnectivityResult.none) {
      Get.back();
    }
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(36),
              child: Image.asset(
                'assets/png/no_internet.png',
                height: Get.height * 310 / 812,
                width: Get.width * 306 / 375,
              ),
            ),
            Text('internet_title'.tr, style: AppTextStyles.noInternetTitle),
            const SizedBox(height: 12),
            Text(
              'internet_subtitle'.tr,
              style: AppTextStyles.noInternetSubTitle,
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: CustomButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: _isLoading,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0, left: 12),
                    child: Theme(
                      data: ThemeData(
                        cupertinoOverrideTheme: const CupertinoThemeData(
                          brightness: Brightness.dark,
                        ),
                      ),
                      child: const CupertinoActivityIndicator(
                        radius: 12,
                        animating: true,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: _isLoading ? 36 : 0),
                      child: Text(
                        'try_again'.tr,
                        style: const TextStyle(
                          color: AppColors.white,
                          letterSpacing: 1,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            height: 50,
            onTap: () async {
              setState(() {
                _isLoading = true;
              });
              await Future.delayed(const Duration(milliseconds: 300));
              var connectivityResult = await Connectivity().checkConnectivity();
              setState(() {
                _isLoading = false;
              });
              if (connectivityResult != ConnectivityResult.none) {
                Get.back();
              }
            },
          ),
        ),
      ),
    );
  }
}
