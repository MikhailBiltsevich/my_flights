import 'package:json_annotation/json_annotation.dart';
import 'package:my_flights/models/offer_model.dart';

part 'offers_model.g.dart';

@JsonSerializable()
class OffersModel {
  List<OfferModel> offers;

  OffersModel(this.offers);

    factory OffersModel.fromJson(Map<String, dynamic> json) => _$OffersModelFromJson(json);

  Map<String, dynamic> toJson() => _$OffersModelToJson(this);
}