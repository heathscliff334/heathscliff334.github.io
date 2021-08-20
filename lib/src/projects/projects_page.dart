import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatefulWidget {
  // const ProjectsPage({ Key? key }) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  bool isLandscape;
  double dynHeight, dynWidth;
  List myList;
  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;

  @override
  void initState() {
    super.initState();
    myList = List.generate(10, (i) => "item : ${i + 1}");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() {
    print("Load more data");
    for (int i = _currentMax; i < _currentMax + 10; i++) {
      myList.add("item : ${i + 1}");
    }
    _currentMax = _currentMax + 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      // To detect the orientation of the screen (browser) to asign a dynamic height and width
      isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
      print("Landscape Status : $isLandscape");
      if (isLandscape == true) {
        dynHeight = MediaQuery.of(context).size.height / 1.6;
        dynWidth = MediaQuery.of(context).size.width / 1.7;
      } else {
        dynHeight = MediaQuery.of(context).size.height / 1.1;
        dynWidth = MediaQuery.of(context).size.width / 1.1;
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text("ID",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                              Text(" | ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 26)),
                              InkWell(
                                onTap: () {},
                                child: Text("EN",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                            ],
                          ),
                          // child: RichText(
                          //   textAlign: TextAlign.right,
                          //   text: TextSpan(
                          //     text: "ID",
                          //     style:
                          //         TextStyle(color: Colors.white, fontSize: 20),
                          //     children: <TextSpan>[
                          //       TextSpan(
                          //           text: ' | ',
                          //           style: TextStyle(
                          //               color: Colors.white, fontSize: 26)),
                          //       TextSpan(
                          //           text: "EN",
                          //           style: TextStyle(
                          //               color: Colors.white, fontSize: 20)),
                          //     ],
                          //   ),
                          //   // child: Text("ID"),
                          // ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        (isLandscape == true)
                            ?
                            // For browser
                            Expanded(
                                child: ListView.builder(
                                  controller: _scrollController,
                                  // itemExtent: 80,
                                  // +1 to show loading indicator

                                  itemBuilder: (context, i) {
                                    if (i == myList.length) {
                                      return CupertinoActivityIndicator();
                                    }
                                    return Container(
                                      width: double.infinity,
                                      height: dynHeight / 3.3,
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 7),
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                            color: Colors.white24, width: 3),
                                        top: BorderSide(
                                            color: Colors.white24, width: 3),
                                      )),
                                      // child: ListTile(
                                      //   title: Text(
                                      //     myList[i],
                                      //     style: TextStyle(
                                      //         fontWeight: FontWeight.w400,
                                      //         color: Colors.white),
                                      //   ),
                                      // ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Flexible(
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 200,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black38,
                                                          blurRadius: 10,
                                                          spreadRadius: 1,
                                                          offset: Offset(0, 4))
                                                    ],
                                                  ),
                                                  // child: Center(
                                                  //   child: Text(
                                                  //     "Image",
                                                  //     style: TextStyle(
                                                  //         color: Colors.white),
                                                  //   ),
                                                  // ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    child: Image.network(
                                                      "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAHlBMVEX09PTh4eH19fXg4ODk5OTw8PDs7Ozq6uru7u7n5+dZKxXMAAAELUlEQVR4nO2dWXKtMAwFwQMX9r/hB9RNMOARhCTyTv/kIxVQl4kHYZmuAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADgAsZ03o9eA6OfwyH360bXWz30kyd2HHvbq8LaibQdJ2V+C7Yf6RSdQsEZOxApGqWCsyJNK5qPVsEZCsHOS1tksBNFI2rsZTY8gaG0QxaCRjRj0ITS4/wvW0judguaKbjaID1f+xLEZG8/psZtV6OeKF3GbH2DHW9fbDN0WgTn/j0wvBtVYEjSM9MAwxZgKAMMW4ChDLyGxoQ/eGA0NMYPk3O9c9PH80nyGZo1A/e9l3WEiZM8DxmeZm3GH/Ib1jFNXZna0AzntTFZcigPj2E8f2M/HIoshqkEFYsih+Fu7b9XZOhvWNow4bdw85YVMBjmkqg0Kb4sHG2YaUKaFF+W5w3zefDnO5vnR/wwPxXh8YwOw1Oaz4Pbmzct8ryhLxhe+EdsivRxw/RgePW2821a/uZ5w8ILt/auZp7Ct8Qqb9g6/17XKA3BKnhK227yswirjvZtPc22yqwN912jxW6bQGW87xrx93mCuoBfNWs7JkKqIuaYeWcf04brn3ey1ITMsXrK7F9oWD1Ft+pUxPyeFXB8L1I5aJYsRnKbTcM9E5utyleQzUTVz2eSu8mKYb8km5jbLleI+xUZ4cJ+wHzgr8jqFzY85iNnfPe0vJn5uVff8mamuKMzGzrn27Xu9+3a4Bu2JddsWc3Erv4NaeWe3HTw6t9yV246Tkev3bB6V3UyfOWGDdvGU/HrNmzbFx8X0GzYvPE/asA14l+hubIhqqC4DS+UbsQc9Bpeq005S2g1vFx8c7LQani5uuikIWhohnR5wI3yqaOHnOG8ZLQpxVv1YYd1p5jhuiZOKN4sgNsrShl+F/0xxfsVfjtFoRE/yGqcfkdQwhgqyrRhmLY5tiJJjWbwvkfEcJeXOjyoNEWoVrYND4m3UJGqyla2DU+ZxUCRqoxY1DCWOv3pbsjqpCUNo4LfVqQrBBc0jAquioaylF/OMCG4KlKW8j9vmBjxk4LUSLUhm6CUIZ+gkCGjoIwhp6CIIaughCGvoIAhsyC/Ibcg+4jPLsjdhvyCzIYCgryGEoK8hoV93u83lDn+i9VQ4iGFIQwrDN2fN/z7bQhDGMIQhjCEYdnwvxrxPyKnljIadn6QgNOwMxKwGgoDwxZgKAMMW4ChDE/N2kiCoyA4eYTgPO/t/PPluyc6COrICc5kDybZ1jodhPP+u4LFg1qkofjXyR9jIgzFaaKl84Rkoen9FDci1Tmb0h5JqM6gNFo7m2R5zgVFbd8kW5nHZzJOx0MowNqhHHiL4+h2H7ARZvl4HvUHAtfD1yfpycyX6TPSfwCxE8o+JXhADwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAs/ANyGFT0fw3sTAAAAABJRU5ErkJggg==",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Container(
                                                            // width: ,
                                                            // height: 50,
                                                            color: Colors.red,
                                                            child: Text(
                                                              "Title Title Title Title Title Title Title Title ",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 24),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                            )),
                                                      ),
                                                      Expanded(
                                                        flex: 7,
                                                        child: Container(
                                                          color: Colors.blue,
                                                          child: Text(
                                                              "Description Description Description Description Description Description Description Description ",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 5),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: _currentMax + 1,
                                ),
                              )
                            :
                            // For Phone Screen
                            Container(),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
