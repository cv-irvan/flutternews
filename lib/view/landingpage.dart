part of 'importview.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Sizeconfig().init(context);
    return Scaffold(
      backgroundColor: utama,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
              child: Text(
                'Dunia sekarang digenggaman kamu.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
            Image(
              image: Svg('assets/landing.svg'),
              width: Sizeconfig.screenWidth,
              height: Sizeconfig.screenWidth,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: _hitapi,
        label: Text('Lets Read...',
            style: GoogleFonts.poppins(
              color: Colors.black,
            )),
      ),
    );
  }

  void _close() {
    Navigator.pop(context);
  }

  void _hitapi() {
    showLoading(context);

    BeritaBloc blocberita = BeritaBloc();
    blocberita.getBerita();
    blocberita.berita.listen((value) {
      _close();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MainPage(data: value)));
    });
  }
}
