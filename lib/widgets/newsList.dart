import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:networking_demo/models/newsArticle.dart';
import 'package:networking_demo/services/webservice.dart';
import 'package:networking_demo/utils/constants.dart';
import 'package:networking_demo/widgets/detail_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class NewsListState extends State<NewsList> {
  List<NewsArticle> _newsArticles = List<NewsArticle>();
  Set<NewsArticle> _savedArticles = Set<NewsArticle>();
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _saving = true;
    });
    _populateNewsArticles();
  }

  void _populateNewsArticles() {
    Webservice().load(NewsArticle.all).then((newsArticles) => {
          setState(() {
            _saving = false;
            _newsArticles = newsArticles;
          })
        });
  }

  Widget _cardItem(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: Color(0xffDDECEF),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: _newsArticles[index].urlToImage == null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Image.asset(
                        Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL,
                        width: 100,
                        height: 100,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Image.network(
                        _newsArticles[index].urlToImage,
                        width: 100,
                        height: 100,
                      ),
                    ),
            ),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_newsArticles[index].title),
                )),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: new Icon(
                  isSaved(_newsArticles[index]) ? Icons.favorite : Icons.favorite_border,
                  color: Color(0xff336699),
                ),
                onPressed: () {
                  setState(() {
                    pressedFavorite(_newsArticles[index]);
                  });
                },
                
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailPage(newsarticle: _newsArticles[index])));
      },
    );
  }

  void pressedFavorite(NewsArticle index) {
    if(isSaved(index))
     _savedArticles.remove(index);
    else
      _savedArticles.add(index);
  }

  bool isSaved(NewsArticle index){
    return _savedArticles.contains(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(Icons.favorite,
          color: Colors.white,
        ),
      ),
        backgroundColor: Color(0xff336699),
        onPressed: _pushSaved,
      ),
        body: ModalProgressHUD(
      child: ListView.builder(
        itemCount: _newsArticles.length,
        itemBuilder: _cardItem,
      ),
      inAsyncCall: _saving,
      color: Colors.white,
      progressIndicator:
          CircularProgressIndicator(backgroundColor: Colors.amber, valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff043361)),),
    ));
  }

  void _pushSaved() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context){
            final Iterable<ListTile> tiles = _savedArticles.map(
              (NewsArticle pair) {
                return ListTile (
                  title: Text(
                    pair.title,
                    style: _biggerFont,
                  ),
                );
              }
            );
            final List<Widget> divided = ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ).toList();
            return Scaffold(
              appBar: AppBar(
                title: Text('Saved Suggestions'),
              ),
              body: ListView(children: divided)
            );
          },
        ),
      );
    }
}

class NewsList extends StatefulWidget {
  @override
  createState() => NewsListState();
}
