import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('ApiClient', () {
    late Dio dio;

    setUp(() {
      dio = MockDio();
    });
    test('can be instantiated', () {
      expect(ApiClient(dioClient: Dio()), isNotNull);
    });

    test('throws EmptyResultException when item has not being found ', () {
      when(() => dio.get<Map<String, dynamic>>(any())).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: ''),
            data: <String, dynamic>{},
          ),
        ),
      );

      expect(
        () => ApiClient(dioClient: dio).fetchData(pokemonName: 'test'),
        throwsA(isA<EmptyResultException>()),
      );
    });

    test('throws JsonSerializableException when data is corrupted ', () {
      when(() => dio.get<Map<String, dynamic>>(any())).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: ''),
            data: <String, dynamic>{'test': 'test'},
          ),
        ),
      );

      expect(
        () => ApiClient(dioClient: dio).fetchData(pokemonName: 'test'),
        throwsA(isA<JsonSerializableException>()),
      );
    });
  });
}
