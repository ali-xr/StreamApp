import 'package:exam/theme/component.dart';
import 'package:exam/theme/theme_color.dart';
import 'package:flutter/material.dart';

bool isDarkMode = false;

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ThemeColor lightMode = ThemeColor(
    gradient: [
      const Color(0xDDFF0080),
      const Color(0xDDFF8C00),
    ],
    backgroundColor: const Color(0xFFFFFFFF),
    textColor: const Color(0xFF000000),
    toggleButtonColor: const Color(0xFFFFFFFF),
    toggleBackgroundColor: const Color(0xFFe7e7e8),
    shadow: const [
      BoxShadow(
        color: const Color(0xFFd8d7da),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
  );

  ThemeColor darkMode = ThemeColor(
    gradient: [
      const Color(0xFF8983F7),
      const Color(0xFFA3DAFB),
    ],
    backgroundColor: const Color(0xFF15141A),
    textColor: const Color(0xFFFFFFFF),
    toggleButtonColor: const Color(0xFf34323d),
    toggleBackgroundColor: const Color(0xFF222029),
    shadow: const <BoxShadow>[
      BoxShadow(
        color: const Color(0x99000000),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
  );

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  changeThemeMode() {
    if (isDarkMode) {
      _animationController.forward(from: 0.0);
    } else {
      _animationController.reverse(from: 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: isDarkMode ? lightMode.backgroundColor : darkMode.backgroundColor,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: height * 0.1),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: width * 0.35,
                  height: width * 0.35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors:
                          isDarkMode ? lightMode.gradient : darkMode.gradient,
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(40, 0),
                  child: ScaleTransition(
                    scale: _animationController.drive(
                      Tween<double>(begin: 1.0, end: 0.0).chain(
                        CurveTween(curve: Curves.decelerate),
                      ),
                    ),
                    alignment: Alignment.topRight,
                    child: Container(
                      width: width * 0.26,
                      height: width * 0.26,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDarkMode
                            ? lightMode.backgroundColor
                            : darkMode.backgroundColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Text(
              'Choose a style',
              style: TextStyle(
                color: isDarkMode ? lightMode.textColor : darkMode.textColor,
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              width: width * 0.7,
              child: Text(
                'Pop or subtle. Day or night. Customize your interface',
                style: TextStyle(
                  color: isDarkMode ? lightMode.textColor : darkMode.textColor,
                  fontSize: width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            AnimatedToggle(
              values: ['Light', 'Dark'],
              textColor: isDarkMode ? lightMode.textColor : darkMode.textColor,
              backgroundColor: isDarkMode
                  ? lightMode.toggleBackgroundColor
                  : darkMode.toggleBackgroundColor,
              buttonColor: isDarkMode
                  ? lightMode.toggleButtonColor
                  : darkMode.toggleButtonColor,
              shadows: isDarkMode ? lightMode.shadow : darkMode.shadow,
              onToggleCallback: (index) {
                isDarkMode = !isDarkMode;
                setState(() {});
                changeThemeMode();
              },
            ),
            SizedBox(
              height: height * 0.05,
              width: width,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildDot(
                  width: width * 0.022,
                  height: width * 0.022,
                  color: const Color(0xFFd9d9d9),
                ),
                buildDot(
                  width: width * 0.055,
                  height: width * 0.022,
                  color: !isDarkMode
                      ? lightMode.backgroundColor
                      : darkMode.backgroundColor,
                ),
                buildDot(
                  width: width * 0.022,
                  height: width * 0.022,
                  color: const Color(0xFFd9d9d9),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.04),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: width * 0.045,
                          color: const Color(0xFF7c7b7e),
                        ),
                      ),
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {
                        // ignore: deprecated_member_use
                        _scaffoldKey.currentState!.showSnackBar(
                          SnackBar(
                            content: Text(
                              'Loved it? Give a star on Github',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: width * 0.045,
                              ),
                            ),
                          ),
                        );
                      },
                      shape: CircleBorder(),
                      color: isDarkMode
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF35303f),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: Icon(
                          Icons.arrow_forward,
                          color: isDarkMode
                              ? const Color(0xFF000000)
                              : const Color(0xFFFFFFFF),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot({double? width, double? height, Color? color}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: width,
      height: height,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
      ),
    );
  }
}
