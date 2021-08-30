import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

var lstVideos = [
  "https://r1---sn-8vap5-3c2k.googlevideo.com/videoplayback?expire=1630318887&ei=x1wsYcSoGfSexN8PqqqJwAM&ip=77.120.240.173&id=o-AGfndQoAh9RSRkt8jCC-6tXpNi5ceT-1X4VvYGJ7ZyNd&itag=22&source=youtube&requiressl=yes&mh=4D&mm=31%2C26&mn=sn-8vap5-3c2k%2Csn-f5f7lne7&ms=au%2Conr&mv=m&mvi=1&pl=20&initcwndbps=1185000&vprv=1&mime=video%2Fmp4&ns=0lCBRZR2TQDufY214l-PjdkG&cnr=14&ratebypass=yes&dur=618.184&lmt=1627842390395668&mt=1630296999&fvip=1&fexp=24001373%2C24007246&c=WEB&txp=5535432&n=tnnyRuSexmpr4KyQ&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgM-Zut8ov3yeZL3ay_0WKHqTnud3HnK4VsLkWdcu8Q4sCIQCgeRfaKfK7T9MdjNGRReytoZwXxBb5ufYYDnewLzARYQ%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIgZfe8MxNIa_Ns64fBEVLkEspnkwPmPmhIAuXYuNNmsk0CIQChkuqESPUFtTvbfuYsYHibw2pEZ6xihCWXcOPAry9v1Q%3D%3D&title=FORTNITE%20FAILS%20%26%20Epic%20Wins!%20%23201%20(Fortnite%20Battle%20Royale%20Funny%20Moments)",
  "https://r5---sn-h0jelne7.googlevideo.com/videoplayback?expire=1630319714&ei=AmAsYcbqCcvKgAfJk774CQ&ip=81.223.157.254&id=o-AL7EjHo4oZMmQ3smuYdqGZd_4hl855GKlHORD7aiOGat&itag=22&source=youtube&requiressl=yes&mh=W5&mm=31%2C29&mn=sn-h0jelne7%2Csn-h0jeenek&ms=au%2Crdu&mv=u&mvi=5&pl=24&vprv=1&mime=video%2Fmp4&ns=esyiU8-BupFofefVW-wu2wcG&ratebypass=yes&dur=269.281&lmt=1560955172150254&mt=1630297636&fvip=5&fexp=24001373%2C24007246&c=WEB&txp=2216222&n=iZ5ZJ78qMHnDV40x&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgYBrumZJ5Pmro970c93DXi0OJ3UG7wzfS9yFY1W1BKF0CIQCEzm36B-RYGQb1zOviLu-DX8acu0Cx2c43-77VOmXR-g%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl&lsig=AG3C_xAwRQIgArK03ucyDkdT5S6D0SQgrwSpSxDN4ghhb-NoKZB1sU8CIQDCkE5cTClt8Lvi2LRY7DJM8pg0Zy8wQlZFv4ydVYlh3g%3D%3D&title=Just%20Another%20Frag%20Movie!",
  "https://r8---sn-3u-bh2sz.googlevideo.com/videoplayback?expire=1630319272&ei=SF4sYbiVM4z1WOrejZAE&ip=220.87.254.101&id=o-AKhf6lmFnO6jIgBTA4ZxVw7_O8ewHRBAMKdMkHhvgfw5&itag=22&source=youtube&requiressl=yes&mh=3d&mm=31%2C26&mn=sn-3u-bh2sz%2Csn-ogul7n7z&ms=au%2Conr&mv=m&mvi=8&pl=17&initcwndbps=1006250&vprv=1&mime=video%2Fmp4&ns=27uyg4BVTkxbjP1tUOLP1ygG&cnr=14&ratebypass=yes&dur=209.954&lmt=1534100707325187&mt=1630297480&fvip=5&fexp=24001373%2C24007246&c=WEB&n=RioxOuLb_aBiw8j0&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Ccnr%2Cratebypass%2Cdur%2Clmt&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhAJWWJCNEkafskDlbvdFDT7VxIxzAmNqkFtxYC0i5M8YEAiBndVrd_BTWnuN2OatiEY6bJz-aquQlnS9bG9f7keO2kQ%3D%3D&sig=AOq0QJ8wRgIhANSZS2GwS-H-xjzr5PqwR7NHEMps8fzW2OSU8dcgLiqaAiEAgAjL57VqSeXq_KUHS10OrcDCCuKB-FlA0Ka7Y8bO6rM%3D&title=PUBG%20-%20Epic%2015%20Frag%20Win%20edited%20into%203%20minutes%20DTreats",
];

class GamePlay extends StatefulWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  _GamePlayState createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  var _currentItemVideo;
  var _currentItemVideo1;
  var _currentItemVideo2;

  // int _count = 0; // for loop index list data

  // Video player controller variables :
  late Future _initializeVideoPlayerFuture;
  late Future _initializeVideoPlayerFuture1;
  late Future _initializeVideoPlayerFuture2; // for future initilize
  late ChewieController _chewieController;
  late ChewieController _chewieController1;
  late ChewieController _chewieController2; // for chewie controller
  late VideoPlayerController _videoPlayerController;
  late VideoPlayerController _videoPlayerController1;
  late VideoPlayerController
      _videoPlayerController2; // for video player controller

  // Video player settings variable
  bool _looping = false; // for video loop play
  bool _autoplay = false; // for video auto play

  @override
  void initState() {
    super.initState();

    _currentItemVideo = lstVideos[0].toString();
    _currentItemVideo1 = lstVideos[1].toString();
    _currentItemVideo2 = lstVideos[2].toString();

    // Add video player controller with video link;
    _videoPlayerController = VideoPlayerController.network(_currentItemVideo);
    _videoPlayerController1 = VideoPlayerController.network(_currentItemVideo1);
    _videoPlayerController2 = VideoPlayerController.network(_currentItemVideo2);

    // Video player initialize :
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _initializeVideoPlayerFuture1 = _videoPlayerController1.initialize();
    _initializeVideoPlayerFuture2 = _videoPlayerController2.initialize();
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

  ChewieController _playVideo1() {
    // Add chewie controller :
    _chewieController1 = ChewieController(
      // Settings chewie controller :
      videoPlayerController:
          _videoPlayerController1, // Add video player controller to chewie controller
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

    return _chewieController1;
  }

  ChewieController _playVideo2() {
    // Add chewie controller :
    _chewieController2 = ChewieController(
      // Settings chewie controller :
      videoPlayerController:
          _videoPlayerController2, // Add video player controller to chewie controller
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

    return _chewieController2;
  }

  void dispose() {
    // Dispose video player :
    _chewieController.pause();
    _chewieController.dispose();
    _chewieController1.pause();
    _chewieController1.dispose();
    _chewieController2.pause();
    _chewieController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xFF15141A),
      child: ListView(children: [
        Column(
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
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
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
                          future: _initializeVideoPlayerFuture1,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              _playVideo1();

                              return Chewie(
                                controller: _playVideo1(),
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
                          future: _initializeVideoPlayerFuture2,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              _playVideo2();

                              return Chewie(
                                controller: _playVideo2(),
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
          ],
        ),
      ]),
    );
  }
}
