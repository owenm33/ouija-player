import 'track.dart';

class Video extends Track {
  Video(String size, String title, String artist)
      : super(size, title, artist, "video") {
    print("Video class constructor");
  }
}
