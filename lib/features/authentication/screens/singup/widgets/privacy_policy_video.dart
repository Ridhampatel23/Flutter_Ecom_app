import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PrivacyPolicyVideoScreen extends StatefulWidget {
  @override
  _PrivacyPolicyVideoScreenState createState() =>
      _PrivacyPolicyVideoScreenState();
}

class _PrivacyPolicyVideoScreenState extends State<PrivacyPolicyVideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/videos/privacy_policy_videos/Privacy_Policy.mp4')
      ..initialize().then((_) {
        setState(
            () {}); // Refresh to show the first frame once the video is initialized
        _controller.play(); // Auto-play the video
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const ecomAppBar(title: Text('Privacy Policy'), showBackArrow: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _controller.value.isInitialized
              ? SizedBox(
              width: ecomHelperFunctions.screenWidth() ,
              height: ecomHelperFunctions.screenWidth(),
              child: VideoPlayer(_controller))
              : const CircularProgressIndicator(),
          // Show a loader while the video initializes

          const SizedBox(height: ecomSizes.spaceBtwnSections),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              backgroundColor: ecomColors.primaryColor,
            ),
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ],
      ),
    );
  }
}
