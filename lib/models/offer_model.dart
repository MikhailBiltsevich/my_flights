import 'package:json_annotation/json_annotation.dart';
import 'package:my_flights/models/price_model.dart';

part 'offer_model.g.dart';

@JsonSerializable()
class OfferModel {
  final int id;
  final String title;
  final String town;
  final PriceModel price;

  const OfferModel(this.id, this.title, this.town, this.price);

  factory OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfferModelToJson(this);
}