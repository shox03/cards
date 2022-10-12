import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/core/constants/constants.dart';
import 'package:sample_app_getx/core/custom_widgets/forrmatters/card_formatter.dart';
import 'package:sample_app_getx/core/custom_widgets/forrmatters/mask_formatter.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/data/hive/local_storage_repository.dart';
import 'package:sample_app_getx/data/models/cards/cards_model.dart';

class EditCardController extends BaseController {
  LocalSource localSource = LocalSource.getInstance();
  final String _currency = '';
  String _selfieImage = '';
  final homeController = Get.find<HomeController>();
  final cardNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final cardExpireController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final LocalStorageRepository hive = LocalStorageRepository();

  final cardNumberFormatter = CardFormatter();
  final mask = CardExpirationFormatter();
  int maxYear = (DateTime.now().year - 2000) + 12;
  bool isValidd = false;
  int chosenIcon = 0;
  int chosenCurrency = 0;
  PickedFile? pickedImage;
  String image = '';
  bool listView = false;
  List _currencies = [];
  int chosenColor = 0;
  bool isEditFuncOn = false;
  bool isFirst = false;
  bool isImage = false;
  bool isTheme = false;
  bool selectImage = false;
  bool colorPicker = false;

  String cardType = '';
  bool errorText1 = false;
  bool errorText2 = false;
  bool errorText3 = false;
  String expireError = '';
  List<CardsModel> questionsModel = [];
  String finalImage = '';

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  List<String> iconsList = [
    'assets/svg/ic_pocket1.svg',
    'assets/svg/ic_pocket2.svg',
    'assets/svg/ic_pocket3.svg',
    'assets/svg/ic_pocket4.svg',
    'assets/svg/ic_pocket5.svg',
    'assets/svg/ic_pocket6.svg',
    'assets/svg/ic_pocket7.svg',
  ];
  List<String> imagesList = [
    'assets/png/tovus.jpg',
    'assets/png/soat.jpg',
    'assets/png/it.jpg',
    "assets/png/qo'ziqorn.webp",
    'assets/png/Butterfly.jpg',
    'assets/png/tovus.jpg',
    'assets/png/quyon.jpg',
  ];
  List<String> currencyShortName = ['TRY', 'USD', 'EUR'];
  List<String> cardTypeList = [
    'assets/png/ic_uzcard.png',
    'assets/png/humocard1.png',
    'assets/png/system-visa_c.png',
  ];

  @override
  void onInit() {
    if (Get.arguments != null) {
      cardType = Get.arguments[0];
      update();
    }
    super.onInit();
  }

  @override
  void onReady() async {
    checkCardType();
    Box box = await hive.openBox();
    questionsModel = hive.getCards(box);
    debugPrint("${questionsModel}");
    // final result = await localSource.getCards();

    // questionsModel = await localSource.getCards();

    update();
    super.onReady();
  }

  void changeColor(Color color) {
    currentColor = color;
    update();
  }

  checkCardType() {
    if (cardType == 'uzcard') {
      return cardTypeList[0];
    } else if (cardType == 'humo') {
      return cardTypeList[1];
    } else if (cardType == 'visa') {
      return cardTypeList[2];
    } else {
      return cardTypeList[0];
    }
  }

  setViewOption(bool value) {
    listView = value;
    update();
  }

  chooseIcon(int index) {
    chosenIcon = index;
    image = imagesList[index];

    update();
  }

  chooseColor(int index) {
    chosenColor = index;
    update();
  }

  chooseCurrency(int index) {
    chosenCurrency = index;
    update();
  }

  void setFirstTab() {
    isFirst = true;
    update();
  }

  List<Color> gradientColor = [
    const Color(0xff2979FF),
    const Color(0xff5C9CE6)
  ];

  Future getImageGallery() async {
    pickedImage =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    _selfieImage = pickedImage?.path ?? '';
    if (_selfieImage != '') {
      imageOrTheme(
          imageTap: false,
          selectImageTap: true,
          themeTap: false,
          colorPickerTap: false);
    }
    debugPrint("${_selfieImage} AAAAAAA");
    checkValid();
    update();
  }

  onChangedNumber(String text) {
    debugPrint("${text.length} AAAAAAA");
    if (text.length == 19) {
      errorText1 = false;
    } else {
      errorText1 = true;
    }
    checkValid();
    update();
  }

