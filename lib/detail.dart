import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Data{
  String Id;
  String Logo;
  String Background;
  String Education;
  String EducationA;
  String Name;
  String NameA;
  String Location;
  String Admission;
  String Fees;
  String System;
  String Description;
  String Mobile;
  String Email;
  String Website;
  String Address;
  String Latitude;
  String Longitude;

  Data({
    this.Id,
    this.Logo,
    this.Background,
    this.Education,
    this.EducationA,
    this.Name,
    this.NameA,
    this.Location,
    this.Admission,
    this.Fees,
    this.System,
    this.Description,
    this.Mobile,
    this.Email,
    this.Website,
    this.Address,
    this.Latitude,
    this.Longitude,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      Id: json['id'],
      Logo: json['logo'],
      Background: json["background"],
      Education: json['education'],
      EducationA: json['educationa'],
      Name: json['name'],
      NameA: json['namea'],
      Location: json['location'],
      Admission: json['addmission'],
      Fees: json['fees'],
      System: json['system'],
      Description: json['description'],
      Mobile: json['mobile'],
      Email: json['email'],
      Website: json['website'],
      Address: json["address"],
      Latitude: json['latitude'],
      Longitude: json['longitude'],
    );
  }
}

class detail_page extends StatefulWidget {
  @override
  _detail_pageState createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  final String URL = '';

  Future<List<Data>> fetchdata() async {
    var data = {'id': Get.arguments.toString()};
    //print(Get.arguments.toString());
    //var response = await http.get(URL);
    var response = await http.post(URL, body: json.encode(data));
    print(response.body);
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List<Data>>(
          future: fetchdata(),
          builder: (context, snapshot) {

            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );

            //return Container(
            //height: 460,
            //width: 600,
            /* */
            /*child:*/ return ListView(
              children: snapshot.data
                  .map(
                    (data) => Column(
                      children: <Widget>[
                        //Text(dataobj.Id.toString()),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: GFImageOverlay(
                            color: Colors.white,
                            height: 200,
                            //width: 360,
                            boxFit: BoxFit.fill,
                            image: NetworkImage(
                              data.Background,
                            ),
                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0),BlendMode.lighten),
                          ),
                        ),
                        GFListTile(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          margin: EdgeInsets.fromLTRB(2, 2, 2, 4),
                          color: Colors.blue,
                          avatar: GFAvatar(
                            backgroundImage: NetworkImage(data.Logo),
                            shape: GFAvatarShape.circle,
                            size: GFSize.LARGE,
                          ),
                          title: Text(
                            data.Education + " ("+data.EducationA+")",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            data.Name + " ("+data.NameA+")",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          description: Text(
                            data.Location+" / Karachi / Sindh /Pakistan",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                         /* icon: Icon(
                            Icons.thumb_up_outlined,
                            color: Colors.white,
                          ),*/
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                          child: Container(
                            color: Colors.blue,
                            height: 84,
                            width: 360,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Addmission",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        data.Admission,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 4, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Fees",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        data.Fees,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 4, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "System",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        data.System,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GFAccordion(
                          //showAccordion: true,
                          contentBackgroundColor: Colors.blue,
                          collapsedTitleBackgroundColor: Colors.blue,
                          expandedTitleBackgroundColor: Colors.blue,
                          margin: EdgeInsets.fromLTRB(4, 0, 4, 4),
                          titleChild: Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          contentChild: Text(
                            data.Description,
                            style: TextStyle(
                              //fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                          collapsedIcon: Text(
                            'Show',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              //fontStyle: FontStyle.italic,
                            ),
                          ),
                          expandedIcon: Text(
                            'Hide',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              //color: GFColors.LIGHT
                              //fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(6, 0, 4, 4),
                          child: Container(
                            height: 200,
                            color: Colors.white,
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: LatLng(double.parse(data.Latitude),double.parse(data.Longitude)),
                                zoom: 18.0,
                              ),
                              mapType: MapType.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                          child: Container(
                            color: Colors.blue,
                            //height: 84,
                            width: 360,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Mobile",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        data.Mobile,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 4, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Email",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        data.Email,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 4, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Website",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        data.Website,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 4, 10, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Address",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        data.Address,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                  )
                  .toList(),
            ); //,
            //);
          },
        ),
        //],
        //),
        //),
      ),
    );
  }
}
