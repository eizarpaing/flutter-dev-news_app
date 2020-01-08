import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking_demo/widgets/newsList.dart';

void main() => runApp(TabbedAppBarSample());
const color1 = const Color(0xff336699);
const color2 = const Color(0xff666666);

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Watch News', style: TextStyle(color: Colors.white),),
            backgroundColor: color1,
            elevation: 10,
            bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              isScrollable: true, 
              tabs: [
              tabitem("News"),
              tabitem("Sport"),
              tabitem("Transport"),
              tabitem("Food"),
              tabitem("Health"),
              tabitem("Beauty")
            ]),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
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
      height: 80,
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
  const Choice(title: 'News', icon: Icons.book),
  const Choice(title: 'Sport', icon: Icons.directions_bike),
  const Choice(title: 'Transport', icon: Icons.directions_railway),
  const Choice(title: 'Food', icon: Icons.cake),
  const Choice(title: 'Health', icon: Icons.directions_walk),
  const Choice(title: 'Beauty', icon: Icons.camera),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (choice.title == 'News') {
      child = NewsList();
    } else {
      child = NewsList();
    }
    return Card(
      color: Colors.white,
      child: child,
    );
  }
}
