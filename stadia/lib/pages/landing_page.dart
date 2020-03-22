import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stadia/model/friends.dart';
import './secondary_home_page.dart';
import '../common/rounded_image_widget.dart';
import '../config_index.dart';
import '../common/content_heading_widget.dart';
import '../common/last_played_game_tile_widget.dart';
import '../model/last_played_game.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final logoHeight = screenHeight * 0.4;
    final logowidth = screenWidth;

    return Scaffold(
      appBar: null,
      body: Stack(
        // alignment: Alignment.bottomRigh,
        children: <Widget>[
          Transform.translate(
            offset: Offset(screenWidth * 0.4, 10),
            child: Transform.rotate(
              angle: -0.1,
              child: SvgPicture.asset(
                appLogo,
                height: logowidth,
                color: logoTintColor,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return SecondaryHomePage();
                          }),);
                        },
                        child: Icon(
                          Icons.menu,
                          color: primaryTextColor,
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: primaryTextColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: <Widget>[
                            RoundedImageWidget(
                              imagePath: player1,
                              ranking: 39,
                              showRanking: true,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Hello', style: userNameTextStyle),
                                  TextSpan(text: '\n'),
                                  TextSpan(
                                    text: 'Jon Snow',
                                    style: userNameTextStyle,
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          bottom: 16,
                          top: 16,
                        ),
                        child: Material(
                          elevation: 4,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 16, right: 16, bottom: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'HOURS PLAYED',
                                      style: hoursPlayedLabelTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "297 Hours",
                                  style: hoursPlayedTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ContentHeadingWidget(
                        heading: 'Last played games',
                      ),
                      for (var i = 0; i < lastPlayedGames.length; i++)
                        LastePalyedTileWidget(
                          lastPlayedGame: lastPlayedGames[i],
                          screenWidth: screenWidth,
                          gameProgress: lastPlayedGames[i].gameProgress,
                        ),
                      ContentHeadingWidget(
                        heading: 'Friends',
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            children: <Widget>[
                              for (var i = 0; i < friends.length; i++)
                                RoundedImageWidget(
                                  imagePath: friends[i].imagePath,
                                  isOnline: friends[i].isOnline,
                                  name: friends[i].name,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
