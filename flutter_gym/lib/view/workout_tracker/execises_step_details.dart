import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ExercisesStepDetails extends StatefulWidget {
  final Map eObj;

  const ExercisesStepDetails({super.key, required this.eObj});

  @override
  State<ExercisesStepDetails> createState() => _ExercisesStepDetailsState();
}

class _ExercisesStepDetailsState extends State<ExercisesStepDetails> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TColor.white, borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "lib/assets/img/donusikonu.png",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.primryG),
                        borderRadius: BorderRadius.circular(20)),
                    //fotoğraflar
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        widget.eObj["image"].toString(),
                        width: media.width,
                        height: media.width * 0.43,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        color: TColor.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerPage(
                            videoPath: widget.eObj["videyo"].toString(),
                          ),
                        ),
                      );
                    },
                    icon: Image.asset(
                      "lib/assets/img/Play-Icon.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.eObj["title"].toString(),
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.eObj["kalori"].toString(),
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Açıklama",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              ReadMoreText(
                //Açıklama burası
                widget.eObj["explanation"].toString(),
                trimLines: 12,
                colorClickableText: TColor.black,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Daha Fazla ...',
                trimExpandedText: ' Daha Az',
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 14,
                ),
                moreStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  final String videoPath;

  const VideoPlayerPage({super.key, required this.videoPath});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath);
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 9 / 16,

      autoInitialize: true,
      looping: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.grey,
        handleColor: Colors.red,
        backgroundColor: Colors.black,
        bufferedColor: Colors.white,
      ),
      placeholder: Container(
        color: Colors.black,
      ),
      autoPlay: false, // Videoyu otomatik oynatma
      allowPlaybackSpeedChanging: false,
      allowMuting: true,
      showControls: true,

      showControlsOnInitialize: true,
    );
    _controller.addListener(() {
      if (!_controller.value.isInitialized) {
        return;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('medya oynatıcı'),
          centerTitle: true,
          backgroundColor: TColor.lightgray),
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}