  onChangedName(String text) {
    if (text.length > 4) {
      errorText2 = false;
    } else {
      errorText2 = true;
    }
    checkValid();
    update();
  }

  onChangedExpire(String value) {
    if (value.length <= 4) {
      errorText3 = true;
      expireError = 'Invalid card expiration date';
      update();
      checkValid();

      return;
    }
    if (value.length >= 2) {
      final month = int.parse(value.substring(0, 2));
      if (month == 0 || month > 12) {
        errorText3 = true;
        expireError = 'Invalid card expiration date';
        update();
        checkValid();

        return;
      }
    }

    if (value.length == 5) {
      final year = int.parse(value.substring(3, value.length));
      final currentYear = (DateTime.now().year - 2000);
      checkValid();

      if (year == currentYear) {
        final currentMonth = DateTime.now().month;
        final month = int.parse(value.substring(0, 2));

        if (currentMonth >= month) {
          errorText3 = true;
          expireError = "Invalid card expiration date";
          update();
          checkValid();

          return;
        }
      }

      if (year == 0 || currentYear > year || year > maxYear) {
        errorText3 = true;
        expireError = 'Invalid card expiration date';
        checkValid();

        update();

        return;
      }
    }
    errorText3 = false;
    checkValid();
    update();
  }

  imageOrTheme(
      {required bool imageTap,
      required bool themeTap,
      required bool selectImageTap,
      required bool colorPickerTap}) async {
    if (imageTap == true) {
      isImage = true;
      isTheme = false;
      selectImage = false;
      colorPicker = false;
    } else if (themeTap == true) {
      isImage = false;
      isTheme = true;
      selectImage = false;
      colorPicker = false;
    } else if (selectImageTap == true) {
      isImage = false;
      isTheme = false;
      selectImage = true;
      colorPicker = false;
    } else if (colorPickerTap == true) {
      isImage = false;
      isTheme = false;
      selectImage = false;
      colorPicker = true;
      debugPrint("${currentColor}dDDDDD");
    }
    checkValid();
    update();

    debugPrint(
        "${isImage} isImage   ${isTheme} isTheme ${selectImage} isSelect");
  }

  checkValid() {
    if (isImage) {
      finalImage = image;
    } else if (isTheme) {
      finalImage = AppConstants.backgroundList[chosenColor];
    } else if (selectImage) {
      finalImage = selfiePath;
    }
    debugPrint("${finalImage} IMAGEEEE");
    if ((isImage || isTheme || selectImage || colorPicker) &&
        (errorText1 != true && errorText2 != true && errorText3 != true)) {
      debugPrint("${finalImage} KIRDIII");

      isValidd = true;
      update();
    } else {
      isValidd = false;
      update();
    }
    debugPrint("${isValidd} isVAliddd");
    update();
  }

  addNewCard() async {
    // if (isValidd == true) {
    questionsModel.add(CardsModel(
      id: questionsModel.length.toString() == ''
          ? '0'
          : questionsModel.length.toString(),
      cardExpireNumber: cardExpireController.text,
      cardName: cardNameController.text,
      cardNumber: cardNumberController.text,
      image: finalImage,
      isImage: isImage,
      isTheme: isTheme,
      selectImage: selectImage,
      selectColor: colorPicker,
      color: currentColor,
      cardType: Get.arguments[0],
    ));
    // }
    //
    // await localSource.setCards(questionsModel);

    if (isValidd == true) {
      Box box = await hive.openBox();
      hive.addCards(
        box,
        CardsModel(
          id: questionsModel.length.toString() == ''
              ? '0'
              : questionsModel.length.toString(),
          cardExpireNumber: cardExpireController.text,
          cardName: cardNameController.text,
          cardNumber: cardNameController.text,
          image: finalImage,
          isImage: isImage,
          isTheme: isTheme,
          selectImage: selectImage,
          selectColor: colorPicker,
          color: currentColor,
          cardType: Get.arguments[0],
        ),
      );
    }
    debugPrint("${questionsModel.length} questionLenth");
  }

  List get currencyList => _currencies;

  String get currencyName => currencyList[chosenCurrency].name ?? 'empty';

  String get currencyIcon => currencyList[chosenCurrency].icon ?? '';

  String get selfiePath => _selfieImage;

  String get currency => _currency;
}
