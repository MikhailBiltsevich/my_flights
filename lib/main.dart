import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flights/bloc/offers_bloc.dart';
import 'package:my_flights/pages/flights_page.dart';
import 'package:my_flights/pages/hotels_page.dart';
import 'package:my_flights/pages/profile_page.dart';
import 'package:my_flights/pages/shortly_page.dart';
import 'package:my_flights/pages/subscriptions_page.dart';
import 'package:my_flights/bloc/page_bloc.dart';
import 'package:my_flights/theme/theme.dart';
import 'package:my_flights/widgets/flights_bottom_navigation_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PageBloc>(
            create: (context) => PageBloc(),
          ),
          BlocProvider<OffersBloc>(
            create: (context) => OffersBloc(),
          )
        ],
        child: MaterialApp(
          theme: theme,
          home: const HomeScreen(),
        ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final pages = const [
    FlightsPage(),
    HotelsPage(),
    ShortlyPage(),
    SubscriptionsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<PageBloc, int>(builder: (context, state) {
          return pages[state];
        }),
        bottomNavigationBar: const FlightsBottomNavigationBar());
  }
}
