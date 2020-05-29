import 'package:diversification/model/utils.dart';
import 'package:json_annotation/json_annotation.dart';
part 'food.g.dart';

@JsonSerializable()
class Food {
  final int id;
  final String name;
  final int minYear;
  final String type;
  final String image;

  Food({this.id, this.name, this.minYear, this.type, this.image});

  factory Food.fromJson(Map<String, dynamic> json) {
    final result = _$FoodFromJson(json);
    return (result == null) ? null : result;
  }

  Map<String, dynamic> toJson() => _$FoodToJson(this);

  @override
  String toString(){
    return "${this.id} - ${this.name} - ${this.minYear} - ${this.type} - ${this.image}";
  }
}

class FoodWithFeedbackCriteria extends Food {
  FeedbackForFood feedback;
  FoodWithFeedbackCriteria({id, name, minYear, type, image, this.feedback}) : super(id: id, name: name, minYear: minYear, type: type, image: image);

  @override
  String toString(){
    return "${this.id} - ${this.name} - ${this.minYear} - ${this.type} - ${this.image} - ${this.feedback}";
  }
}

class FoodsList{
  List<Food> foods;
  FoodsList({this.foods});
  
  factory FoodsList.fromJson(List<dynamic> json){
    return FoodsList(
      foods: json
      .map((e) => Food.fromJson(e as Map<String, dynamic>))
      .toList()
    );
  }
}