import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teropongduniaapp/helper/data.dart';
import 'package:teropongduniaapp/helper/news.dart';
import 'package:teropongduniaapp/model/artikel_model.dart';
import 'package:teropongduniaapp/model/kategori_model.dart';
import 'package:teropongduniaapp/views/artikel_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<KategoriModel> kategoris = new List<KategoriModel>();
  List<ArtikelModel> artikels = new List<ArtikelModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kategoris = getKategoris();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    artikels = newsClass.news;
    setState(() {
      _loading = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Teropong"),
            Text("Dunia", style: TextStyle(
              color: Colors.blue
            ),)
          ],
        ),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search,))
        ],
        elevation: 0.0,
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("M. FIkri Mulyawan", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),),
              accountEmail: Text("m.fikri1006@student.unila.ac.id",style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500
              ), ),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.green,
              ),
              decoration: BoxDecoration(
                  color: Colors.black54
              ),
            ),

            new ListTile(
              leading: new Icon(Icons.home),
              title: new Text("Home"),
              onTap: (){
                Navigator.pop(context);
              },
            ),

            new ListTile(
              leading: new Icon(Icons.info_outline),
              title: new Text("About Us"),
              onTap: (){
                Navigator.pop(context);
              },
            ),

            new ListTile(
              leading: new Icon(Icons.announcement),
              title: new Text("Privacy Policy"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            new Divider(
              color: Color(0xff2A2E43),
            ),
            new ListTile(
              leading: new Icon(Icons.exit_to_app),
              title: new Text("Log Out"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ): SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[

              ///Kategori
              Container(
                height: 70,
                child: ListView.builder(
                  itemCount: kategoris.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                    return KategoriTile(
                      imageUrl: kategoris[index].imageUrl,
                      kategoriName: kategoris[index].kategoriName,
                    );
                }),
              ),

              ///Blog
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: artikels.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index){
                    return BlogTile(
                      imageUrl: artikels[index].urlToImage ,
                      title: artikels[index].title  ,
                      desc: artikels[index].description  ,
                      url: artikels[index].url,

                    );
                    }
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}

class KategoriTile extends StatelessWidget {

  final imageUrl, kategoriName;
  KategoriTile({this.imageUrl, this.kategoriName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
                child: CachedNetworkImage(
                  imageUrl: imageUrl, width: 120, height: 60, fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 120, height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.black26,
              ),
              child: Text(kategoriName, style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),),
            )

          ],
        ),
      ),
    );
  }
}


class BlogTile extends StatelessWidget {

  final String imageUrl, title, desc, url;
  BlogTile({@required this.imageUrl,@required this.title,@required this.desc, @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArtikelView(
            blogUrl: url,
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
                child: Image.network(imageUrl)),
            Text(title, style: TextStyle(
              fontSize: 17,
              color: Colors.black87,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(height: 8,),
            Text(desc, style: TextStyle(
                color: Colors.black45
            ),)
          ],
        ),
      ),
    );
  }
}
