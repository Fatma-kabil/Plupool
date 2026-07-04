import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:video_player/video_player.dart';

class VideoSection extends StatefulWidget {
  final String? videoUrl;

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
  bool _hasVideo = true;

  @override
  void initState() {
    super.initState();

    if (widget.videoUrl == null || widget.videoUrl!.isEmpty) {
      _hasVideo = false;
      return;
    }

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl!),
    )..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });

    _controller.addListener(() {
      if (_controller.value.isPlaying != _isPlaying) {
        setState(() {
          _isPlaying = _controller.value.isPlaying;
        });
      }

      if (_controller.value.position >= _controller.value.duration &&
          !_controller.value.isPlaying) {
        _controller.seekTo(Duration.zero);
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    if (_hasVideo) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _togglePlay() {
    if (!_hasVideo) return;

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
    if (!_hasVideo) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: SizeConfig.isWideScreen
              ? SizeConfig.w(191)
              : SizeConfig.h(191),
          color: Colors.grey.shade300,
          child: const Center(
            child: Icon(
              Icons.videocam_off,
              color: Colors.grey,
              size: 40,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: _togglePlay,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: SizeConfig.isWideScreen
                  ? SizeConfig.w(191)
                  : SizeConfig.h(191),
              child: _controller.value.isInitialized
                  ? FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),

          if (!_isPlaying)
            CircleAvatar(
              radius: SizeConfig.isWideScreen
                  ? SizeConfig.h(23)
                  : SizeConfig.w(23),
              backgroundColor: const Color(0xff00B4D8),
              child: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: SizeConfig.isWideScreen
                    ? SizeConfig.h(30)
                    : SizeConfig.w(30),
              ),
            ),
        ],
      ),
    );
  }
}