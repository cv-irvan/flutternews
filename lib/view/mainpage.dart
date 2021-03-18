part of 'importview.dart';

class MainPage extends StatefulWidget {
  BeritaModel data;
  MainPage({this.data});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Berita terbaru'),
        ),
        body: ListView.builder(
          itemCount: widget.data.articles.length,
          itemBuilder: (context, i) {
            return itemBerita(context, i);
          },
        ));
  }

  Widget itemBerita(BuildContext context, int i) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detail(
                      data: widget.data.articles[i].url,
                    )));
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Image.network(widget.data.articles[i].urlToImage ??
                  'https://img.icons8.com/plasticine/2x/no-image.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.data.articles[i].title,
                style: GoogleFonts.poppins(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
