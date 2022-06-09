import 'package:flutter/material.dart';
import 'package:twitter/pages/comment.dart';
import 'package:twitter/pages/floating.dart';

import 'addtweet.dart';
import '../utils/variables.dart';
import 'nowpage.dart';

class AnonymousPage extends StatefulWidget {

  @override
  State<AnonymousPage> createState() => _AnonymousPageState();
}

class _AnonymousPageState extends State<AnonymousPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTweet())),
          child: Icon(Icons.add, size: 32),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Posts',
                style: mystyle(20, Colors.white, FontWeight.w700),
              ),
              SizedBox(
                width: 5.0,
              ),
              Image(
                  width: 30,
                  height: 30,
                  image: AssetImage('images/anonymous_mask.png'))
            ],
          ),
        ),
        body: StreamBuilder(
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text('anonymous',textAlign: TextAlign.center,
                          style: mystyle(20, Colors.black, FontWeight.w600),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (true)
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('this is my first secret text ',
                                  style: mystyle(
                                      16, Colors.black, FontWeight.w500),
                                ),
                              ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>CommentPage()
                                          )
                                      ),
                                      child: Icon(Icons.comment),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text('5',
                                      style: mystyle(18),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text('100',
                                      style: mystyle(18),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}





