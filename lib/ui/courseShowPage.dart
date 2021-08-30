import 'package:exam/ui/feed.dart';
import 'package:exam/ui/gamePlay.dart';
import 'package:exam/ui/more.dart';
import 'package:exam/ui/showPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int hohlaganingniQil = 0;
bool isDarkMode = false;

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
      backgroundColor: Color(0xFF15141A),
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
    "https://r1---sn-8vap5-3c2k.googlevideo.com/videoplayback?expire=1630318887&ei=x1wsYcSoGfSexN8PqqqJwAM&ip=77.120.240.173&id=o-AGfndQoAh9RSRkt8jCC-6tXpNi5ceT-1X4VvYGJ7ZyNd&itag=22&source=youtube&requiressl=yes&mh=4D&mm=31%2C26&mn=sn-8vap5-3c2k%2Csn-f5f7lne7&ms=au%2Conr&mv=m&mvi=1&pl=20&initcwndbps=1185000&vprv=1&mime=video%2Fmp4&ns=0lCBRZR2TQDufY214l-PjdkG&cnr=14&ratebypass=yes&dur=618.184&lmt=1627842390395668&mt=1630296999&fvip=1&fexp=24001373%2C24007246&c=WEB&txp=5535432&n=tnnyRuSexmpr4KyQ&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgM-Zut8ov3yeZL3ay_0WKHqTnud3HnK4VsLkWdcu8Q4sCIQCgeRfaKfK7T9MdjNGRReytoZwXxBb5ufYYDnewLzARYQ%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIgZfe8MxNIa_Ns64fBEVLkEspnkwPmPmhIAuXYuNNmsk0CIQChkuqESPUFtTvbfuYsYHibw2pEZ6xihCWXcOPAry9v1Q%3D%3D&title=FORTNITE%20FAILS%20%26%20Epic%20Wins!%20%23201%20(Fortnite%20Battle%20Royale%20Funny%20Moments)",
    "https://r5---sn-h0jelne7.googlevideo.com/videoplayback?expire=1630319714&ei=AmAsYcbqCcvKgAfJk774CQ&ip=81.223.157.254&id=o-AL7EjHo4oZMmQ3smuYdqGZd_4hl855GKlHORD7aiOGat&itag=22&source=youtube&requiressl=yes&mh=W5&mm=31%2C29&mn=sn-h0jelne7%2Csn-h0jeenek&ms=au%2Crdu&mv=u&mvi=5&pl=24&vprv=1&mime=video%2Fmp4&ns=esyiU8-BupFofefVW-wu2wcG&ratebypass=yes&dur=269.281&lmt=1560955172150254&mt=1630297636&fvip=5&fexp=24001373%2C24007246&c=WEB&txp=2216222&n=iZ5ZJ78qMHnDV40x&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgYBrumZJ5Pmro970c93DXi0OJ3UG7wzfS9yFY1W1BKF0CIQCEzm36B-RYGQb1zOviLu-DX8acu0Cx2c43-77VOmXR-g%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl&lsig=AG3C_xAwRQIgArK03ucyDkdT5S6D0SQgrwSpSxDN4ghhb-NoKZB1sU8CIQDCkE5cTClt8Lvi2LRY7DJM8pg0Zy8wQlZFv4ydVYlh3g%3D%3D&title=Just%20Another%20Frag%20Movie!",
    "https://r8---sn-3u-bh2sz.googlevideo.com/videoplayback?expire=1630319272&ei=SF4sYbiVM4z1WOrejZAE&ip=220.87.254.101&id=o-AKhf6lmFnO6jIgBTA4ZxVw7_O8ewHRBAMKdMkHhvgfw5&itag=22&source=youtube&requiressl=yes&mh=3d&mm=31%2C26&mn=sn-3u-bh2sz%2Csn-ogul7n7z&ms=au%2Conr&mv=m&mvi=8&pl=17&initcwndbps=1006250&vprv=1&mime=video%2Fmp4&ns=27uyg4BVTkxbjP1tUOLP1ygG&cnr=14&ratebypass=yes&dur=209.954&lmt=1534100707325187&mt=1630297480&fvip=5&fexp=24001373%2C24007246&c=WEB&n=RioxOuLb_aBiw8j0&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Ccnr%2Cratebypass%2Cdur%2Clmt&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhAJWWJCNEkafskDlbvdFDT7VxIxzAmNqkFtxYC0i5M8YEAiBndVrd_BTWnuN2OatiEY6bJz-aquQlnS9bG9f7keO2kQ%3D%3D&sig=AOq0QJ8wRgIhANSZS2GwS-H-xjzr5PqwR7NHEMps8fzW2OSU8dcgLiqaAiEAgAjL57VqSeXq_KUHS10OrcDCCuKB-FlA0Ka7Y8bO6rM%3D&title=PUBG%20-%20Epic%2015%20Frag%20Win%20edited%20into%203%20minutes%20DTreats",
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expanded(
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
                                        style: TextStyle(color: Colors.yellow),
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
      ],
    );
  }
}
