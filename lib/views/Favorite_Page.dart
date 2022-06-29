import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wallpaper/views/view_image.dart';
import 'package:wallpaper/views/widget/widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  final box = Hive.box<String>('LikedImage');
  List<String> photos=[];

  getImage(){
    for(int i = 0 ; i< box.length ; i++)
      {
        photos.add(box.getAt(i)!);
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: GridView.builder(
          itemCount: photos.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (2),
              childAspectRatio: 0.6,
              mainAxisSpacing: 6.0,
              crossAxisSpacing: 6.0,),
             itemBuilder: (context,index){
          return GridTile(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ImageView(
                      imgurl: photos[index],
                    )
                ));
              },
              child: Hero(
                tag: photos,
                child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(photos[index],fit: BoxFit.cover,)),
                ),
              ),
            ),
          );
            })
      ),
    );
  }
}
