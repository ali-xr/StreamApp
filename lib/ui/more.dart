import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  bool _onOff = false;
  bool _onOff2 = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF15141A),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => getImage(),
                  child: _image == null
                      ? Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.amber, width: 2.5),
                              color: Colors.white),
                          child: Icon(
                            Icons.person,
                            size: 30.0,
                            color: Colors.blue.shade800,
                          ),
                        )
                      : Container(
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.amber, width: 2.5),
                            color: Colors.white,
                            image: DecorationImage(
                              image: FileImage(_image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white.withOpacity(0.05),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        "Name",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        "Alijon Xurshetov",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.white.withOpacity(0.6)),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white.withOpacity(0.05),
              ),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  "Phone number",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "+998992111811",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white.withOpacity(0.6)),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white.withOpacity(0.05),
              ),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.sun_max_fill,
                  color: Colors.white,
                ),
                title: Text(
                  "Night Mode",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                trailing: CupertinoSwitch(
                  trackColor: Colors.black,
                  activeColor: Colors.white,
                  value: _onOff,
                  onChanged: (e) {
                    setState(() {
                      _onOff = e;
                    });
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white.withOpacity(0.05),
              ),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                title: Text(
                  "Notification",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                trailing: CupertinoSwitch(
                  trackColor: Colors.black,
                  activeColor: Colors.white,
                  value: _onOff2,
                  onChanged: (e) {
                    setState(() {
                      _onOff2 = e;
                    });
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white.withOpacity(0.05),
              ),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Icon(
                  Icons.support_agent,
                  color: Colors.white,
                ),
                title: Text(
                  "Support",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.send_to_mobile,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
