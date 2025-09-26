import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OnboardingMediaPlayer extends StatefulWidget {
  const OnboardingMediaPlayer({super.key, required this.videoPath});
  final String videoPath;

  @override
  State<OnboardingMediaPlayer> createState() => _OnboardingMediaPlayerState();
}

class _OnboardingMediaPlayerState extends State<OnboardingMediaPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {}); // Rebuild once initialized
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(1.0);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    )
        : const Center(child: CircularProgressIndicator());
  }
}
