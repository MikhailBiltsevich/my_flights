import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DestinationButton extends StatelessWidget {
  DestinationButton(this.label, this.iconPath, this.color, {super.key});

  String iconPath;
  String label;
  Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(12),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: color),
              child: SvgPicture.asset(
                iconPath,
                height: 24,
                width: 24,
              )),
          Text(
            label,
            textAlign: TextAlign.center,
          )
        ]));
  }
}
