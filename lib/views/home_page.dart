import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/service_api/provider.dart';
import 'package:wallpaper/views/search_page.dart';
import 'package:wallpaper/views/widget/widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController searchController = new TextEditingController();


  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }
  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: postModel.loading == true ? Center(child: CircularProgressIndicator()):Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(30)
                ),
                padding:EdgeInsets.symmetric(horizontal: 20) ,
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: ()
                      {
                        if(searchController.text != '')
                          {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Search(
                                  searchQuery: searchController.text,
                                )
                            ));
                          }

                      },
                      child: Container(
                          child: Icon(Icons.search)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              // Container(
              //   height: 80,
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       padding: EdgeInsets.symmetric(horizontal: 24),
              //       scrollDirection: Axis.horizontal,
              //       itemCount: categories.length,
              //       itemBuilder: (context , index){
              //         return CategoriesTile(
              //           title: categories[index].categorieName,
              //           imgUrl: categories[index].imgUrl,
              //         );
              //       }
              //   ),
              // ),
              wallpapersList(wallpapers: postModel.post!.photos , context: context),
            ],
          ),
        ),
      ),
    );
  }
}
