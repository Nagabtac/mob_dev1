import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouTube Player',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: YouTubeScreen(),
    );
  }
}

class YouTubeScreen extends StatefulWidget {
  @override
  _YouTubeScreenState createState() => _YouTubeScreenState();
}

class _YouTubeScreenState extends State<YouTubeScreen> {
  YoutubePlayerController? _controller;
  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializePlayer("https://youtu.be/Rxu7dKT2TRM");
  }

  void _initializePlayer(String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    if (videoId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid YouTube URL")),
      );
      return;
    }

    _controller?.dispose(); // Dispose of previous controller
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("YouTube Player")),
      body: SingleChildScrollView( // <--- This widget fixes the overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_controller != null)
                YoutubePlayer(
                  controller: _controller!,
                  showVideoProgressIndicator: true,
                ),
              SizedBox(height: 20),
              TextField(
                controller: _urlController,
                decoration: InputDecoration(
                  labelText: "Enter YouTube URL",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _initializePlayer(_urlController.text);
                },
                child: Text("Load Video"),
              ),
              SizedBox(height: 10),
              if (_controller != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _controller!.play(),
                      child: Text("Play"),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => _controller!.pause(),
                      child: Text("Pause"),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => _controller!.seekTo(Duration(seconds: 0)),
                      child: Text("Restart"),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
