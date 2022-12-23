// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:api_client/src/models/pokemon.dart';
import 'package:dio/dio.dart';

/// {@template api_client}
/// Api Client
/// {@endtemplate}
class ApiClient {
  /// {@macro api_client}
  ApiClient({Dio? dioClient}) : _dioClient = dioClient ?? Dio();

  final Dio? _dioClient;

  final String _baseApiHost = 'https://pokeapi.co/api/v2/pokemon';

  /// Method to fetch data for provided [pokemonName].
  Future<Pokemon> fetchData({required String pokemonName}) async {
    late Response<Map<String, dynamic>> response;

    try {
      response = await _dioClient!
          .get<Map<String, dynamic>>('$_baseApiHost/$pokemonName');
    } catch (e) {
      if (e is DioError && e.response!.statusCode == HttpStatus.notFound) {
        throw EmptyResultException();
      }
    }

    try {
      return Pokemon.fromJson(response.data!);
    } catch (e) {
      throw JsonSerializableException();
    }
  }
}

abstract class ApiException implements Exception {}

class JsonSerializableException extends ApiException {}

class EmptyResultException extends ApiException {}
