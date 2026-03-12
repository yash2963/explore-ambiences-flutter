import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioTestScreen extends StatefulWidget {
  @override
  _AudioTestScreenState createState() => _AudioTestScreenState();
}

class _AudioTestScreenState extends State<AudioTestScreen> {
  late AudioPlayer _player;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    // Player state ko listen karne ke liye
    _player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  @override
  void dispose() {
    _player.dispose(); // Memory leak se bachne ke liye
    super.dispose();
  }

  // Internet se test karne ke liye
  Future<void> _playNetwork() async {
    await _player.play(
      UrlSource(
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      ),
    );
  }

  // Local asset se test karne ke liye
  Future<void> _playAsset() async {
    try {
      await _player.play(AssetSource('audio/test.mp3'));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: Asset file nahi mili! path check karo."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Audio Package Tester")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isPlaying ? Icons.music_note : Icons.music_off,
              size: 100,
              color: isPlaying ? Colors.green : Colors.grey,
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              icon: Icon(Icons.cloud_download),
              label: Text("Play Network Audio"),
              onPressed: _playNetwork,
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(Icons.library_music),
              label: Text("Play Asset Audio"),
              onPressed: _playAsset,
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(Icons.stop),
              label: Text("Stop Audio"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
              onPressed: () => _player.stop(),
            ),
          ],
        ),
      ),
    );
  }
}
