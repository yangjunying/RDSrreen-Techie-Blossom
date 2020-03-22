import 'package:flutter/material.dart';
import '../config_index.dart';

class PopularWithFriendsGameWidget extends StatelessWidget {
  final String imagePath;

  PopularWithFriendsGameWidget({Key key, @required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(imagePath)),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: InkWell(
              onTap: () {},
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    "Play",
                    textAlign: TextAlign.center,
                    style: playWhiteTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
