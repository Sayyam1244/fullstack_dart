//
//  Generated code. Do not modify.
//  source: todo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use todoDescriptor instead')
const Todo$json = {
  '1': 'Todo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'isCompleted', '3': 4, '4': 1, '5': 8, '10': 'isCompleted'},
  ],
  '8': [
    {'1': '_description'},
  ],
};

/// Descriptor for `Todo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoDescriptor = $convert.base64Decode(
    'CgRUb2RvEg4KAmlkGAEgASgFUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSJQoLZGVzY3JpcH'
    'Rpb24YAyABKAlIAFILZGVzY3JpcHRpb26IAQESIAoLaXNDb21wbGV0ZWQYBCABKAhSC2lzQ29t'
    'cGxldGVkQg4KDF9kZXNjcmlwdGlvbg==');

@$core.Deprecated('Use todoQueryDescriptor instead')
const TodoQuery$json = {
  '1': 'TodoQuery',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `TodoQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoQueryDescriptor = $convert.base64Decode(
    'CglUb2RvUXVlcnkSDgoCaWQYASABKAVSAmlk');

@$core.Deprecated('Use todosDescriptor instead')
const Todos$json = {
  '1': 'Todos',
  '2': [
    {'1': 'todos', '3': 1, '4': 3, '5': 11, '6': '.Todo', '10': 'todos'},
  ],
};

/// Descriptor for `Todos`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todosDescriptor = $convert.base64Decode(
    'CgVUb2RvcxIbCgV0b2RvcxgBIAMoCzIFLlRvZG9SBXRvZG9z');

