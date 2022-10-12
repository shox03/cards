import 'package:hive/hive.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/data/hive/base_local_storage.dart';
import 'package:sample_app_getx/data/models/cards/cards_model.dart';

class LocalStorageRepository extends BaseLocalStorageRepository {
  String boxName = 'cards';

  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<CardsModel>(boxName);
    return box;
  }

  @override
  List<CardsModel> getCards(Box box) {
    return box.values.toList() as List<CardsModel>;
  }

  @override
  Future<void> addCards(Box box, CardsModel cardsModel) async {
    await box.put(cardsModel.id, cardsModel);
  }
}
