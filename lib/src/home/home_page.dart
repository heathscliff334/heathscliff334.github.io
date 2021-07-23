import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web/src/projects/projects_page.dart';
import 'package:flutter_web/src/skills/skills_page.dart';
import 'package:flutter_web/src/widgets/item_divider_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.2,
          width: MediaQuery.of(context).size.width / 1.3,
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
              Flexible(
                // Container(
                // height: 30,
                child: Text(
                  "Kevin Laurence Hartono",
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
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10),
              ItemDividerWidget(marginBtm: 10),
              Container(
                height: MediaQuery.of(context).size.height / 9,
                child: SingleChildScrollView(
                  child: Text(
                    "Experienced IT Staff with a demonstrated history of working in the retail industry. Skilled in Full Stack, Mobile Development (Flutter & Java), Web Development, and Computer Networking. Strong professional with a Bachelor's degree focused in Information Technology from Bunda Mulia University.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
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
                  Flexible(
                    child: SosmedButton(
                      url: "https://github.com/heathscliff334",
                      imgUrl:
                          "https://cdn.pixabay.com/photo/2016/01/26/17/15/gmail-1162901_640.png",
                    ),
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
