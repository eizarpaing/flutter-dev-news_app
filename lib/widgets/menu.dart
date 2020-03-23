import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Color randomColor() => Color((0xffDE255D).toInt() << 0)
      .withOpacity(0.3); //(Random().nextDouble() *

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Menu'),),
      body: Card(
        elevation: 5,
              child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
            ClipPath(
              clipper: MyCliper(),
              child: Container(
                width: double.infinity,
                height: 240,
                // child: Center(
                //   child: Text('Win Kyawt Khaing',
                //       style: TextStyle(
                //           fontSize: 30,
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold)),
                // ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/profile.jpg'),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Positioned(
              left: screenSize.width * 0.36,
              top: screenSize.height * 0.18,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    color: randomColor(),
                    image: DecorationImage(
                        image: AssetImage('assets/user.jpg'), fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(70)),
                    border: Border.all(color: Colors.white, width: 3)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Container(
                  width: double.infinity,
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: <Widget>[
                            Text('Win Kyawt Khaing',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.work, color: Colors.cyan),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                                child: Text(
                              'Mobile Developer',
                              style: TextStyle(fontSize: 20),
                            )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.email,
                              color: Colors.cyan,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                                child: Text(
                              'winkyawtkhaing2017@gmail.com',
                              style: TextStyle(fontSize: 20),
                            )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.phone, color: Colors.cyan),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                                child: Text(
                              '09953404046',
                              style: TextStyle(fontSize: 20),
                            )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.home, color: Colors.cyan),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                                child: Text(
                              'Theingyi Street, Kyimyindaing Tsp, Yangon.',
                              style: TextStyle(fontSize: 20),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}

class MyCliper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.lineTo(size.width / 2,
        size.height); //    path.lineTo(size.width / 4, size.height);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return null;
  }
}

class MyCliper2 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.lineTo(size.width / 4,
        size.height); //    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width / 2, size.height - 50);
    path.lineTo(size.width - size.width / 4, size.height);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return null;
  }
}

class MyCliper3 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return null;
  }
}

class MyCliper4 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return null;
  }
}