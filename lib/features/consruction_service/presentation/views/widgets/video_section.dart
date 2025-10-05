import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:video_player/video_player.dart';

class VideoSection extends StatefulWidget {
  final String videoUrl;

  const VideoSection({
    super.key,
    required this.videoUrl,
  });

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
_controller.addListener(() {
  // حدث حالة التشغيل الداخلية
  if (_controller.value.isPlaying != _isPlaying) {
    setState(() {
      _isPlaying = _controller.value.isPlaying;
    });
  }

  // لو الفيديو خلص
  if (_controller.value.position >= _controller.value.duration &&
      !_controller.value.isPlaying) {
    // خلي الفيديو في البداية بس بدون play
    _controller.seekTo(Duration.zero); 
    setState(() {
      _isPlaying = false;
    });
  }
});

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      if (_controller.value.position >= _controller.value.duration) {
        _controller.seekTo(Duration.zero);
      }
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlay,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: SizeConfig.h(191),
              child: _controller.value.isInitialized
                  ? FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          ),

          // زرار Play يظهر فقط لما الفيديو مش شغال
          if (!_isPlaying)
            CircleAvatar(
              radius: 23,
              backgroundColor: const Color(0xff00B4D8),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
        ],
      ),
    );
  }
}
