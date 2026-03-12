class AmbienceModel {
  final String title;
  final String subTitle;
  final String imageUrl;
  final String duration;
  final String audio;

  AmbienceModel({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.duration,
    required this.audio,
  });
}

final List<AmbienceModel> ambienceList = [
  // --- FOCUS CATEGORY ---
  AmbienceModel(
    title: "Forest Focus",
    subTitle: "Focus",
    duration: "5:00",
    imageUrl:
        "https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297_1280.jpg",
    audio: "https://cdn.pixabay.com/audio/2022/05/05/audio_1395e7800f.mp3",
  ),
  AmbienceModel(
    title: "Garden",
    subTitle: "Focus",
    duration: "8:00",
    imageUrl:
        "https://images.pexels.com/photos/4060144/pexels-photo-4060144.jpeg?auto=compress&cs=tinysrgb&w=400",
    audio: "https://cdn.pixabay.com/audio/2023/08/31/audio_a4b3a2b997.mp3",
  ),

  // --- CALM CATEGORY ---
  AmbienceModel(
    title: "Ocean Waves",
    subTitle: "Calm",
    duration: "10:00",
    imageUrl:
        "https://images.pexels.com/photos/1001682/pexels-photo-1001682.jpeg?auto=compress&cs=tinysrgb&w=400",
    audio: "https://cdn.pixabay.com/audio/2024/11/02/audio_639b450ab4.mp3",
  ),
  AmbienceModel(
    title: "Soft Sunset",
    subTitle: "Calm",
    duration: "12:00",
    imageUrl:
        "https://images.pexels.com/photos/189349/pexels-photo-189349.jpeg?auto=compress&cs=tinysrgb&w=400",
    audio: "https://cdn.pixabay.com/audio/2024/04/04/audio_ffb1a0fa54.mp3",
  ),

  // --- SLEEP CATEGORY ---
  AmbienceModel(
    title: "Rainy Window",
    subTitle: "Sleep",
    duration: "15:00",
    imageUrl:
        "https://images.pexels.com/photos/125510/pexels-photo-125510.jpeg?auto=compress&cs=tinysrgb&w=400",
    audio: "https://cdn.pixabay.com/audio/2026/02/19/audio_7217522a59.mp3",
  ),
  AmbienceModel(
    title: "Starry Night",
    subTitle: "Sleep",
    duration: "20:00",
    imageUrl:
        "https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg?auto=compress&cs=tinysrgb&w=400",
    audio: "https://cdn.pixabay.com/audio/2025/08/26/audio_4265382fe9.mp3",
  ),

  // --- RESET CATEGORY ---
  AmbienceModel(
    title: "Mountain Mist",
    subTitle: "Reset",
    duration: "06:00",
    imageUrl:
        "https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&w=400",
    audio: "https://cdn.pixabay.com/audio/2022/06/09/audio_847762f345.mp3",
  ),
  AmbienceModel(
    title: "Desert Wind",
    subTitle: "Reset",
    duration: "04:30",
    imageUrl:
        "https://cdn.pixabay.com/photo/2021/09/01/15/10/sand-6591629_1280.jpg",
    audio: "https://cdn.pixabay.com/audio/2026/01/27/audio_d195aef72e.mp3",
  ),

  // --- ADDITIONAL ---
  AmbienceModel(
    title: "River Flow",
    subTitle: "Focus",
    duration: "07:15",
    imageUrl:
        "https://cdn.pixabay.com/photo/2021/05/08/03/30/waterfall-6237479_1280.jpg",
    audio: "https://cdn.pixabay.com/audio/2025/07/19/audio_17c09f33d1.mp3",
  ),
  AmbienceModel(
    title: "Winter Cabin",
    subTitle: "Sleep",
    duration: "09:00",
    imageUrl:
        "https://images.pexels.com/photos/1367192/pexels-photo-1367192.jpeg?auto=compress&cs=tinysrgb&w=400",
    audio: "https://cdn.pixabay.com/audio/2025/12/23/audio_0da0607938.mp3",
  ),
];
