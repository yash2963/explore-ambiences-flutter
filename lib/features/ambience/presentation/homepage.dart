import 'package:arvyax/features/ambience/data/models/ambienceModel.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selectedCategory = "All";

  final ambientTags = ["All", "Focus", "Calm", "Sleep", "Reset"];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isplaying = false;
  int? playingIndex;

  String selectedTag = 'All';

  @override
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    _audioPlayer.dispose();
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final displayList = ambienceList.where((item) {
      final matchesTag = (selectedTag == 'All' || item.subTitle == selectedTag);
      final matchesSearch = item.title.toLowerCase().contains(
        controller.text.toLowerCase(),
      );
      return matchesTag && matchesSearch;
    }).toList();
    // final displayList = (selectedTag == 'All')
    //     ? ambienceList
    //     : ambienceList.where((i) => i.subTitle == selectedTag).toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 20),
              // Ali: TextAlign.start,
              child: Text('Explore Ambiences', style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Color(0xFF44474E),
                  ),
                  hintText: 'Search ambiences...',
                  hintStyle: GoogleFonts.plusJakartaSans(
                    color: Color(0xFF8E9199),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF1F3F9),
                  // hoverColor: Colors.grey,
                  // fillColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Color(0xFF6750A4),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: ambientTags.length,
                itemBuilder: (context, index) {
                  final tag = ambientTags[index];
                  final isSelectd = selectedTag == tag;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTag = tag;
                      });
                    },
                    // child: Container(),
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSelectd
                            ? Color(0xFF6C8283)
                            : Color(0xFFF1F3F9),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelectd
                              ? Color(0xFF6750A4)
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.plusJakartaSans(
                          color: isSelectd ? Colors.white : Color(0xFF44474E),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 11,
                  mainAxisSpacing: 11,
                  childAspectRatio: 0.65,
                ),
                itemCount: displayList.length,
                itemBuilder: (context, index) {
                  final item = displayList[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: playingIndex == index ? Colors.grey : Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          // child: Stack(
                          //   children: [
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(item.imageUrl),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),

                          // ],
                          // ),
                        ),
                        // Positioned(
                        //   bottom: 10,
                        //   right: 10,
                        //   child: Container(
                        //     padding: EdgeInsets.all(6),
                        //     decoration: const BoxDecoration(
                        //       color: Colors.white,
                        //       shape: BoxShape.circle,
                        //     ),
                        //     child: const Icon(
                        //       Icons.play_arrow,
                        //       size: 20,
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        item.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "${item.subTitle} . ${item.duration}",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    print("Button Pressed!");
                                    print("Audio URL: ${item.audio}");
                                    try {
                                      if (playingIndex == index) {
                                        print("Attempting to Pause...");
                                        await _audioPlayer.pause();
                                        setState(() {
                                          playingIndex = null;
                                        });
                                      } else {
                                        print("Attempting to Play");
                                        await _audioPlayer.play(
                                          UrlSource(item.audio),
                                        );
                                        setState(() {
                                          playingIndex = index;
                                        });
                                      }
                                    } catch (e) {
                                      print("Audio Error $e");
                                    }
                                  },
                                  icon: Icon(
                                    playingIndex == index
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                  ),
                                  style: IconButton.styleFrom(
                                    backgroundColor: playingIndex == index
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                ),
                                // CircleAvatar(
                                //   child: GestureDetector(
                                //     onTap: () {},
                                //     child: Icon(
                                //       Icons.play_arrow,
                                //       color: Colors.black,
                                //     ),
                                //   ),
                                //   backgroundColor: Colors.grey,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
