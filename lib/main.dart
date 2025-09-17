import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(MyInfoApp());
}

class MyInfoApp extends StatelessWidget {
  const MyInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Info App',
      home: MainMenuPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Main Menu Page
class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(title: Text('Main Menu')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(
              label: 'Personal Information',
              icon: Icons.menu_book,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PersonalInfoPage()),
              ),
            ),
            SizedBox(height: 20),
            MenuButton(
              label: 'Music',
              icon: Icons.music_note,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MusicPage()),
              ),
            ),
            SizedBox(height: 20),
            MenuButton(
              label: 'Images',
              icon: Icons.image,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ImagesPage()),
              ),
            ),
            SizedBox(height: 20),
            MenuButton(
              label: 'YouTube Videos',
              icon: Icons.music_video,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => YouTubeLinksPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const MenuButton(
      {super.key, required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 32),
      label: Text(label, style: TextStyle(fontSize: 24)),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.grey[700]!),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        minimumSize:
        WidgetStateProperty.all<Size>(const Size(double.infinity, 70)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      onPressed: onTap,
    );
  }
}

// Personal Info Page
class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(title: Text('Personal Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SectionHeader(title: 'Personal Information'),
            InfoRow(label: 'Name', value: 'DARWIN CATBAGAN'),
            InfoRow(label: 'Age', value: '19'),
            InfoRow(label: 'Location', value: 'SAN JUAN LA UNION'),
            InfoRow(label: 'Email', value: 'darwin.catbagan@lorma.edu'),
            InfoRow(label: 'Contact', value: '09467654213'),
            SizedBox(height: 24),
            SectionHeader(title: 'Education'),
            InfoRow(label: 'Course', value: 'Information Technology-II'),
            InfoRow(
                label: 'College',
                value:
                'Central for Learning and Innovation Lorma Colleges San Juan La Union'),
            InfoRow(label: 'Year', value: '2025-2026'),
            SizedBox(height: 24),
            SectionHeader(title: 'Skills'),
            InfoRow(label: 'Programming', value: 'Java'),
            InfoRow(label: 'Web Development', value: 'HTML, CSS'),
            InfoRow(label: 'Others', value: 'MySQL, Git'),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              '$label:',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// Music Page
class MusicPage extends StatelessWidget {
  final List<Map<String, String>> musicVideos = const [
    {
      'title': '「Love Me, Love Me, Love Me」 / Kikuo',
      'url': 'https://www.youtube.com/watch?v=1oNYFvvXQNw'
    },
    {
      'title': '可愛くてごめん ／ HoneyWorks',
      'url': 'https://www.youtube.com/watch?v=K4xLi8IF1FM'
    },
    {
      'title': 'CHAINSAW MAN Ending │ TOOBOE 「錠剤」',
      'url': 'https://www.youtube.com/watch?v=xIKW3NKYBWw'
    },
    {
      'title': 'JAWNY - Trigger of Love',
      'url': 'https://www.youtube.com/watch?v=n_83u9eEgHk'
    },
    {
      'title': 'Just disappear / Takayan',
      'url': 'https://www.youtube.com/watch?v=6tJ_vEqyXTQ'
    },
    {
      'title': 'JAWNY - Honeypie',
      'url': 'https://www.youtube.com/watch?v=n_83u9eEgHk'
    }
  ];

  const MusicPage({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(title: Text('Music')),
      body: ListView.builder(
        itemCount: musicVideos.length,
        itemBuilder: (context, index) {
          final video = musicVideos[index];
          return ListTile(
            title: Text(video['title']!,
                style: TextStyle(color: Colors.white, fontSize: 16)),
            trailing: Icon(Icons.open_in_new, color: Colors.white),
            onTap: () => _launchURL(video['url']!),
          );
        },
      ),
    );
  }
}

// Images Page
class ImagesPage extends StatelessWidget {
  final List<String> imageUrls = const [
    'https://i.imgur.com/ZEWX7qD.jpeg',
    'https://i.imgur.com/cyom2k9.jpeg',
    'https://i.imgur.com/egsg5ZF.jpeg',
    'https://i.imgur.com/RHQJ4rS.jpeg',
    'https://i.imgur.com/DYmsrk6.jpeg',
  ];

  const ImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(title: Text('Images')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Container(
            width: 1000,
            height: screenWidth,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
              image: DecorationImage(
                image: NetworkImage(imageUrls[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

// YouTube Links Page
class YouTubeLinksPage extends StatelessWidget {
  final List<Map<String, String>> youtubeLinks = const [
    {
      'title': 'Video 1',
      'url': 'https://www.youtube.com/watch?v=OqmvHWZ2dhc',
    },
    {
      'title': 'Video 2',
      'url': 'https://www.youtube.com/watch?v=4QXCPuwBz2E',
    },
    {
      'title': 'Video 3',
      'url': 'https://www.youtube.com/watch?v=TBoBfT-_sfM',
    },
    {
      'title': 'Video 4',
      'url': 'https://www.youtube.com/watch?v=mHnt8TVbC9M',
    },
    {
      'title': 'Video 5',
      'url': 'https://www.youtube.com/watch?v=5Duje_sZko8',
    },
  ];

  const YouTubeLinksPage({super.key});

  // Extracts videoId from YouTube URL
  String extractVideoId(String url) {
    final regExp = RegExp(r"v=([^&]+)");
    final match = regExp.firstMatch(url);
    return match != null ? match.group(1)! : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(title: const Text('YouTube Videos')),
      body: ListView.builder(
        itemCount: youtubeLinks.length,
        itemBuilder: (context, index) {
          final video = youtubeLinks[index];
          final videoId = extractVideoId(video['url']!);

          return ListTile(
            title: Text(video['title']!, style: const TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.play_arrow, color: Colors.white),
            onTap: () {
              if (videoId.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => YouTubeVideoPlayerPage(
                      videoId: videoId,
                      title: video['title']!,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invalid video URL')),
                );
              }
            },
          );
        },
      ),
    );
  }

}
class YouTubeVideoPlayerPage extends StatefulWidget {
  final String videoId;
  final String title;

  const YouTubeVideoPlayerPage({
    super.key,
    required this.videoId,
    required this.title,
  });

  @override
  State<YouTubeVideoPlayerPage> createState() => _YouTubeVideoPlayerPageState();
}

class _YouTubeVideoPlayerPageState extends State<YouTubeVideoPlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
        strictRelatedVideos: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}

