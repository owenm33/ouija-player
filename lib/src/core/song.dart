import 'track.dart';

class Song extends Track {
  Song(String size, String title, String artist)
      : super(size, title, artist, "song") {
    print("Song class constructor");
  }
}
