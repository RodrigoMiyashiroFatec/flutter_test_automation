import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:testing/model/user.dart';

abstract class Parsable {
  Future<String> obtainFile(String path);
}

class JSONParser implements Parsable {
  Future<String> obtainFile(String path) async {
    return await rootBundle.loadString(path);
  }
}

abstract class GenerationMock {
  Parsable parser;
  String path;

  Future<List> generate();
}

class ObtainUserMock implements GenerationMock {
  @override
  Parsable parser;
  @override
  String path;

  ObtainUserMock({ this.parser, this.path });

  @override
  Future<List> generate() async {
//    String objectString = await parser.obtainFile(path);
    final objectString = mapJSON;//json.encode(mapJSON);
    final objectResponse = json.decode(objectString);

    Iterable iterable = objectResponse;
    List<User> users = iterable.map((model) => User.fromJSON(model)).toList();

    return users;
  }
}

class UserMock {
  static Future<List<User>> get users async {
    Parsable parse = JSONParser();
    GenerationMock mock = ObtainUserMock(path: 'assets/user_mock.json', parser: parse);

    return await mock.generate();
  }
}

/*
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import '../model/aluno.dart';

Future<String> _carregaAlunoJson() async {
  return await rootBundle.loadString('Json/aluno.json');
}
Future carregaAluno() async {
  String jsonString = await _carregaAlunoJson();
  final jsonResponse = json.decode(jsonString);

  Aluno aluno = new Aluno.fromJson(jsonResponse);

  print(aluno.alunoNotas);
}
**/

final mapJSON = '[{"id": 1,"name": "Leanne Graham","username": "Bret","email": "Sincere@april.biz","address": {"street": "Kulas Light","suite": "Apt. 556","city": "Gwenborough","zipcode": "92998-3874","geo": {"lat": "-37.3159","lng": "81.1496"}},"phone": "1-770-736-8031 x56442","website": "hildegard.org","company": {"name": "Romaguera-Crona","catchPhrase": "Multi-layered client-server neural-net","bs": "harness real-time e-markets"}}]';