import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/data/models/cards/cards_model.dart';

abstract class BaseLocalStorageRepository{
  Future<Box> openBox();
  List<CardsModel> getCards(Box box);
  Future<void> addCards(Box box,CardsModel cardsModel);
}