// import 'track_object.dart';

// part 'tracksListObject.g.dart';

class TracksList {
  final List<TrackObject> tracks;

  TracksList({
    this.tracks,
  });

  factory TracksList.fromJson(List<dynamic> parsedJson) {
    List<TrackObject> tracks = List<TrackObject>();
    tracks = parsedJson.map((i) => TrackObject.fromJson(i)).toList();

    return TracksList(
      tracks: tracks,
    );
  }
}

class TrackObject {
  final String id;
  final String email;
  final String paid;
  final String size;
  final String type;
  final String upload;
  final String message;
  final List<String> tweaks;

  TrackObject({
    this.id,
    this.email,
    this.paid,
    this.size,
    this.type,
    this.upload,
    this.message,
    this.tweaks,
  });
  // final List<Tweaks> tweaks;

  // factory TrackObject.fromJson(Map<String, dynamic> json) =>
  //     _$TrackObjectFromJson(json);

  factory TrackObject.fromJson(Map<String, dynamic> json) {
    // if (json == null) {
    //   throw FormatException("Null JSON provided to SimpleObject");
    // }
    return TrackObject(
      id: json['id'],
      email: json['email'],
      paid: json['paid'],
      size: json['size'],
      type: json['type'],
      upload: json['upload'],
      message: json['message'],
      tweaks: json['tweaks'] != null ? List<String>.from(json['tweaks']) : null,
    );
  }
}

// class Tweaks {
//   final String bass;
//   final String boost;
//   final String style;
//   final String nr;
//   final String treble;

//   Tweaks({this.bass, this.boost, this.style, this.nr, this.treble});
// }
