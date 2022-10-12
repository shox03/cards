// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardsModelAdapter extends TypeAdapter<CardsModel> {
  @override
  final int typeId = 0;

  @override
  CardsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardsModel(
      id: fields[0] as String,
      cardNumber: fields[3] as String,
      cardType: fields[2] as String,
      cardExpireNumber: fields[4] as String,
      cardName: fields[1] as String,
      image: fields[5] as String,
      isImage: fields[6] as bool,
      isTheme: fields[7] as bool,
      selectImage: fields[8] as bool,
      selectColor: fields[9] as bool,
      color: fields[10] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, CardsModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.cardName)
      ..writeByte(2)
      ..write(obj.cardType)
      ..writeByte(3)
      ..write(obj.cardNumber)
      ..writeByte(4)
      ..write(obj.cardExpireNumber)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.isImage)
      ..writeByte(7)
      ..write(obj.isTheme)
      ..writeByte(8)
      ..write(obj.selectImage)
      ..writeByte(9)
      ..write(obj.selectColor)
      ..writeByte(10)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
