import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/screens/details/components/image_and_icons.dart';
import 'package:plantapp/screens/details/components/title_and_price.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(size: size),
          const SizedBox(height: kDefaultPadding),
          const TitleAndPrice(title: "Angelica", country: "Russia", price: 440),
          const SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              SizedBox(
                width: (size.width - 8) / 2,
                height: 84,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                    ),
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
               const SizedBox(width: 8),
               SizedBox(
                width: (size.width - 8) / 2,
                height: 84,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}