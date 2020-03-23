import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/widgets/menu.dart';
import 'package:news/widgets/newsList.dart';

import 'widgets/beauty.dart';

void main() => runApp(TabbedAppBarSample());
const color1 = const Color(0xff043361); //336699
const color2 = const Color(0xff666666);

class TabbedAppBarSample extends StatefulWidget {
  @override
  _TabbedAppBarSampleState createState() => _TabbedAppBarSampleState();
}

class _TabbedAppBarSampleState extends State<TabbedAppBarSample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int itemIndex = 0;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: choices.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Watch News',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                ),
                onPressed: () {},
              )
            ],
            backgroundColor: color1,
            elevation: 10,
            bottom: TabBar(
                controller: _tabController,
                labelColor: Colors.amber,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                isScrollable: true,
                tabs: [
                  tabitem("COVID-19"),
                  tabitem("Local"),
                  tabitem("Social Life"),
                  tabitem("Sports"),
                  tabitem("Health"),
                  tabitem("Beauty"),
                  tabitem("Tech"),
                  tabitem("Joke"),
                  tabitem("Crime"),
                  tabitem("Food"),
                  tabitem("Travel")
                ]),
          ),
          body: TabBarView(
            controller: _tabController,
            children: choices.map((Choice choice) {
              //   setState(() {
              //     var itemIndex = choices.indexOf(choice);
              //  var selectedIndex = _tabController.index;

              //   });

              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

Tab tabitem(String text) {
  return Tab(
    child: Container(
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white, width: 1)),
      child: Align(
        alignment: Alignment.center,
        child: Text(text),
      ),
    ),
  );
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'COVID-19', icon: Icons.book),
  const Choice(title: 'Local', icon: Icons.directions_bike),
  const Choice(title: 'Socal Life', icon: Icons.directions_railway),
  const Choice(title: 'Sports', icon: Icons.cake),
  const Choice(title: 'Health', icon: Icons.directions_walk),
  const Choice(title: 'Beauty', icon: Icons.camera),
  const Choice(title: 'Tech', icon: Icons.book),
  const Choice(title: 'Joke', icon: Icons.directions_bike),
  const Choice(title: 'Crime', icon: Icons.directions_railway),
  const Choice(title: 'Food', icon: Icons.cake),
  const Choice(title: 'Travel', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (choice.title == 'News') {
      child = NewsList();
    } else if (choice.title == 'Sport') {
      child = BeaudyList();
    } else {
      child = NewsList();
    }
    return Container(
      child: child,
    );
  }
}
