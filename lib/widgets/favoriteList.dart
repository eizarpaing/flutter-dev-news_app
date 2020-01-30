import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:networking_demo/models/newsArticle.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:networking_demo/utils/constants.dart';
import 'package:networking_demo/widgets/detail_page.dart';

const color1 = const Color(0xff043361); 

class FavoriteList extends StatelessWidget {
  final List<NewsArticle> savedNewsArticle;
  const FavoriteList({Key key, this.savedNewsArticle}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite List"),
        backgroundColor: color1,
      ),
      body: ModalProgressHUD(
      child: ListView.builder(
        itemCount: savedNewsArticle.length,
        itemBuilder: _cardItem,
      ),
      inAsyncCall: false,
      color: Colors.white,
      progressIndicator:
          CircularProgressIndicator(backgroundColor: Colors.amber, valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff043361)),),
    ));
  }

  Widget _cardItem(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: Color(0xffDDECEF),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: savedNewsArticle[index].urlToImage == null
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
                        savedNewsArticle[index].urlToImage,
                        width: 100,
                        height: 100,
                      ),
                    ),
            ),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(savedNewsArticle[index].title),
                ))
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailPage(newsarticle: savedNewsArticle[index])));
      },
    );
  }
}