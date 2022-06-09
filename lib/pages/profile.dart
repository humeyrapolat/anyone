import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/pages/nowpage.dart';
import 'package:twitter/user_provider.dart';

import '../user.dart';
import '../utils/variables.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    
    return Scaffold(
        body:  SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.lightBlueAccent]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 6,
                    left: MediaQuery.of(context).size.width / 2 - 64),
                child: CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.white,
                  backgroundImage:
                  NetworkImage('https://static.wikia.nocookie.net/friends/images/8/8a/Rachel-Season-8.png/revision/latest?cb=20180127172005'),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.7),
                child: Column(
                  children: [
                    Text('rachel',
                      style: mystyle(30, Colors.black, FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Following",
                          style:
                          mystyle(20, Colors.black, FontWeight.w600),
                        ),
                        Text(
                          "Followers",
                          style:
                          mystyle(20, Colors.black, FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "150",
                          style:
                          mystyle(20, Colors.black, FontWeight.w600),
                        ),
                        Text(
                          "240",
                          style:
                          mystyle(20, Colors.black, FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [Colors.blue, Colors.lightBlue])),
                        child: Center(
                          child: Text(
                            "Edit Profile",
                            style: mystyle(
                                25, Colors.white, FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "User Tweets",
                      style: mystyle(25, Colors.black, FontWeight.w700),
                    ),
                    StreamBuilder(
                        builder: (context, snapshot) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage:
                                      NetworkImage('https://static.wikia.nocookie.net/friends/images/8/8a/Rachel-Season-8.png/revision/latest?cb=20180127172005'),
                                    ),
                                    title: Text(
                                      'rachel',
                                      style: mystyle(20, Colors.black,
                                          FontWeight.w600),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        if (true)
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            child: Text(
                                              'poor cat',
                                              style: mystyle(
                                                  20,
                                                  Colors.black,
                                                  FontWeight.w400),
                                            ),
                                          ),
                                        if (true)
                                          Image(
                                              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRreij33dOiJacp9pv3DaPRzpJ-kOzRvnUHDnUA_SlJ6eqioAs-i4Drl1JT1esbPEwm1_k&usqp=CAU')),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SearchDetailPage()
                                                      )
                                                  ),
                                                  child:
                                                  Icon(Icons.comment),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text(
                                                  '1',
                                                  style: mystyle(18),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  child:  Icon(
                                                    Icons.favorite,
                                                    color:
                                                    Colors.red,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text('1',
                                                  style: mystyle(18),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  child:
                                                  Icon(Icons.share),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text('1',
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
                        })
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.7),
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text("Logout"),
                      color: Colors.lightBlueAccent,
                    )
                  ],
                )

              )
            ],
          ),
        )
    );
  }
}
