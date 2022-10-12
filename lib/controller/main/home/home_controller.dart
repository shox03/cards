import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/data/hive/local_storage_repository.dart';
import 'package:sample_app_getx/data/models/cards/cards_model.dart';
import 'package:sample_app_getx/data/repository/home/home_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeController extends BaseController {
  final LocalSource _localSource = LocalSource.getInstance();
  final LocalStorageRepository hive = LocalStorageRepository();

  List<CardsModel> cards = [];

  int chosenColor = 0;

  int _index = 0;
  late TabController tabController;
  final scrollController = ScrollController();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    getLocal();
    super.onReady();
  }

  getLocal() async {
    Box box = await hive.openBox();
     cards = hive.getCards(box);
    // final result = await _localSource.getCards();
    // if (result is List<CardsModel>) {
    //   cards = result;
    // }
    // // cards = await _localSource.getCards();
    debugPrint("${cards} llennthh");
    update();
  }

  void setIndex(int i) {
    _index = i;
    update();
  }

  List<String> cardTypeList = [
    'assets/png/ic_uzcard.png',
      'assets/png/humocard1.png',
    'assets/png/system-visa_c.png',
  ];

  checkCardType(int index) {
    if (cards[index].cardType == 'uzcard') {
      return cardTypeList[0];
    } else if (cards[index].cardType == 'humo') {
      return cardTypeList[1];
    } else if (cards[index].cardType == 'visa') {
      return cardTypeList[2];
    } else {
      return cardTypeList[0];
    }
  }

  int get index => _index;
}
