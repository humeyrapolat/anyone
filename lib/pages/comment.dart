import 'package:flutter/material.dart';
import 'package:twitter/utils/variables.dart';
import 'package:timeago/timeago.dart' as tAgo;

class CommentPage extends StatefulWidget {

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  var commentcontroller = TextEditingController();

  addcoment() async {
    /*
    var firebaseuser = FirebaseAuth.instance.currentUser;
    DocumentSnapshot userdoc = await usercollection.doc(firebaseuser.uid).get();
    tweetcollection.doc(widget.documentid).collection('comments').doc().set({
      'comment': commentcontroller.text,
      'username': userdoc.data()['username'],
      'uid': userdoc.data()['uid'],
      'profilepic': userdoc.data()['profilepic'],
      'time': DateTime.now()
    });
    DocumentSnapshot commentcount =
        await tweetcollection.doc(widget.documentid).get();

    tweetcollection
        .doc(widget.documentid)
        .update({'commentcount': commentcount.data()['commentcount'] + 1});
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
            children: [
              Expanded(
                child: StreamBuilder(
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/71139790?s=96&v=4'),
                            ),
                            title: Row(
                              children: [
                                Text('username',
                                  style: mystyle(20),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text('comment',
                                  style:
                                      mystyle(20, Colors.grey, FontWeight.w500),
                                ),
                              ],
                            ),
                            subtitle: Text('time',
                              style: mystyle(15),
                            ),
                          );
                        });
                  },
                ),
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  controller: commentcontroller,
                  decoration: InputDecoration(
                    hintText: "Add a comment..",
                    hintStyle: mystyle(18),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                trailing: OutlineButton(
                  onPressed: () => addcoment(),
                  borderSide: BorderSide.none,
                  child: Text(
                    "Publish",
                    style: mystyle(16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


