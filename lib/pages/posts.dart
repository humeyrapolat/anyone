import 'package:flutter/material.dart';
import 'package:twitter/pages/addtweet.dart';
import '../utils/variables.dart';
import 'comments.dart';
import 'floating.dart';

class PostsPage extends StatefulWidget {

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
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
                  //Image.asset('images/anonymous_mask.png')
                  image: AssetImage('images/anonymous_mask.png'))
            ],
          ),
        ),
        body: StreamBuilder(
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                          NetworkImage('https://static.wikia.nocookie.net/friends/images/8/8a/Rachel-Season-8.png/revision/latest?cb=20180127172005'),
                        ),
                        title: Text('rachel',
                          style: mystyle(20, Colors.black, FontWeight.w600),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (true)
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('look at this cute kitten',
                                  style: mystyle(
                                      16, Colors.black, FontWeight.w500),
                                ),
                              ),
                            if (true)
                              Image(
                                  image:
                                  NetworkImage('https://static.vets-now.com/uploads/2017/01/Common-emergencies-in-kittens-Vets-Now.jpg')),

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
                                              builder: (context) =>CommentsPage()
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
                                    Text('0',
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
