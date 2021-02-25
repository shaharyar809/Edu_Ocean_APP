import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Data {
  String Id;
  String Image;

  Data({
    this.Id,
    this.Image,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      Id: json['id'],
      Image: json['image'],
    );
  }
}

class task extends StatefulWidget {
  @override
  _taskState createState() => _taskState();
}

class _taskState extends State<task> {
  final String URL = '';

  Future<List<Data>> fetchdata() async {
    var response = await http.post(URL);
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
    return Container(
        height: 200,
        width: 340,
        child: FutureBuilder<List<Data>>(
            future: fetchdata(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
              return ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data
                    .map(
                      (data) => Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,10,0),
                        child: GFImageOverlay(
                          color: Colors.white,
                          height: 200,
                          //width: 360,
                          boxFit: BoxFit.fill,
                          image: NetworkImage(
                            data.Image,
                          ),
                          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0),BlendMode.lighten),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
      );

  }
}
