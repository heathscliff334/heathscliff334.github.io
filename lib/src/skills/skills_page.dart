import 'package:flutter/material.dart';

class SkillsPage extends StatefulWidget {
  // const SkillsPage({ Key? key }) : super(key: key);

  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Center(child: Text("Skills Page")),
      ),
    );
  }
}
