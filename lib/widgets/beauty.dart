import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:networking_demo/models/newsArticle.dart';
import 'package:networking_demo/services/webservice.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:networking_demo/utils/constants.dart';

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
          return Card(
            color: Color(0xffDDECEF),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _beautyArticles[index].urlToImage == null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Image.asset(
                            Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Image.network(
                            _beautyArticles[index].urlToImage,
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_beautyArticles[index].title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                )
              ],
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

/*return new Container(
            child: new Card(
              elevation: 5,
              child: new Column(
                children: <Widget>[
                  new Hero(
                    tag: _beautyArticles[index].title,
                    child: new Material(
                      child: new InkWell(
                        // onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                        //     builder: (BuildContext context)=> new Detail(name: jdata["name"], image: jdata["image"],)
                        // )),
                        child: _beautyArticles[index].urlToImage == null
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Image.asset(
                                  Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Image.network(
                                  _beautyArticles[index].urlToImage,
                                ),
                              ),
                      ),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),
                  new Text(
                    _beautyArticles[index].title,
                    style: new TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
          ); */
