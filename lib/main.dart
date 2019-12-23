import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking_demo/widgets/newsList.dart';

void main() => runApp(TabbedAppBarSample());


// class App extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Networking",
//       home: NewsList()
//     );
//   }
// }

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Watch News'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
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
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    Widget child;
    if(choice.title == 'News') {
      child = NewsList();
    }else {
      child = NewsList();
      // child = Center(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       Icon(choice.icon, size: 128.0, color: textStyle.color),
      //       Text(choice.title, style: textStyle),
      //     ],
      //   ),
      // );
    }
    return Card(
      color: Colors.white,
      child: child,
    );
  }
}
