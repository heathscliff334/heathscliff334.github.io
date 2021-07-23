import 'package:flutter/material.dart';

class ProjectsPage extends StatefulWidget {
  // const ProjectsPage({ Key? key }) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Center(
              child: Text(
            "Projects Page",
            style: TextStyle(color: Colors.white),
          ))),
    );
  }
}
