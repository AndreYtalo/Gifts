import 'package:dio/dio.dart';

class GetGifs {
  String nome = 'rDXfxmLOUn5ozMlCQWbkzA5WDeylx24l';
  Dio dio = Dio();

  Future getgifs(String pesquisa) async {
    try {
      Response response = await dio
          .get('api.giphy.com/v1/gifs/search?api_key=$nome&q=$pesquisa');
      List<String> listgifs = [];
      print(response.data);

      for (var i = 0; i < response.data['data'].length; i++) {
        if (response.data['data'][i]['images'] != null) {
          listgifs.add(response.data['data'][i]['images']['original']['url']);
        }
      }
      print(listgifs);
      return listgifs;
    } catch (e) {
      return e;
    }
  }
}
