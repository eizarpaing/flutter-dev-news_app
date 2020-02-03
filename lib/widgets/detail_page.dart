import 'package:flutter/material.dart';
import 'package:news/models/newsArticle.dart';
import 'package:intl/intl.dart';
import 'package:news/widgets/login_page.dart';

const color = const Color(0xff336699);

class DetailPage extends StatefulWidget {
  final NewsArticle newsarticle;
  const DetailPage({Key key, this.newsarticle}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var strToday = getStrToday();
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Details'),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: IconButton(
                    icon: new Icon(Icons.share),
                    onPressed: _shareFB,
                  )
                )
              ],
              backgroundColor: Color(0xff336699),
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                  background:
                      Image.network(widget.newsarticle.urlToImage, fit: BoxFit.cover)),
            ),
            SliverFixedExtentList(
              itemExtent: 800.0,
              delegate: SliverChildListDelegate([
                Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        widget.newsarticle.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        widget.newsarticle.descrption,
                        softWrap: true,
                        style: TextStyle(color: Colors.black45, fontSize: 16.0),
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void _shareFB() {
      Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    LoginPage())
                    );
    }

  String getStrToday() {
    var today = DateFormat().add_yMMMMd().format(DateTime.now());
    var strDay = today.split(" ")[1].replaceFirst(',', '');
    if (strDay == '1') {
      strDay = strDay + "st";
    } else if (strDay == '2') {
      strDay = strDay + "nd";
    } else if (strDay == '3') {
      strDay = strDay + "rd";
    } else {
      strDay = strDay + "th";
    }
    var strMonth = today.split(" ")[0];
    var strYear = today.split(" ")[2];
    return "$strDay $strMonth $strYear";
  }
}
