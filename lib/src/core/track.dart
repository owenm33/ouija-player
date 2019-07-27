import 'package:flutter_web/material.dart';

abstract class Track {
  // double _duration;
  String _size;
  String _title;
  String _artist;
  String _type;
  Card card;

  // double get duration => _duration;
  String get size => _size;
  String get title => _title;
  String get type => _type;
  String get artist => _artist;

  void download() {
    print("Downloading a " + this._type);
  }

  Track(this._size, this._title, this._artist, this._type);
}
