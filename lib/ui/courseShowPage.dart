import 'package:exam/ui/feed.dart';
import 'package:exam/ui/gamePlay.dart';
import 'package:exam/ui/more.dart';
import 'package:exam/ui/showPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int hohlaganingniQil = 0;

class CourseShowPage extends StatefulWidget {
  const CourseShowPage({Key? key}) : super(key: key);

  @override
  _CourseShowPageState createState() => _CourseShowPageState();
}

int _currentIndex = 0;
List<Widget> myList = [
  ForHome(),
  Feed(),
  GamePlay(),
  More(),
];

class _CourseShowPageState extends State<CourseShowPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF15141A),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: Icon(
            Icons.bubble_chart,
            color: Colors.yellow,
            size: 35,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Icon(
              Icons.category_outlined,
              color: Colors.blue,
              size: 40,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25),
            child: Icon(
              Icons.fiber_smart_record_outlined,
              color: Colors.yellow,
              size: 30,
            ),
          ),
        ],
      ),
      body: myList[hohlaganingniQil],
      bottomNavigationBar: SizedBox(
        height: height / 10,
        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontSize: 14),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.yellow,
              icon: Icon(
                CupertinoIcons.layers,
                size: 30,
                color: Colors.black,
              ),
              label: "HOME",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.yellow,
              icon: Icon(
                CupertinoIcons.creditcard,
                size: 30,
                color: Colors.black,
              ),
              label: "FEED",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.yellow,
              icon: Icon(
                CupertinoIcons.play_rectangle,
                size: 28,
                color: Colors.black,
              ),
              label: "GAME PLAY",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.yellow,
              icon: Icon(
                CupertinoIcons.square_grid_2x2,
                size: 28,
                color: Colors.black,
              ),
              label: "MORE",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              hohlaganingniQil = _currentIndex;
            });
          },
        ),
      ),
    );
  }
}

class ForHome extends StatefulWidget {
  const ForHome({Key? key}) : super(key: key);

  @override
  _ForHomeState createState() => _ForHomeState();
}

class _ForHomeState extends State<ForHome> {
  final List<String> entries = <String>[
    'FORTNITE',
    'CS:GO',
    'PUBG',
  ];
  List<Color> colorCodes = [
    Colors.yellow,
    Colors.indigo.shade300,
    Colors.red.shade200,
  ];
  List<String> userName = [
    "ninja_co",
    "dandy",
    "general",
  ];
  List<String> userPhoto = [
    "https://www.gamersdecide.com/sites/default/files/styles/gamepage_sidebar_first/public/Mark%20of%20the%20Ninja%20-%20game%20rating%20and%20user%20reviews.jpg",
    "https://cdna.artstation.com/p/assets/covers/images/036/087/806/large/marcos-kenji-uchima-marcos-kenji-uchima-ace-chars-icon.jpg?1616688071",
    "https://static.wikia.nocookie.net/mobile-legends/images/8/89/Tribal_Warrior.jpg/revision/latest/top-crop/width/360/height/360?cb=20181223141428"
  ];
  List<String> gamePhoto = [
    "https://make-fortnite-wallpapers.com/img/posing/boxy.png",
    "http://pngimg.com/uploads/counter_strike/counter_strike_PNG42.png",
    "http://pngimg.com/uploads/pubg/pubg_PNG45.png"
  ];

