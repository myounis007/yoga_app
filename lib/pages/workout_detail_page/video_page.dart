import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  final List<Map<String, dynamic>>? videoList;

  const VideoPage({Key? key, this.videoList}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController ytController;
  late TextEditingController currentIndexController;
  bool isVideoPlaying = false;
  Duration totalDuration = const Duration();
  Duration currentPosition = const Duration();
  double cumulativeProgress = 0.0;

  @override
  void initState() {
    super.initState();
    currentIndexController = TextEditingController(text: "1");
    ytController = YoutubePlayerController(
      initialVideoId: widget.videoList![0]['videoID'],
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    ytController.addListener(() {
      if (ytController.value.isReady) {
        setState(() {
          totalDuration = ytController.metadata.duration ?? Duration();
        });
      }
      if (ytController.value.position != currentPosition) {
        setState(() {
          currentPosition = ytController.value.position;
          if (totalDuration.inSeconds > 0) {
            double currentVideoProgress =
                currentPosition.inSeconds / totalDuration.inSeconds;
            cumulativeProgress +=
                currentVideoProgress / widget.videoList!.length;
            // Save cumulative progress
            // saveProgress(cumulativeProgress);
          }
        });
      }
    });
    // Retrieve saved cumulative progress
    // retrieveProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Course Progress: ${(cumulativeProgress * 100).toStringAsFixed(2)}%'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  YoutubePlayer(
                    controller: ytController,
                  ),
                  LinearProgressIndicator(
                    value: cumulativeProgress,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListTile(
                title: Text(
                  widget.videoList![0]['videoTitle'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView.builder(
                itemCount: widget.videoList!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndexController.text = (index + 1).toString();
                        ytController.load(widget.videoList![index]['videoID']);
                      });
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pinkAccent.shade100,
                        child: ListTile(
                          leading: Icon(Icons.play_circle_outlined, size: 50),
                          title: Text(
                            "${index + 1} " +
                                widget.videoList![index]["videoTitle"]
                                    .toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
