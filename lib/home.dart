import 'package:flutter/material.dart';
import 'package:twitter/pages/anonymous.dart';
import 'package:twitter/pages/profile.dart';
import 'package:twitter/pages/search.dart';
import 'package:twitter/pages/posts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List pageoptions = [
    PostsPage(),
    AnonymousPage(),
    SearchPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageoptions[page],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
          selectedItemColor: Colors.lightBlueAccent[200],
          unselectedItemColor: Colors.black12,
          currentIndex: page,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 32,
                ),
                label: "Posts"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                  size: 32,
                ),
                label: "Anonymous"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 32,
                ),
                label:
                "Search"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 32,
                ),
                label: "Profile"),
          ]),
    );
  }
}
