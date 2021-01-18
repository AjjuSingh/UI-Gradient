import 'package:flutter_test/flutter_test.dart';
import 'package:gradientx/Post.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements Client {

}

void main(){
  group("fetchPost", (){
    test("returns a Post if the http call completes successfully", () async {
      final client = MockClient();
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
      .thenAnswer((_) async => Response('{"title":"Test"}', 200));
      expect(await fetchPost(client), isA<Post>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer((_) async => Response('Not Found', 404));

      expect(fetchPost(client), throwsException);
    });
  }
  );
}