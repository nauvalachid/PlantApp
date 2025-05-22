import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturePlantCard(
            image: "assets/images/bottom_img_1.png",
            press: _onCardPressed,
          ),
          FeaturePlantCard(
            image: "assets/images/bottom_img_2.png",
            press: _onCardPressed,
          ),
        ],
      ),
    );
  }
  static void _onCardPressed() {
    // TODO: Ganti dengan navigasi atau aksi sesuai kebutuhan
    debugPrint("Feature plant card tapped");
  }
}
