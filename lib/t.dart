import 'package:buoi2/services/service_new.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  late Future<News> newsApple;
  late Future<News> newsTesla;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    newsTesla = NewService.fetchNewsTesla(
        NAME_TESLA, FROM_DATE_T10, SORT_BY_PUPLIC, API_KEY);
    newsApple = NewService.fetchNewsApple(
        NAME_APPLE, FROM_DATE_T11, TO_DATE_T11, SORT_BY_POPULAR, API_KEY);
    print(newsApple);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("FlutterNews",style: TextStyle(color: Colors.blue)),
              backgroundColor: Colors.white,
            ),
            body: FutureBuilder(
                future: newsTesla,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    News n = snapshot.data;
                    return ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var img = n.articles[index].urlToImage;
                        var title = n.articles[index].title;
                        var description = n.articles[index].description;
                        return _buildBody(img, title, description);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Loi data"));
                  }
                  return Center(child: Text("Loi service"));
                })));
  }
}

Widget _buildBody(img, title, description) {
  return Column(
    children: [
      Image.network(
        img,
        width: Get.width,
        height: 400,
      ),
      Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.black),
        maxLines: 2,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        description,
        style: TextStyle(fontSize: 18, color: Colors.grey),
        maxLines: 3,
      )
    ],
  );
}