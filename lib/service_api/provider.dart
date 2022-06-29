import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/model/wallpaper_model.dart';


String apiKey = "563492ad6f91700001000001a60a032cce384a269c298ae5e03cc51f";

Future<WallPaperModel> getWallPaperData() async {
  WallPaperModel? result;
  String url = "https://api.pexels.com/v1/curated?per_page=15&page=2";
  Response response = await Dio().get(url,
      options: Options(
        validateStatus: (status) => true,
        headers: {
          "Accept": "application/json",
          'Authorization' : apiKey
        },
      )
  );
  WallPaperModel data = new WallPaperModel.fromJson(response.data);
  result = data;

  return result;
}

Future<WallPaperModel> getSearchWallData(String query) async {
  WallPaperModel? result;
  String url = "https://api.pexels.com/v1/search?query=$query&per_page=15&page=1";
  Response response = await Dio().get(url,
      options: Options(
        validateStatus: (status) => true,
        headers: {
          "Accept": "application/json",
          'Authorization' : apiKey
        },
      )
  );
  WallPaperModel data = new WallPaperModel.fromJson(response.data);
  result = data;

  return result;
}

class DataClass extends ChangeNotifier {
  WallPaperModel? post;
  WallPaperModel? searchpost;
  bool loading = true;

  getPostData() async {
    loading = true;
    post = (await getWallPaperData());
    loading = false;

    notifyListeners();
  }

  getsearchPostData(String query) async {
    loading = true;
    searchpost = (await getSearchWallData(query));
    loading = false;

    notifyListeners();
  }
}