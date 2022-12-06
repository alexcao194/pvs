import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/video_page/video_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../service/shared_preferences.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: WebView(
            initialUrl: 'http://${Prefs.get('ip4')}/video',
          ),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const VideoScreen()));
          },
          child: const Text('tap to full screen mode'),
        )
      ] ,
    );
  }
}


