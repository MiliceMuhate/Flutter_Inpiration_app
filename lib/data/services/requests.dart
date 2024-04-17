import 'dart:convert';

import 'package:inspirationapp/models/publicacoesModel.dart';
import 'package:inspirationapp/presentation/constantes.dart';
import 'package:http/http.dart' as http;

Future<publicacoes> getPublications() async {
  var baseurl = URL;
  var url = Uri.parse('$baseurl/');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return publicacoes.fromJson(jsonDecode(response.body));
    //    return jsonDecode(response.body);
  } else if (response.statusCode == 500) {
    // A resposta HTTP não foi bem-sucedida, você pode lidar com isso de acordo com sua lógica.
    throw Exception('Formatação Invalida!: ${response.statusCode}');
  } else {
    throw Exception('Email nao encontado!: ${response.statusCode}');
  }
}
