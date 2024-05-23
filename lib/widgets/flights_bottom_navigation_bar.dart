import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_flights/bloc/page_bloc.dart';

class FlightsBottomNavigationBar extends StatelessWidget {
  const FlightsBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: (value) => context.read<PageBloc>().add(PageChanged(value)),
          items: [
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/icons/plane.svg',
                  colorFilter: const ColorFilter.mode(Color(0xff2261BC), BlendMode.srcIn),
                ),
                icon: SvgPicture.asset('assets/icons/plane.svg'),
                label: 'Авиабилеты'),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                  'assets/icons/bed.svg',
                  colorFilter: const ColorFilter.mode(Color(0xff2261BC), BlendMode.srcIn),
                ),
              icon: SvgPicture.asset('assets/icons/bed.svg'), label: 'Отели'),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                  'assets/icons/location.svg',
                  colorFilter: const ColorFilter.mode(Color(0xff2261BC), BlendMode.srcIn),
                ),
                icon: SvgPicture.asset('assets/icons/location.svg'), label: 'Короче'),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                  'assets/icons/ring.svg',
                  colorFilter: const ColorFilter.mode(Color(0xff2261BC), BlendMode.srcIn),
                ),
                icon: SvgPicture.asset('assets/icons/ring.svg'), label: 'Подписки'),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  colorFilter: const ColorFilter.mode(Color(0xff2261BC), BlendMode.srcIn),
                ),
                icon: SvgPicture.asset('assets/icons/profile.svg'), label: 'Профиль')
          ],
        );
      },
    );
  }
}
