import 'package:flutter/material.dart';

void main() {
  runApp(new Home());
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Navigation Basics',
//      home: Routes.routes(context),
       initialRoute: '/login',
       routes: {
          '/':(context) => FirstRoute(),
          '/home': (context) => SecondRoute(),
        }
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go Next'),
          onPressed: () {
//            Navigator.pushNamed(context, '/home');
            Navigator.push(context,
              SlideRightRoute(page: SecondRoute()));
//            );
          },
        ),
      ),
    );
  }
}

//class Routes extends StatelessWidget{
//  String initialRoute = "/login";
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp
//      (
//      routes: routes(context),
//    );
//  }
//  static routes(BuildContext context){
//    return <String,WidgetBuilder>{
//      '/login':(context) => FirstRoute(),
//      '/home': (context) => SecondRoute(),
//    };
//  }
//
//}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        //leading: Container(),
      ),
      body: Center(

        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(onPressed: () {
                Navigator.pop(context);
              },
                child: Text('Go back 1st Screen!'),
              ),
              RaisedButton(onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThirdRoute()),
                );
              },
                child: Text('Go 3rd Screen!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
        leading: Container(),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: () {
              Navigator.pop(context);

            },
              child: Text('Go back 2nd Screen!'),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}