  var lstVideos = [
    "https://r5---sn-a5mlrn7r.googlevideo.com/videoplayback?expire=1628704006&ei=prgTYfL5I9iQsfIP1M272AQ&ip=64.145.76.201&id=o-ALIysOpU_SaPRHwAmyTS0UJDIne4gv0k0Ma0Mhe1Adtm&itag=18&source=youtube&requiressl=yes&mh=gD&mm=31%2C29&mn=sn-a5mlrn7r%2Csn-a5mekner&ms=au%2Crdu&mv=m&mvi=5&pl=24&initcwndbps=726250&vprv=1&mime=video%2Fmp4&ns=P_gpj_g_SH-u60mgDklZAqkG&gir=yes&clen=24778916&ratebypass=yes&dur=268.422&lmt=1576361611902104&mt=1628682068&fvip=5&fexp=24001373%2C24007246&c=WEB&txp=3531432&n=WJTVQszUbU59V0xnBKB&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhALRAjG-HJ5L_7TXaD74AOch1b80W8uqCQUCWv392tSG1AiBeXz-9Y6tL25aLeWQmqhZ8aSD41zYtDTGF1RvX1ur2Og%3D%3D&sig=AOq0QJ8wRAIgIpHAtM04QchHtIh0k6mf0n19tIOIUb0YhHyw9Dg366UCIFt9n4XemFD3os0l2oYayMuwYu0nxXTPcIAlPkCMBN2k",
    "https://r4---sn-8p85jvh-nv4z.googlevideo.com/videoplayback?expire=1628704333&ei=7bkTYdVX84Cn6g-blr5Q&ip=77.238.79.111&id=o-AHxiquvq1gHfUjxLIiFVxD0z0nyK35lQ8C0aN6-IXOw0&itag=18&source=youtube&requiressl=yes&mh=ip&mm=31%2C29&mn=sn-8p85jvh-nv4z%2Csn-nv47lnls&ms=au%2Crdu&mv=m&mvi=4&pl=19&initcwndbps=1758750&vprv=1&mime=video%2Fmp4&ns=JFY2If3WJdt9AQHEsRmvJs0G&gir=yes&clen=18750598&ratebypass=yes&dur=208.143&lmt=1591804257060450&mt=1628682068&fvip=4&fexp=24001373%2C24007246&c=WEB&txp=6216222&n=JSm1v2bhr__W9xJOBBN&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgcil6xqxtmoKsh-KXfYe4Ax9f2SJLEIDHXWXgvQaWBhQCIGOmCF0wNrGg7WmUAlFLSw6VKYR0bBLRcPwzdNtr_IaG&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRgIhALMDF6LygWxPqBTpX6y5etf_fMYxll3Opi-xHjDVgcUrAiEA_0C3ua8F1MQNooy4Xu9Sk-mzKqWqf_p9ohiz45x-EcE%3D",
    "https://r2---sn-8vap5-afve.googlevideo.com/videoplayback?expire=1628704534&ei=troTYbeDL8aT1gLZ8rqYBg&ip=77.120.33.35&id=o-AK8cvyPZr0dmByD66iOZL1QFgAe1PycEGekA5Ezo950G&itag=18&source=youtube&requiressl=yes&mh=9F&mm=31%2C29&mn=sn-8vap5-afve%2Csn-8vap5-3c2k&ms=au%2Crdu&mv=m&mvi=2&pl=21&initcwndbps=1343750&vprv=1&mime=video%2Fmp4&ns=i4h1XXB1gfRbNGdi0tO-gcUG&gir=yes&clen=16509524&ratebypass=yes&dur=180.442&lmt=1501563738632347&mt=1628682790&fvip=4&fexp=24001373%2C24007246&c=WEB&n=mZjA5kTo6JMqiujg3FZ&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIhAJa6Jr2nCd-MG0h44WlvZU4gary3KWdCoq-hPC7CTFi5AiBYMrGTUEzpitvcexp-7YnFLQnx1NIa-z5uTjfCKNUWJw%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIgCkpSogeLArHWU0nMlrlY9Za-moH_YD9YUvY0wtsUuuUCIQCf3JcsstZnFXxS_0ROexSMf-2z6aPQutmMNS5JmEIGaA%3D%3D",
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF15141A),
            ),
            child: NestedScrollView(
              physics: BouncingScrollPhysics(),
              headerSliverBuilder: (context, value) {
                return [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [],
                    ),
                  ),
                ];
              },
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "STREAMO",
                        style: TextStyle(
                            color: Colors.yellow,
                            fontFamily: "BigShould",
                            fontSize: 30.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 20.0, bottom: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "FAVOURITE STREAMS",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width / 1.08,
                        height: height / 2.6,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: lstVideos.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShowPage(
                                        lstVideos[index],
                                        userName[index],
                                        userPhoto[index],
                                        entries[index]),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  color: colorCodes[index],
                                  image: DecorationImage(
                                      alignment: Alignment.topCenter,
                                      image: NetworkImage(gamePhoto[index]),
                                      fit: BoxFit.cover),
                                ),
                                margin: EdgeInsets.only(right: 60.0),
                                width: width / 2,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(userPhoto[index]),
                                          ),
                                          Text(
                                            userName[index],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(Icons.more_vert)
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 100),
                                      child: Center(
                                        child: Text(
                                          entries[index],
                                          style: TextStyle(
                                              fontFamily: "BigShould",
                                              fontSize: 30.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "26.6k Viewers",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                      child: Text(
                        "POPULAR STREMERS",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 15),
                          child: Container(
                            width: width / 1.5,
                            child: Card(
                              color: Color(0xFF24222E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        userPhoto[index],
                                      ),
                                      radius: 35,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 80),
                                          child: Text(
                                            userName[index],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Text(
                                          "Streaming Now - ${entries[index]}",
                                          style:
                                              TextStyle(color: Colors.yellow),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
