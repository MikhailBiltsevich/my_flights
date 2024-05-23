import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_flights/models/destination_model.dart';
import 'package:my_flights/widgets/destination-button.dart';

class FlightForm extends StatelessWidget {
  const FlightForm({super.key});

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        showDragHandle: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return FractionallySizedBox(
              heightFactor: 0.9,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 96,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(16)),
                              color: Theme.of(context).colorScheme.secondary),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            TextField(
                              decoration: InputDecoration(
                                  icon: SvgPicture.asset('assets/icons/departure.svg',
                                      colorFilter: const ColorFilter.mode(
                                          Color(0xff9F9F9F), BlendMode.srcIn)),
                                  isCollapsed: true,
                                  hintText: 'Откуда - Москва',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Color(0xff9F9F9F),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                            ),
                            Divider(
                              color: Color(0xff5E5F61),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                icon: SvgPicture.asset(
                                  'assets/icons/search.svg',
                                  colorFilter:
                                      const ColorFilter.mode(Color(0xff9F9F9F), BlendMode.srcIn),
                                ),
                                isCollapsed: true,
                                hintText: 'Куда - Турция',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Color(0xff9F9F9F),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            )
                          ]),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 24, 0, 30),
                          child: Center(
                              child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DestinationButton('Сложный\nмаршрут',
                                    'assets/icons/difficult-route.svg', Color(0xff3A633B)),
                                DestinationButton(
                                    'Куда угодно', 'assets/icons/planet.svg', Color(0xff2261BC)),
                                DestinationButton(
                                    'Выходные', 'assets/icons/calendar.svg', Color(0xff00427D)),
                                DestinationButton(
                                    'Горячие\nбилеты', 'assets/icons/hot.svg', Color(0xffFF5E5E)),
                              ],
                            )
                          ]))),
                      const DestinationList()
                    ],
                  ))));
        });
  }

  @override
  Widget build(BuildContext context) {
    const hintStyle =
        TextStyle(color: Color(0xff9F9F9F), fontWeight: FontWeight.w600, fontSize: 16);

    return SizedBox(
      height: 122,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xff2F3035),
        ),
        child: Container(
            padding: const EdgeInsets.only(left: 8, right: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Color(0xff3E3F43),
              boxShadow: [
                BoxShadow(blurRadius: 4, offset: Offset(0, 4), color: Color.fromRGBO(0, 0, 0, 0.25))
              ],
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/search.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                          isCollapsed: true,
                          hintText: 'Откуда - Москва',
                          border: InputBorder.none,
                          hintStyle: hintStyle),
                    ),
                    const Divider(
                      color: Color(0xff5E5F61),
                    ),
                    TextField(
                      keyboardType: TextInputType.none,
                      onTap: () => openBottomSheet(context),
                      decoration: const InputDecoration(
                        isCollapsed: true,
                        hintText: 'Куда - Турция',
                        border: InputBorder.none,
                        hintStyle: hintStyle,
                      ),
                    )
                  ],
                ))
              ],
            )),
      ),
    );
  }
}

class DestinationList extends StatelessWidget {
  const DestinationList({super.key});

  final destinations = const [
    DestinationModel(
        town: 'Стамбул',
        description: 'Популярное направление',
        imagePath: 'assets/images/istanbul.png'),
    DestinationModel(
        town: 'Сочи', description: 'Популярное направление', imagePath: 'assets/images/sochi.png'),
    DestinationModel(
        town: 'Пхукет',
        description: 'Популярное направление',
        imagePath: 'assets/images/phuket.png')
  ];

  @override
  Widget build(BuildContext context) {
    return
        // Expanded(child:
        Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final destination = destinations[index];
            return Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xff3E3F43)))),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  subtitleTextStyle: const TextStyle(color: Color(0xff5E5F61)),
                  onTap: () {},
                  leading: Container(
                    decoration:
                        const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      destination.imagePath,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(destination.town),
                  subtitle: Text(destination.description),
                ));
          },
          itemCount: destinations.length),
    );
    // );
  }
}
