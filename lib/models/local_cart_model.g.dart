// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalCartModelAdapter extends TypeAdapter<LocalCartModel> {
  @override
  final int typeId = 0;

  @override
  LocalCartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalCartModel(
      productId: fields[0] as int?,
      cartId: fields[1] as int?,
      quantity: fields[2] as int?,
      name: fields[3] as String?,
      price: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalCartModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.cartId)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalCartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
