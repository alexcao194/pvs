import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../service/shared_preferences.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: WebView(
              initialUrl: 'http://${Prefs.get('ip4')}/video',
            ),
          ),
        ),
      ),
    );
  }
}
