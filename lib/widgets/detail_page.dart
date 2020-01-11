import 'package:flutter/material.dart';
import 'package:networking_demo/models/newsArticle.dart';
import 'package:intl/intl.dart';

const color = const Color(0xff336699);

class DetailPage extends StatelessWidget {
  final NewsArticle newsarticle;
  const DetailPage({Key key, this.newsarticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var strToday = getStrToday();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Deatils"),
        backgroundColor: color,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.share),
        mini: true,
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(newsarticle.urlToImage),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(strToday, 
            style: TextStyle(color: Colors.black45, fontSize: 14.0),),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(newsarticle.title, 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(newsarticle.descrption, softWrap: true, 
            style: TextStyle(color: Colors.black45, fontSize: 16.0),),
          ),
        ],
      ),
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
