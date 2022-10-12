import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'cards_model.g.dart';

@HiveType(typeId: 0)
class CardsModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String cardName;
  @HiveField(2)
  final String cardType;
  @HiveField(3)
  final String cardNumber;
  @HiveField(4)
  final String cardExpireNumber;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final bool isImage;
  @HiveField(7)
  final bool isTheme;
  @HiveField(8)
  final bool selectImage;
  @HiveField(9)
  final bool selectColor;
  @HiveField(10)
  final Color color;

  const CardsModel({
    required this.id,
    required this.cardNumber,
    required this.cardType,
    required this.cardExpireNumber,
    required this.cardName,
    required this.image,
    required this.isImage,
    required this.isTheme,
    required this.selectImage,
    required this.selectColor,
    required this.color,
  });

  static CardsModel fromSnapshot(DocumentSnapshot snap) {
    CardsModel cardsModel = CardsModel(
      id: snap.id,
      cardNumber: snap['cardNumber'],
      cardType: snap['cardType'],
      cardExpireNumber: snap['cardExpireNumber'],
      cardName: snap['cardName'],
      image: snap['image'],
      isImage: snap['isImage'],
      isTheme: snap['isTheme'],
      selectImage: snap['selectImage'],
      selectColor: snap['selectColor'],
      color: snap['color'],
    );
    return cardsModel;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        cardNumber,
        cardType,
        cardExpireNumber,
        cardName,
        image,
        isImage,
        isTheme,
        selectImage,
        selectColor,
        color
      ];
}
