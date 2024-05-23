import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flights/models/offer_model.dart';
import 'package:my_flights/services/api_service.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  OffersBloc() : super(OffersState()) {
    on<LoadOffers>((event, emit) async {
      final api = ApiService(Dio());
      final response = await api.getOffers();
      emit(OffersLoaded(response.offers));
    });
  }
}

class OffersEvent {}
class OffersState {}

class LoadOffers extends OffersEvent {}

class OffersLoaded extends OffersState {
  OffersLoaded(this.offers);

  List<OfferModel> offers;
}