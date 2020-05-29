// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) {
  return Food(
    id: json['id'] as int,
    name: json['name'] as String,
    minYear: json['minYear'] as int,
    type: json['type'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'minYear': instance.minYear,
      'type': instance.type,
      'image': instance.image,
    };
