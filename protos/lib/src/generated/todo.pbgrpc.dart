//
//  Generated code. Do not modify.
//  source: todo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'todo.pb.dart' as $0;

export 'todo.pb.dart';

@$pb.GrpcServiceName('TodoService')
class TodoServiceClient extends $grpc.Client {
  static final _$getTodo = $grpc.ClientMethod<$0.TodoQuery, $0.Todo>(
      '/TodoService/getTodo',
      ($0.TodoQuery value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Todo.fromBuffer(value));
  static final _$getAllTodos = $grpc.ClientMethod<$0.TodoQuery, $0.Todos>(
      '/TodoService/getAllTodos',
      ($0.TodoQuery value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Todos.fromBuffer(value));
  static final _$addTodo = $grpc.ClientMethod<$0.Todo, $0.Todo>(
      '/TodoService/AddTodo',
      ($0.Todo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Todo.fromBuffer(value));

  TodoServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Todo> getTodo($0.TodoQuery request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTodo, request, options: options);
  }

  $grpc.ResponseFuture<$0.Todos> getAllTodos($0.TodoQuery request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllTodos, request, options: options);
  }

  $grpc.ResponseFuture<$0.Todo> addTodo($0.Todo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTodo, request, options: options);
  }
}

@$pb.GrpcServiceName('TodoService')
abstract class TodoServiceBase extends $grpc.Service {
  $core.String get $name => 'TodoService';

  TodoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TodoQuery, $0.Todo>(
        'getTodo',
        getTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TodoQuery.fromBuffer(value),
        ($0.Todo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TodoQuery, $0.Todos>(
        'getAllTodos',
        getAllTodos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TodoQuery.fromBuffer(value),
        ($0.Todos value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Todo, $0.Todo>(
        'AddTodo',
        addTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Todo.fromBuffer(value),
        ($0.Todo value) => value.writeToBuffer()));
  }

  $async.Future<$0.Todo> getTodo_Pre($grpc.ServiceCall call, $async.Future<$0.TodoQuery> request) async {
    return getTodo(call, await request);
  }

  $async.Future<$0.Todos> getAllTodos_Pre($grpc.ServiceCall call, $async.Future<$0.TodoQuery> request) async {
    return getAllTodos(call, await request);
  }

  $async.Future<$0.Todo> addTodo_Pre($grpc.ServiceCall call, $async.Future<$0.Todo> request) async {
    return addTodo(call, await request);
  }

  $async.Future<$0.Todo> getTodo($grpc.ServiceCall call, $0.TodoQuery request);
  $async.Future<$0.Todos> getAllTodos($grpc.ServiceCall call, $0.TodoQuery request);
  $async.Future<$0.Todo> addTodo($grpc.ServiceCall call, $0.Todo request);
}
