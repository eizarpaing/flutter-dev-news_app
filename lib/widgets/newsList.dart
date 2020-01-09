
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:networking_demo/models/newsArticle.dart';
import 'package:networking_demo/services/webservice.dart';
import 'package:networking_demo/utils/constants.dart';
import 'package:networking_demo/widgets/detail_page.dart';

class NewsListState extends State<NewsList> {

  List<NewsArticle> _newsArticles = List<NewsArticle>(); 

  @override
  void initState() {
    super.initState();
    _populateNewsArticles(); 
  }

  void _populateNewsArticles() {
   
    Webservice().load(NewsArticle.all).then((newsArticles) => {
      setState(() => {
        _newsArticles = newsArticles
      })
    });

  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
      return ListTile(
        leading: SizedBox(
          height: 100.0,
          width: 100.0, 
          child: _newsArticles[index].urlToImage == null ? Image.asset(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL) : Image.network(_newsArticles[index].urlToImage),
        ),
        title: Text(_newsArticles[index].title),
        trailing: Icon(Icons.favorite),
        // title: _newsArticles[index].urlToImage == null ? Image.asset(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL) : Image.network(_newsArticles[index].urlToImage), 
        // subtitle: Text(_newsArticles[index].title, style: TextStyle(fontSize: 18)),
        //onTap: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text(index.toString()))),
        onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(newsarticle: _newsArticles[index])));
          },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('News'),
        // ),
        body: ListView.builder(
          itemCount: _newsArticles.length,
          itemBuilder: _buildItemsForListView,
        ),
    );
      //   body: ListView.builder(
      //     itemCount: _newsArticles.length,
      //     itemBuilder: _buildItemsForListView,
      //   )
      // );
  }
}

class NewsList extends StatefulWidget {

  @override
  createState() => NewsListState(); 
}