import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/src/widgets/item_divider_widget.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SkillsPage extends StatefulWidget {
  // const SkillsPage({ Key? key }) : super(key: key);

  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  bool isLandscape;
  double dynHeight, dynWidth;
  List<String> _listLanguages = [
    "Indonesia",
    "English",
    "Japanese",
  ];
  List<double> _listStarsLanguages = [5, 3, 2.5];
  List<String> _listSkills = [
    "Flutter",
    "Java",
    "PHP",
    "CodeIgniter",
    "HTML",
    "CSS",
    "Javascript",
  ];
  List<String> _listSkills2 = [
    "Python",
    "SQL Server",
    "MySQL",
    "Linux",
    "Back-End",
    "Mobile Dev",
    "REST API"
  ];
  List<double> _listStars = [3.5, 3, 4, 3.5, 4, 4, 4.5];
  List<double> _listStars2 = [2, 4, 4, 3, 3, 3.5, 3.5];
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
        dynHeight = MediaQuery.of(context).size.height / 1.5;
        dynWidth = MediaQuery.of(context).size.width / 1.7;
      } else {
        dynHeight = MediaQuery.of(context).size.height / 1.2;
        dynWidth = MediaQuery.of(context).size.width / 1.3;
      }
    });
    return Scaffold(
      body: Container(
        // child: Center(child: Text("Skills Page")),
        child: Center(
          child: Container(
            height: dynHeight,
            width: dynWidth,
            child: Stack(
              children: [
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Skills",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'Nasalization',
                        ),
                      ),
                      ItemDividerWidget(marginBtm: 10),
                      Row(
                        children: [
                          Expanded(
                            // width: (isLandscape == true) ? dynWidth / 2 : dynWidth,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _listSkills.length,
                              itemBuilder: (context, i) => Container(
                                // color: Colors.red,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${_listSkills[i]}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Spacer(),
                                    SmoothStarRating(
                                      rating: _listStars[i],
                                      isReadOnly: true,
                                      size: 25,
                                      filledIconData: Icons.star,
                                      halfFilledIconData: Icons.star_half,
                                      defaultIconData: Icons.star_border,
                                      starCount: 5,
                                      color: Colors.yellow,
                                      borderColor: Colors.red[200],
                                      allowHalfRating: true,
                                      spacing: 2.0,
                                      // onRated: (value) {
                                      //   print("rating value -> $value");
                                      //   // print("rating value dd -> ${value.truncate()}");
                                      // },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 150),
                          Expanded(
                            // width: (isLandscape == true) ? dynWidth / 2 : dynWidth,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _listSkills2.length,
                              itemBuilder: (context, i) => Container(
                                // color: Colors.red,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${_listSkills2[i]}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Spacer(),
                                    SmoothStarRating(
                                      rating: _listStars2[i],
                                      isReadOnly: true,
                                      size: 25,
                                      filledIconData: Icons.star,
                                      halfFilledIconData: Icons.star_half,
                                      defaultIconData: Icons.star_border,
                                      starCount: 5,
                                      color: Colors.yellow,
                                      borderColor: Colors.red[200],
                                      allowHalfRating: true,
                                      spacing: 2.0,
                                      // onRated: (value) {
                                      //   print("rating value -> $value");
                                      //   // print("rating value dd -> ${value.truncate()}");
                                      // },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Languages",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'Nasalization',
                        ),
                      ),
                      ItemDividerWidget(marginBtm: 10),
                      Container(
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: _listLanguages.length,
                            itemBuilder: (context, i) => Container(
                              width: dynWidth / 3,
                              // color: Colors.red,
                              child: Center(
                                child: Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceEvenly,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${_listLanguages[i]}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    // Spacer(),
                                    SmoothStarRating(
                                      rating: _listStarsLanguages[i],
                                      isReadOnly: true,
                                      size: 25,
                                      filledIconData: Icons.star,
                                      halfFilledIconData: Icons.star_half,
                                      defaultIconData: Icons.star_border,
                                      starCount: 5,
                                      color: Colors.yellow,
                                      borderColor: Colors.red[200],
                                      allowHalfRating: true,
                                      spacing: 2.0,
                                      // onRated: (value) {
                                      //   print("rating value -> $value");
                                      //   // print("rating value dd -> ${value.truncate()}");
                                      // },
                                    ),
                                    // SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
