import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_flights/bloc/offers_bloc.dart';
import 'package:my_flights/widgets/flight_form.dart';

class FlightsPage extends StatelessWidget {
  const FlightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    BlocProvider.of<OffersBloc>(context).add(LoadOffers());

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 36),
              child: Center(
                  child: Text(
                'Поиск дешевых\nавиабилетов',
                textAlign: TextAlign.center,
                style: theme.textTheme.displayLarge,
              ))),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
            child: Center(child: FlightForm()),
          ),
          Text(
            'Музыкально отлететь',
            style: theme.textTheme.displayLarge,
          ),
          BlocBuilder<OffersBloc, OffersState>(builder: (context, state) {
            if (state is OffersLoaded) {
              return SizedBox(
                height: 250,
                child: ListView.separated(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 25),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.offers.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 67,
                  ),
                  itemBuilder: (context, index) {
                    final offer = state.offers[index];
                    return Offer(offer.id, offer.title, offer.town, offer.price.value);
                  },
                ),
              );
            } else {
              return const Padding(
                  padding: EdgeInsets.all(10), child: Center(child: CircularProgressIndicator()));
            }
          })
        ],
      ),
    );
  }
}

class Offer extends StatelessWidget {
  const Offer(this.id, this.title, this.town, this.price, {super.key});

  final int id;
  final String title;
  final String town;
  final int price;

  @override
  Widget build(BuildContext context) {
    final images = {
      1: 'assets/images/die-antwoord.png',
      2: 'assets/images/socrat-and-lera.png',
      3: 'assets/images/lambapikt.png'
    };

    return SizedBox(
        width: 132,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16))),
              width: 132,
              height: 132,
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                images[id] ?? '',
                width: 132,
                height: 132,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
            ),
            Text(
              town,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/plane.svg',
                  colorFilter: const ColorFilter.mode(Color(0xff9F9F9F), BlendMode.srcIn),
                ),
                Text(
                  "от $price \u20BD",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                )
              ],
            )
          ],
        ));
  }
}
