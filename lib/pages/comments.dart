import 'package:twitter/variables.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as Tago;

class CommentsPage extends StatefulWidget {
   String id;
   String username;
   String profilepic;
   String uid;
  @override




  _CommentsPageState createState() => _CommentsPageState();

   CommentsPage();
}

class _CommentsPageState extends State<CommentsPage> {
  TextEditingController commentcontroller = TextEditingController();
  savecomment() async {
    /*
    DocumentSnapshot document = await tweetcollection.doc(widget.id).get();
    var documents =
        await tweetcollection.doc(widget.id).collection('comments').get();
    var length = documents.docs.length;
    tweetcollection
        .doc(widget.id)
        .collection('comments')
        .doc('Comment $length')
        .set({
      'username': widget.username,
      'uid': widget.uid,
      'profilepic': widget.profilepic,
      'time': DateTime.now(),
      'id': 'Comment $length',
      'comment': commentcontroller.text
    });
    tweetcollection
        .doc(widget.id)
        .update({'commentcount': document.data()['commentcount'] + 1});
    commentcontroller.clear();*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: StreamBuilder(
                      builder: (BuildContext context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/71139790?s=96&v=4'),
                                ),
                                title: Row(
                                  children: <Widget>[
                                    Text('username',
                                      style: mystyle(
                                          20, Colors.black, FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text('comment',
                                      style: mystyle(
                                          20, Colors.black, FontWeight.w500),
                                    )
                                  ],
                                ),
                                subtitle: Text("time")
                              );
                            });
                      }),
                ),
                Divider(),
                ListTile(
                  title: TextFormField(
                    controller: commentcontroller,
                    decoration: InputDecoration(
                      labelText: 'Comment..',
                      labelStyle: mystyle(20, Colors.black, FontWeight.w700),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  trailing: OutlineButton(
                    onPressed: () => savecomment(),
                    borderSide: BorderSide.none,
                    child: Text(
                      "Publish",
                      style: mystyle(16),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
