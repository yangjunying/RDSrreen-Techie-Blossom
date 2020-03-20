import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/guest.dart';
import '../../styleguide.dart';
import '../../model/event.dart';

class EvnetDetailContent extends StatelessWidget {
  // final Event event;
  // EvnetDetailContent({Key key, this.event}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
            child: Text(
              event.title,
              style: eventWhiteTitleTextStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.24),
            child: FittedBox(
              child: Row(
                children: <Widget>[
                  Text(
                    '-',
                    style: eventLocationTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    event.location,
                    style: eventLocationTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
            ),
            child: Text(
              "GUESTS",
              style: guestTextStyle,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (final guest in guests)
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(4.0),
                        color: Color(0xFEFDFCFA),
                        child: Image.asset(
                          guest.imagePath,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: event.punchLine1,
                  style: punchLine1TextSyle,
                ),
                TextSpan(
                  text: event.punchLine2,
                  style: punchLine2TextSyle,
                )
              ]),
            ),
          ),
          if (event.description != null && event.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                event.description,
                style: eventLocationTextStyle,
              ),
            ),
          if (event.galleryImages != null && event.galleryImages.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 32,),
              child: Text(
                'GALLERY',
                style: guestTextStyle,
              ),
            ),
          if (event.galleryImages != null && event.galleryImages.isNotEmpty)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (final galleryPath in event.galleryImages)
                    Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0),),
                        child: Image.asset(
                          galleryPath,
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                ],
              ),
            )
        ],
      ),
    );
  }
}
