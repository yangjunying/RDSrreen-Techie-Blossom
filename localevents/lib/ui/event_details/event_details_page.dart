import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/event.dart';

import './event_detail_background.dart';
import './event_detail_content.dart';

class EeventDetailPage extends StatelessWidget {
  final Event event;

  EeventDetailPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: null,
      body: Provider<Event>.value(
        value: event,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            EventDetailBackground(),
            SafeArea(child: EvnetDetailContent(),),
          ],
        ),
      ),
    );
  }
}
