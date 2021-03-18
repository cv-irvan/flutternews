part of 'importbloc.dart';

class BeritaBloc {
  final _api = Api();
  final _beritaFatcher = PublishSubject<BeritaModel>();

  PublishSubject<BeritaModel> get berita => _beritaFatcher.stream;

  getBerita() async {
    BeritaModel beritaModel = await _api.getApi();
    _beritaFatcher.sink.add(beritaModel);
  }

  dispose() {
    _beritaFatcher.close();
  }
}
