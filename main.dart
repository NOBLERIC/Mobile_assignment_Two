// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'welcome.dart';

void main() => runApp(CurrencyConverter());

class CurrencyConverter extends StatelessWidget {
  CurrencyConverter({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Convert',
      icon: Icon(
        Icons.currency_exchange_rounded,
        color: Colors.white,
      ),
    ),
    Tab(
      text: 'Trends',
      icon: Icon(
        Icons.trending_down_sharp,
        color: Colors.white,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: myTabs.length,
          child: Scaffold(
              appBar: AppBar(
                title: Text('Currency Converter',
                    style: TextStyle(color: Colors.white)),
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Colors.blueGrey[900],
                bottom: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor:
                  const Color.fromARGB(255, 182, 182, 182),
                  tabs: myTabs,
                ),

              ),

              drawer: Drawer(
                  child: ListView(children: [
                    DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blueGrey[900]),
                      child: Column(),
                    ),
                    ListTile(
                      leading: Icon(Icons.home_max_outlined),
                      title: Text('Home'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/homePage');
                      },
                    ),
                    ListTile(
                        leading: Icon(Icons.currency_exchange_outlined),
                        title: Text('Convert'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/convertPage');
                        }),
                  ])),
              body: TabBarView(
                children: [
                  Center(child: Text('Convert Currency here!')),
                  Center(child: Text('The Trends Page'))
                ],
              ))),
      routes: {
        '/homePage': (context) => HomePage(),
        '/convertPage': (context) => CurrencyConverter()
      },
    );
  }
}