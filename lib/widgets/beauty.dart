import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/models/newsArticle.dart';
import 'package:news/services/webservice.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:news/utils/constants.dart';
import 'package:news/widgets/detail_page.dart';

class BeaudyListState extends State<BeaudyList> {
  List<NewsArticle> _beautyArticles = List<NewsArticle>();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _saving = true;
      _populateNewsArticles();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _populateNewsArticles() {
    Webservice().load(NewsArticle.all).then((beautyArticles) => {
          setState(() {
            _saving = false;
            _beautyArticles = beautyArticles;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
      child: GridView.builder(
        itemCount: _beautyArticles.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext content, int index) {
          return new GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(newsarticle: _beautyArticles[index])));
            },
            child: Card(
              color: Color(0xffDDECEF),
              elevation: 5,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: _beautyArticles[index].urlToImage == null
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Image.asset(
                              Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL,
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Image.network(
                              _beautyArticles[index].urlToImage,
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _beautyArticles[index].title,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      inAsyncCall: _saving,
      color: Colors.white,
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Colors.amber,
        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff043361)),
      ),
    ));
  }
}

class BeaudyList extends StatefulWidget {
  @override
  createState() => BeaudyListState();
}
