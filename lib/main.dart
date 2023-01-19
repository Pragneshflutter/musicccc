import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MaterialApp(
    home: MyMusic(),
  ));
}

class MyMusic extends StatefulWidget {
  const MyMusic({Key? key}) : super(key: key);

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> with WidgetsBindingObserver {
  AudioPlayer player = AudioPlayer();

  // Create a player

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    IntiPlayer();

    Initplay();
  }

  IntiPlayer() {
    player.setAsset("Auddio/jhoom.mp3");
    player.setLoopMode(LoopMode.one);
  }

  Initplay() async {
    await player.play();
  }

  IntiPause() async {
    await player.pause();
  }

  InitStop() async {
    await player.stop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      Initplay();

      print("===$state");
    } else if (state == AppLifecycleState.paused) {

      IntiPause();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
