import 'package:get_storage/get_storage.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/data/floor/app_database.dart';
import 'package:sample_app_getx/data/floor/dao/product_dao.dart';
import 'package:sample_app_getx/data/floor/entity/products.dart';
import 'package:sample_app_getx/data/keys/app_keys.dart';
import 'package:sample_app_getx/data/models/cards/cards_model.dart';
import 'package:sample_app_getx/data/models/customer/customer.dart';

class LocalSource {
  final _localStorage = GetStorage();
  final ProductDao _productDao = AppDatabase.instance.productDao;

  LocalSource._();

  static LocalSource? _instance;

  static LocalSource getInstance() {
    if (_instance != null) {
      return _instance!;
    } else {
      return LocalSource._();
    }
  }

  Stream<List<Products>> getAllBasketProducts() {
    return _productDao.getBasketProducts();
  }

  Future<void> updateQuantity(
      {bool isMinus = false,
      bool isDelete = false,
      required Products product}) async {
    if (isMinus) {
      if (product.quantity > 1) {
        product.quantity = product.quantity - 1;
        await updateProduct(product);
      } else if (isDelete) {
        removeProduct(product);
      }
    } else {
      product.quantity = product.quantity + 1;
      await updateProduct(product);
    }
  }

  Future<List<Products>> getAllBasketProductsAsync() {
    return _productDao.getBasketProductsAsync();
  }

  Future<void> removeProfile() async {
    await _localStorage.remove(AppKeys.hasProfile);
    await _localStorage.remove(AppKeys.customerId);
    await _localStorage.remove(AppKeys.name);
    await _localStorage.remove(AppKeys.locale);
    await _localStorage.remove(AppKeys.phone);
    await _localStorage.remove(AppKeys.accessToken);
    await _localStorage.remove(AppKeys.refreshToken);
  }

  Future<void> insertProduct(Products product) async {
    await _productDao.insertProduct(product);
  }

  Future<void> removeProduct(Products product) async {
    await _productDao.removeProduct(product);
  }

  Future<void> updateProduct(Products product) async {
    await _productDao.updateProduct(product);
  }

  Future<void> removeAll(List<Products> products) async {
    await _productDao.removeAll(products);
  }

  bool hasProfile() {
    return _localStorage.read<bool>(AppKeys.hasProfile) ?? false;
  }

  Future<void> setCustomer(Customer customer) async {
    await _localStorage.write(AppKeys.hasProfile, true);
    await _localStorage.write(AppKeys.customerId, customer.id);
    await _localStorage.write(AppKeys.name, customer.name);
    await _localStorage.write(AppKeys.phone, customer.phone);
    await _localStorage.write(AppKeys.dateOfBirth, customer.dateOfBirth);
    await _localStorage.write(AppKeys.accessToken, customer.accessToken);
    await _localStorage.write(AppKeys.refreshToken, customer.refreshToken);
  }

  String getAccessToken() {
    return _localStorage.read<String>(AppKeys.accessToken) ?? '';
  }

  String getLocale() {
    return _localStorage.read<String>(AppKeys.locale) ?? 'ru';
  }

  String getRefreshToken() {
    return _localStorage.read<String>(AppKeys.refreshToken) ?? '';
  }

  String getFcmToken() {
    return _localStorage.read<String>(AppKeys.fcmToken) ?? '';
  }

  Future<void> setCards(List<CardsModel> value) async {
    await _localStorage.write(AppKeys.cards, value);
  }

  Future<List<CardsModel>> getCards() async {
    return _localStorage.read<List<CardsModel>>(AppKeys.cards) ?? [];
  }

  Customer getCustomer() => Customer(
        id: _localStorage.read<String>(AppKeys.customerId) ?? '',
        name: _localStorage.read<String>(AppKeys.name) ?? '',
        phone: _localStorage.read<String>(AppKeys.phone) ?? '',
        dateOfBirth: _localStorage.read<String>(AppKeys.dateOfBirth) ?? '',
        accessToken: _localStorage.read<String>(AppKeys.accessToken) ?? '',
        refreshToken: _localStorage.read<String>(AppKeys.refreshToken) ?? '',
      );

  Future<void> setRefreshedTokens({
    required String? refreshToken,
    required String? accessToken,
  }) async {
    await _localStorage.write(AppKeys.refreshToken, refreshToken ?? '');
    await _localStorage.write(AppKeys.accessToken, accessToken ?? '');
  }
}
