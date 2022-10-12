import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sample_app_getx/bindings/splash_bindings.dart';
import 'package:sample_app_getx/core/constants/constants.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/data/floor/app_database.dart';
import 'package:sample_app_getx/data/models/cards/cards_model.dart';
import 'package:sample_app_getx/routes/app_pages.dart';
import 'package:sample_app_getx/routes/app_routes.dart';
import 'package:sample_app_getx/translations/app_translations.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Hive.initFlutter();
  Hive.registerAdapter(CardsModelAdapter());
  await AppDatabase.init();
  runApp(MyApp(currentLocale: LocalSource.getInstance().getLocale()));
}

class MyApp extends StatelessWidget {
  final String currentLocale;

  const MyApp({
    Key? key,
    required this.currentLocale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: GetMaterialApp(
        navigatorKey: AppConstants.navigatorKey,
        theme: AppThemes.light,
        debugShowCheckedModeBanner: false,
        initialBinding: SplashBindings(),
        initialRoute: Routes.initial,
        getPages: AppPages.pages,
        locale: Locale(currentLocale),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        translationsKeys: AppTranslations.translations,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 100),
      ),
    );
  }
}
