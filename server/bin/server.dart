import 'dart:developer';
import 'dart:io';
import 'package:protos/protos.dart';
import 'package:server/Services/todo_service.dart';
import 'package:server/server.dart' as server;

void main(List<String> arguments) async {
  // ignore: deprecated_member_use
  final server = Server([TodoService()]);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  await server.serve(port: port);
  print('Server running on $port');
}
