import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web/src/projects/projects_page.dart';
import 'package:flutter_web/src/skills/skills_page.dart';
import 'package:flutter_web/src/widgets/item_divider_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLandscape;
  double dynHeight, dynWidth;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      // To detect the orientation of the screen (browser) to asign a dynamic height and width
      isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
      print("Landscape Status : $isLandscape");
      if (isLandscape == true) {
        dynHeight = MediaQuery.of(context).size.height / 1.3;
        dynWidth = MediaQuery.of(context).size.width / 1.7;
      } else {
        dynHeight = MediaQuery.of(context).size.height / 1.1;
        dynWidth = MediaQuery.of(context).size.width / 1.1;
      }
    });
    return Container(
      // color: Colors.blue,
      child: Center(
        child: Container(
          height: dynHeight,
          width: dynWidth,
          // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(20),
          //   gradient: LinearGradient(
          //     colors: [
          //       const Color(0xFF3366FF),
          //       const Color(0xFFC300FF),
          //     ],
          //     begin: const FractionalOffset(0.0, 0.0),
          //     end: const FractionalOffset(1.0, 0.0),
          //     stops: [0.0, 1.0],
          //     tileMode: TileMode.clamp,
          //   ),
          // ),
          child: Stack(
            children: [
              // Background color
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
              ),
              // Container(
              //   child: new Image.network(
              //     "https://freepikpsd.com/media/2019/11/Waves-Border-Vector-PNG.png",
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                padding:
                    EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: Color(0xFFC300FF),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 120,
                            padding: EdgeInsets.all(3),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image(
                                image: NetworkImage(
                                    "https://media-exp1.licdn.com/dms/image/C5103AQHjVhRuL3yXgw/profile-displayphoto-shrink_200_200/0/1544581409377?e=1634169600&v=beta&t=2263Q7fDKZM_0dbwyLDtLz5Cbz8cpq_nqkm_Hvzne6I"),
                                fit: BoxFit.cover,
                                key: ValueKey(new Random().nextInt(100)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      // Container(
                      // height: 30,
                      child: Text(
                        "Kevin Laurence Hartono", textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'Nasalization',
                        ),
                        // overflow: TextOverflow.ellipsis,
                        // maxLines: 1,
                      ),
                    ),
                    Container(
                      height: 20,
                      child: Text(
                        "Programmer. Full Stack. Back-End.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 10),
                    ItemDividerWidget(marginBtm: 10),
                    Container(
                      // height: MediaQuery.of(context).size.height / 9,
                      height: (isLandscape == true)
                          ? dynHeight / 8
                          : dynHeight / 4.5,
                      child: SingleChildScrollView(
                        child: Text(
                          "Experienced IT Staff with a demonstrated history of working in the retail industry. Skilled in Full Stack, Mobile Development (Flutter & Java), Web Development, and Computer Networking. Strong professional with a Bachelor's degree focused in Information Technology from Bunda Mulia University.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    ItemDividerWidget(marginBtm: 10),
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
                    ItemDividerWidget(marginBtm: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SosmedButton(
                          url: "https://github.com/heathscliff334",
                          imgUrl:
                              "https://image.flaticon.com/icons/png/512/25/25231.png",
                        ),
                        SizedBox(width: 10),
                        SosmedButton(
                          url:
                              "https://www.linkedin.com/in/kevin-laurence-hartono-6a61bb113/",
                          imgUrl:
                              "https://image.flaticon.com/icons/png/512/174/174857.png",
                        ),
                        SizedBox(width: 10),
                        SosmedButton(
                          url: "https://www.instagram.com/vinz_lrn/",
                          imgUrl:
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/1024px-Instagram_icon.png",
                        ),
                        SizedBox(width: 10),
                        SosmedButton(
                          url: "https://github.com/heathscliff334",
                          imgUrl:
                              "https://cdn.pixabay.com/photo/2016/01/26/17/15/gmail-1162901_640.png",
                        ),
                      ],
                    ),
                    ItemDividerWidget(marginBtm: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NavButton(btnTitle: "Projects", navRoute: "projects"),
                        SizedBox(width: 10),
                        NavButton(btnTitle: "Skills", navRoute: "skills"),
                        // NavButton(btnTitle: "Projects", navRoute: ""),
                      ],
                    ),
                    // Spacer(),
                    SizedBox(height: 25),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      // color: Colors.red,
                      width: dynWidth,
                      height: 20,
                      child: Center(
                          child: Text(
                        "2021 \u00a9 Kevin Laurence. Powered by Flutter",
                        style: TextStyle(color: Colors.white70),
                      )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton({Key key, @required this.btnTitle, @required this.navRoute})
      : super(key: key);
  final String btnTitle;
  final String navRoute;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(32.0),
      shadowColor: Colors.black,
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              const Color(0xFFC300FF),
              const Color(0xFF3366FF),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: FlatButton(
          onPressed: () {
            switch (navRoute) {
              case "projects":
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProjectsPage()));
                break;
              case "skills":
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SkillsPage()));
                break;
              default:
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Error"),
                          content: Text("Page doesn't exist!"),
                        ));
                break;
            }
          },
          child: Text(
            btnTitle,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
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
          height: 35,
          width: 35,
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
