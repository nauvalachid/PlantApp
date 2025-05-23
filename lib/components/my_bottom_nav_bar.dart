import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plantapp/camera/home_page.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/profile.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/flower.svg"),
            onPressed: () {
              // TODO: Add flower icon action
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/camera.svg"),
            onPressed: () {
               Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullPage()
                                ),
                              );
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/user-icon.svg"),
            onPressed: () {
               Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage()
                                ),
                              );
            },
          ),
        ],
      ),
    );
  }
}