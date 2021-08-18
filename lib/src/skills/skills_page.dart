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
  List<String> _listSkills = [
    "Flutter",
    "Java",
    "PHP",
    "HTML",
    "CSS",
    "Javascript",
    "Python"
  ];
  List<double> _listStars = [3.5, 3, 4, 4, 4, 4.5, 2];
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
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _listSkills.length,
                          itemBuilder: (context, i) => Container(
                            width: 250,
                            color: Colors.red,
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
                                // SizedBox(width: 50),
                                // Spacer(),
                                SmoothStarRating(
                                  rating: _listStars[i],
                                  isReadOnly: true,
                                  size: 25,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_half,
                                  defaultIconData: Icons.star_border,
                                  starCount: 5,
                                  color: Colors.red[200],
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
