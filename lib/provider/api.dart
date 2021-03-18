part of 'importprovider.dart';

class Api {
  Uri urlapi = Uri.parse('https://newsapi.org/v2/top-headlines?country=id&q=');

  Future getApi() async {
    final hitapi = await request.get(urlapi,
        headers: {"X-Api-Key": "5dd57bb1e91a450caa197199f0e9d26b"});
    if (hitapi.statusCode == 200) {
      print('berhasil hit api');
      return BeritaModel.fromJson(json.decode(hitapi.body));
    } else {
      print('gagal ${hitapi.statusCode}');
    }
  }
}
