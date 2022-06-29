import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/service_api/provider.dart';
import 'package:wallpaper/views/widget/widget.dart';


class Search extends StatefulWidget {
  final String searchQuery;
  Search({required this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchController = new TextEditingController();


  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getsearchPostData(widget.searchQuery);
  }


  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
        appBar: AppBar(
          title: brandName(),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: postModel.loading == true
                ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(child: CircularProgressIndicator()))
                : Column(children: <Widget>[
              SizedBox(
                height: 20,
              ),
              wallpapersList(wallpapers: postModel.searchpost!.photos, context: context),
            ]),
          ),
        ));
  }
}
