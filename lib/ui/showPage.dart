import 'package:chewie/chewie.dart';
import 'package:exam/ui/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class ShowPage extends StatefulWidget {
  String kelayotganVideo;
  String kelayotganIsm;
  String kelayotganRasm;
  String kelayotganGame;
  ShowPage(this.kelayotganVideo, this.kelayotganIsm, this.kelayotganRasm,
      this.kelayotganGame,
      {Key? key})
      : super(key: key);

  @override
  SshowPageState createState() => SshowPageState();
}

class SshowPageState extends State<ShowPage> {
  var _currentItemVideo;

  // int _count = 0; // for loop index list data

  // Video player controller variables :
  late Future _initializeVideoPlayerFuture; // for future initilize
  late ChewieController _chewieController; // for chewie controller
  late VideoPlayerController
      _videoPlayerController; // for video player controller

  // Video player settings variable
  bool _looping = false; // for video loop play
  bool _autoplay = false; // for video auto play

  @override
  void initState() {
    super.initState();

    _currentItemVideo = widget.kelayotganVideo;

    // Add video player controller with video link;
    _videoPlayerController = VideoPlayerController.network(_currentItemVideo);

    // Video player initialize :
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
  }

  // Play video player function :
  ChewieController _playVideo() {
    // Add chewie controller :
    _chewieController = ChewieController(
      // Settings chewie controller :
      videoPlayerController:
          _videoPlayerController, // Add video player controller to chewie controller
      autoInitialize: false, // auto initialize
      autoPlay: _autoplay, // auto play
      looping: _looping, // looping

      // For video player design :
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.white,
        handleColor: Colors.white,
        backgroundColor: Colors.white,
      ),

      // For error video player :
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );

    return _chewieController;
  }

  void dispose() {
    // Dispose video player :
    _chewieController.pause();
    _chewieController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF15141A),
        leading: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
              child: Text(
            "STREAM",
            style: TextStyle(
                color: Colors.yellow, fontFamily: "BigShould", fontSize: 30),
          )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25),
            child: Icon(
              Icons.more_vert,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF15141A),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: height / 3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              _playVideo();

                              return Chewie(
                                controller: _playVideo(),
                              );

                              // ignore: dead_code
                              _autoplay = false;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 33,
                  backgroundImage: NetworkImage(widget.kelayotganRasm),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(
                    widget.kelayotganIsm,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: width / 2.3,
                  height: height / 17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFF24222E)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.visibility_outlined,
                        size: 23,
                        color: Colors.yellow,
                      ),
                      Text(
                        "11,835 Viwers",
                        style: TextStyle(fontSize: 17, color: Colors.yellow),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0, left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(
                      "Streaming",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.kelayotganGame,
                  style: TextStyle(
                      color: Colors.yellow,
                      fontFamily: "BigShould",
                      fontSize: 40),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height / 10),
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      height: 60.0,
                      width: 180.0,
                      margin: EdgeInsets.only(
                        right: 20.0,
                        left: 10.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow, width: 2),
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.yellow),
                      child: Text(
                        "COMMENT",
                        style: TextStyle(
                            fontFamily: "BigShould",
                            // color: Colors.blue.shade600,
                            fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: () {
                      Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Comment()));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: 60.0,
                      width: 180.0,
                      margin: EdgeInsets.only(
                        right: 10.0,
                        left: 10.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow, width: 2),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "FOLLOWING",
                        style: TextStyle(
                            color: Colors.yellow, fontFamily: "BigShould"),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
