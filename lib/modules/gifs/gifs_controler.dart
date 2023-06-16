import 'package:gifts/shared/services/get_gifs.dart';

class GifsController {
  GetGifs services = GetGifs();

  Future<List<String>> getgifs(String pesquisa) async {
    return await services.getgifs(pesquisa);
  }
}
