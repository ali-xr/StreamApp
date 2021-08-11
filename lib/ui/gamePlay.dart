import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

var lstVideos = [
  "https://r5---sn-a5mlrn7r.googlevideo.com/videoplayback?expire=1628704006&ei=prgTYfL5I9iQsfIP1M272AQ&ip=64.145.76.201&id=o-ALIysOpU_SaPRHwAmyTS0UJDIne4gv0k0Ma0Mhe1Adtm&itag=18&source=youtube&requiressl=yes&mh=gD&mm=31%2C29&mn=sn-a5mlrn7r%2Csn-a5mekner&ms=au%2Crdu&mv=m&mvi=5&pl=24&initcwndbps=726250&vprv=1&mime=video%2Fmp4&ns=P_gpj_g_SH-u60mgDklZAqkG&gir=yes&clen=24778916&ratebypass=yes&dur=268.422&lmt=1576361611902104&mt=1628682068&fvip=5&fexp=24001373%2C24007246&c=WEB&txp=3531432&n=WJTVQszUbU59V0xnBKB&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhALRAjG-HJ5L_7TXaD74AOch1b80W8uqCQUCWv392tSG1AiBeXz-9Y6tL25aLeWQmqhZ8aSD41zYtDTGF1RvX1ur2Og%3D%3D&sig=AOq0QJ8wRAIgIpHAtM04QchHtIh0k6mf0n19tIOIUb0YhHyw9Dg366UCIFt9n4XemFD3os0l2oYayMuwYu0nxXTPcIAlPkCMBN2k",
  "https://r4---sn-8p85jvh-nv4z.googlevideo.com/videoplayback?expire=1628704333&ei=7bkTYdVX84Cn6g-blr5Q&ip=77.238.79.111&id=o-AHxiquvq1gHfUjxLIiFVxD0z0nyK35lQ8C0aN6-IXOw0&itag=18&source=youtube&requiressl=yes&mh=ip&mm=31%2C29&mn=sn-8p85jvh-nv4z%2Csn-nv47lnls&ms=au%2Crdu&mv=m&mvi=4&pl=19&initcwndbps=1758750&vprv=1&mime=video%2Fmp4&ns=JFY2If3WJdt9AQHEsRmvJs0G&gir=yes&clen=18750598&ratebypass=yes&dur=208.143&lmt=1591804257060450&mt=1628682068&fvip=4&fexp=24001373%2C24007246&c=WEB&txp=6216222&n=JSm1v2bhr__W9xJOBBN&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgcil6xqxtmoKsh-KXfYe4Ax9f2SJLEIDHXWXgvQaWBhQCIGOmCF0wNrGg7WmUAlFLSw6VKYR0bBLRcPwzdNtr_IaG&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRgIhALMDF6LygWxPqBTpX6y5etf_fMYxll3Opi-xHjDVgcUrAiEA_0C3ua8F1MQNooy4Xu9Sk-mzKqWqf_p9ohiz45x-EcE%3D",
  "https://r2---sn-8vap5-afve.googlevideo.com/videoplayback?expire=1628704534&ei=troTYbeDL8aT1gLZ8rqYBg&ip=77.120.33.35&id=o-AK8cvyPZr0dmByD66iOZL1QFgAe1PycEGekA5Ezo950G&itag=18&source=youtube&requiressl=yes&mh=9F&mm=31%2C29&mn=sn-8vap5-afve%2Csn-8vap5-3c2k&ms=au%2Crdu&mv=m&mvi=2&pl=21&initcwndbps=1343750&vprv=1&mime=video%2Fmp4&ns=i4h1XXB1gfRbNGdi0tO-gcUG&gir=yes&clen=16509524&ratebypass=yes&dur=180.442&lmt=1501563738632347&mt=1628682790&fvip=4&fexp=24001373%2C24007246&c=WEB&n=mZjA5kTo6JMqiujg3FZ&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIhAJa6Jr2nCd-MG0h44WlvZU4gary3KWdCoq-hPC7CTFi5AiBYMrGTUEzpitvcexp-7YnFLQnx1NIa-z5uTjfCKNUWJw%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIgCkpSogeLArHWU0nMlrlY9Za-moH_YD9YUvY0wtsUuuUCIQCf3JcsstZnFXxS_0ROexSMf-2z6aPQutmMNS5JmEIGaA%3D%3D",
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
