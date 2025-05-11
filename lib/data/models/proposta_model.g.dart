// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposta_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PropostaModelAdapter extends TypeAdapter<PropostaModel> {
  @override
  final int typeId = 2;

  @override
  PropostaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PropostaModel(
      valorPsicologo: fields[0] as int,
      porcentagem1: fields[1] as int,
      porcentagem2: fields[2] as int,
      porcentagem3: fields[3] as int,
      porcentagemContratacao: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PropostaModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.valorPsicologo)
      ..writeByte(1)
      ..write(obj.porcentagem1)
      ..writeByte(2)
      ..write(obj.porcentagem2)
      ..writeByte(3)
      ..write(obj.porcentagem3)
      ..writeByte(4)
      ..write(obj.porcentagemContratacao);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PropostaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
