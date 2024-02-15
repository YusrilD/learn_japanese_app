import 'package:flutter_test/flutter_test.dart';
import 'package:learn_japanese_app/controller/api_controller.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('ApiController', () {
    test('fetchData success', () async {
      final mockDio = MockDio();
      final controller = ApiController();
      // controller.dio = mockDio;

      // Mocking Dio's get method with RequestOptions parameter
      // when(mockDio.get(any)).thenAnswer((invocation) async {
      //   print(
      //       'Mock Dio get method called with arguments: ${invocation.positionalArguments}');

      //   // Your callback implementation

      //   return Response(
      //     data: [
      //       {
      //         "id": 1,
      //         "kanji": "安",
      //         "onyomi": "an",
      //         "kunyomi": "yasu-i",
      //         "arti": "murah"
      //       },
      //       // Add more objects as needed to match your JSON response
      //     ],
      //     statusCode: 200,
      //     requestOptions: RequestOptions(
      //       path: "https://myurl",
      //     ),
      //   );
      // });

      // await controller.fetchData();

      // Add your assertion logic here
    });
  });
}
