import 'package:flutter_web/material.dart';

import 'src/core/song.dart';
import 'src/core/track.dart';
import 'src/core/video.dart';

// var client = http.Client();
// List<Track> newTracks = List();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  List<Track> newTracks = List<Track>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angostura',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Dolby On Support'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (choose the "Toggle Debug Paint" action
          // from the Flutter Inspector in Android Studio, or the "Toggle Debug
          // Paint" command in Visual Studio Code) to see the wireframe for each
          // widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, World!',
            ),
            RaisedButton(
                child: Text('List songs'),
                onPressed: () {
                  // await getTracks();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SongList()),
                  );
                })
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Song list"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('Go home'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Expanded(
              child: BodyLayout(),
            )
          ],
        )));
  }
}

class BodyLayout extends StatelessWidget {
  final List<Track> tracks = createTracks();
  @override
  Widget build(BuildContext context) {
    return _myListView(context, tracks);
  }

  static createTracks() {
    List<Track> tracks = List<Track>();
    for (int i = 0; i < 10; i++) {
      tracks.add(Song("3.5", "Song " + i.toString(), "Artist " + i.toString()));
      tracks
          .add(Video("3.5", "Video " + i.toString(), "Artist " + i.toString()));
    }
    return tracks;
  }
}

Widget _myListView(BuildContext context, List<Track> tracks) {
  return ListView.builder(
    itemCount: tracks.length,
    itemBuilder: (BuildContext context, int index) => TrackItem(tracks[index]),
  );
  // itemBuilder: (context, index) {
  //   final item = tracks[index];
  //   return Card(
  //     child: ListTile(
  //       title: Text(item.title),
  //       leading: item.type == "song"
  //           ? Icon(Icons.music_note)
  //           : Icon(Icons.music_video),
  //       trailing: Icon(Icons.arrow_drop_down),
  //       onTap: () {
  //         print('Tapped ' + item.title);
  //       },
  //     ),
  //   );
  // });
}

class TrackItem extends StatelessWidget {
  const TrackItem(this.track);
  final Track track;

  Widget _buildTiles(Track root) {
    return ExpansionTile(
        key: PageStorageKey<Track>(root),
        title: Text(root.title),
        leading: root.type == "song"
            ? Icon(Icons.music_note)
            : Icon(Icons.music_video),
        children: <Widget>[
          Align(
              alignment: Alignment(-0.9, 0.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "\nArtist:     " + root.artist,
                    ),
                    Text("Size:   " + root.size + "\n"),
                    Text("Type:    " + root.type + "\n\n"),
                  ]))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(track);
  }
}

// Future<void> getTracks() async {
//   var url; // add API root here
//   // var response = await http.get(url);
//   var jsonString = await http.get(url);
//   final jsonResponse = json.decode(jsonString.toString());
//   TracksList tracklist = TracksList.fromJson(jsonResponse);
//   List<TrackObject> trackObjs = tracklist.tracks;
//   // List<Track> userTracks = List<Track>();
//   for (var i = 0; i < trackObjs.length; i++) {
//     trackObjs[i].type == "audio"
//         ? newTracks
//             .add(Song(trackObjs[i].size, trackObjs[i].id, trackObjs[i].email))
//         : newTracks
//             .add(Video(trackObjs[i].size, trackObjs[i].id, trackObjs[i].email));
//   }
// }
