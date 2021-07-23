import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class App extends StatefulWidget {
  // const App({ Key? key }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          // color: Colors.blue,
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              // color: Colors.blue,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.grey[200],
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF3366FF),
                    const Color(0xFFC300FF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(100)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: NetworkImage(
                            "https://media-exp1.licdn.com/dms/image/C5103AQHjVhRuL3yXgw/profile-displayphoto-shrink_200_200/0/1544581409377?e=1628121600&v=beta&t=uNMH8sY46Kr-I8DWJydT-HkWjdKNsMCxHA32vzMFiiU"),
                        fit: BoxFit.cover,
                        key: ValueKey(new Random().nextInt(100)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 30,
                    child: Text(
                      "Kevin Laurence Hartono",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                        // fontFamily: 'Chocolate Cookies',
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    child: Text(
                      "Programmer. Full Stack. Back-End.",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 10),
                  ItemDivider(marginBtm: 10),
                  Container(
                    child: Text(
                      "Experienced IT Staff with a demonstrated history of working in the retail industry. Skilled in Full Stack, Mobile Development (Flutter & Java), Web Development, and Computer Networking. Strong professional with a Bachelor's degree focused in Information Technology from Bunda Mulia University.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ItemDivider(marginBtm: 10),
                  Container(
                    child: Text(
                      "Interests: Programming, Travelling, Movie, Music",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ItemDivider(marginBtm: 10),
                  Flexible(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SosmedButton(
                          url: "https://github.com/heathscliff334",
                          imgUrl:
                              "https://image.flaticon.com/icons/png/512/25/25231.png",
                        ),
                        SosmedButton(
                          url: "https://github.com/heathscliff334",
                          imgUrl:
                              "https://image.flaticon.com/icons/png/512/174/174857.png",
                        ),
                        SosmedButton(
                          url: "https://github.com/heathscliff334",
                          imgUrl:
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/1024px-Instagram_icon.png",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SosmedButton extends StatelessWidget {
  const SosmedButton({Key key, @required this.url, @required this.imgUrl})
      : super(key: key);
  final String url;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () async {
          print("Pressed!");
          if (await canLaunch(url)) {
            await launch(url, forceSafariVC: false);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(100)),
          child: Image(
            image: NetworkImage(imgUrl),
            // width: 50,
            // color: Colors.black,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ItemDivider extends StatelessWidget {
  const ItemDivider({Key key, @required this.marginBtm}) : super(key: key);
  final double marginBtm;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginBtm),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.white, width: 3))),
    );
  }
}
