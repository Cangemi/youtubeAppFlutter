import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/Video.dart';


const CHAVE_YOUTUBE_API = "AIzaSyC08MJFACOK5t1tg8Dtza1yuRG98cKZJ38";
const ID_CANAL = "UCc4K7bAqpdBP8jh1j9XZAww";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>> pesquisar (String pesquisa) async{

    http.Response response = await http.get(
      URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&chanelId="
          "&q=$pesquisa"
    );

    if(response.statusCode == 200){
      print("Sucesso");
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();
      return videos;
    }

  }

}