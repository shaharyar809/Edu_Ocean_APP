import 'package:edu_ocean/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Data {
  String Name;
  String NameA;
  String Education;
  String EducationA;
  String Location;
  String Id;
  String Logo;

  Data({
    this.Id,
    this.Name,
    this.NameA,
    this.Education,
    this.EducationA,
    this.Location,
    this.Logo,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        Name: json['name'],
        NameA: json['namea'],
        Education: json['education'],
        EducationA: json['educationa'],
        Location: json['location'],
        Id: json['id'],
        Logo: json['logo']);
  }
}

class resultpage extends StatefulWidget {
  @override
  _resultpageState createState() => _resultpageState();
}

class _resultpageState extends State<resultpage> {
  TextEditingController searchtext = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchtext = new TextEditingController(text: Get.arguments.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: //Center(
          /*child:*/ Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                      //size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
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
                  enabled: false,
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
                    disabledBorder: OutlineInputBorder(
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
              datashow(),
            ],
          //),
          ),

      ),
    );
  }
}

class datashow extends StatefulWidget {
  @override
  _datashowState createState() => _datashowState();
}

class _datashowState extends State<datashow> {
  final String URL = '';

  Future<List<Data>> fetchdata() async {
    var data = {'searchtext': Get.arguments.toString()};
    //print(Get.arguments.toString());
    //var response = await http.get(URL);
    var response = await http.post(URL, body: json.encode(data));
    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Data> dataList = items.map<Data>((json) {
        return Data.fromJson(json);
      }).toList();
      return dataList;
    } else {
      throw Exception('Failed to load data from Server.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Data>>(
      future: fetchdata(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );

        return Expanded(
          child: ListView(
              children: snapshot.data
                  .map(
                    (data) => GFListTile(
                      onTap: () {
                        Get.to(detail_page(), arguments: data.Id);
                      },
                      color: Colors.blue,
                      //padding: EdgeInsets.all(6),
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      avatar: GFAvatar(
                        backgroundImage: NetworkImage(data.Logo),
                        shape: GFAvatarShape.circle,
                        size: GFSize.LARGE,
                      ),
                      title: Text(
                        data.Education/*+" ("+data.EducationA+")"*/,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        data.Name/*+" ("+data.NameA+")"*/,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      description: Text(
                        data.Location+" / Karachi / Sindh / Pakistan",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  )
                  .toList(),
            ),
        );
      },
    );
  }
}
