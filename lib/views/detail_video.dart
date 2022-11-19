import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class DetailVideo extends StatefulWidget {
  final String videoUrl;

  DetailVideo({this.videoUrl});

  @override
  State<DetailVideo> createState() => _DetailVideoState(videoUrl);
}

class _DetailVideoState extends State<DetailVideo> {
  final String videoUrl;
  _DetailVideoState(this.videoUrl);

  VideoPlayerController playerController;

  @override
  Void initState() {
    super.initState();
    playerController = VideoPlayerController.network(videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => playerController.play());
  }

  @override
  Void dispose() {
    super.dispose();
    playerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_arrow, color: Colors.white),
            SizedBox(width: 10),
            Text('Video', style: TextStyle(color: Colors.white))
          ],
        ),
      ),
      body: Center(
          child: Center(
        child: playerController.value.isInitialized
            ? Container(
                alignment: Alignment.topCenter,
                child: buildVideo(),
              )
            : Container(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      )),
    );
  }

  Widget buildVideo() => Stack(
        children: <Widget>[
          buildVideoPlayer(),
          Positioned.fill(child: buildBasicOverlay())
        ],
      );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: playerController.value.aspectRatio,
        child: VideoPlayer(playerController),
      );

  Widget buildBasicOverlay() => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => playerController.value.isPlaying
            ? playerController.pause()
            : playerController.play(),
        child: Stack(
          children: <Widget>[
            buildPlay(),
            Positioned(bottom: 0, left: 0, right: 0, child: buildIndicator())
          ],
        ),
      );

  Widget buildIndicator() =>
      VideoProgressIndicator(playerController, allowScrubbing: true);

  Widget buildPlay() => playerController.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 80,
          ),
        );
}
