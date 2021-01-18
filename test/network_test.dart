import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

@TestOn("vm")
void main() {
  HttpServer server;
  Uri url;
  setUp(() async {
    server = await HttpServer.bind('localhost', 0);
    url = Uri.parse('http://${server.address.host}:${server.port}');
  });

  test("Network status", (){
    print(url);
    expect(url.host, equals("localhost"));
  });

  tearDown(() async {
    await server.close(force: true);
    server = null;
    url = null;
  });
}