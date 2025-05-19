// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_resultado.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImcResultadoAdapter extends TypeAdapter<ImcResultado> {
  @override
  final int typeId = 0;

  @override
  ImcResultado read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImcResultado(
      nome: fields[0] as String,
      idade: fields[1] as int,
      peso: fields[2] as int,
      altura: fields[3] as int,
      valor: fields[4] as double,
      classificacao: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImcResultado obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.idade)
      ..writeByte(2)
      ..write(obj.peso)
      ..writeByte(3)
      ..write(obj.altura)
      ..writeByte(4)
      ..write(obj.valor)
      ..writeByte(5)
      ..write(obj.classificacao);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImcResultadoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
