import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:edu_ocean/result.dart';
import 'package:edu_ocean/task.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:get/get.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController searchtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      message: "Press Back Again To Exit...",
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.blue,
                          //size: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          "Karachi / Sindh / Pakistan",
                          style: TextStyle(
                            color: Colors.blue,
                            //fontSize: 20.00,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.00),
                    child: TextField(
                      controller: searchtext,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 36,
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.00,
                        ),
                        filled: true,
                        fillColor: Colors.blue,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.settings,
                            size: 30,
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                          hoverColor: Colors.blue,
                          splashColor: Colors.lightBlue,
                          highlightColor: Colors.blue,
                          height: 60.00,
                          minWidth: 70.00,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(resultpage(), arguments: searchtext.text);
                          },
                          child: Text(
                            "SEARCH",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.00,
                            ),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                          hoverColor: Colors.blue,
                          splashColor: Colors.lightBlue,
                          highlightColor: Colors.blue,
                          height: 60.00,
                          minWidth: 260.00,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,5,0,5),
                    child: task(),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(resultpage(), arguments: "School");
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.house,
                                size: 60,
                              ),
                              Text("School")
                            ],
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                          hoverColor: Colors.blue,
                          splashColor: Colors.lightBlue,
                          highlightColor: Colors.blue,
                          height: 100.00,
                          minWidth: 100.00,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(resultpage(), arguments: "Collage");
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.business_center,
                                size: 60,
                              ),
                              Text("Collage")
                            ],
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                          hoverColor: Colors.blue,
                          splashColor: Colors.lightBlue,
                          highlightColor: Colors.blue,
                          height: 100.00,
                          minWidth: 100.00,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(resultpage(), arguments: "University");
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.school,
                                size: 60,
                              ),
                              Text("University")
                            ],
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                          hoverColor: Colors.blue,
                          splashColor: Colors.lightBlue,
                          highlightColor: Colors.blue,
                          height: 100.00,
                          minWidth: 100.00,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(icon: Icons.settings, title: 'Setting'),
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.group, title: 'About'),
            ],
            initialActiveIndex: 1,
          ),
        ),
      ),
    );
  }
}
