/*
import 'package:chopper/chopper.dart';

import 'package:built_collection/built_collection.dart';
import 'package:dportfolio_v2/infrastructure/core/serializers/json_serializer.dart';

final jsonSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

class BuiltValueConverter extends JsonConverter {
  T _deserialize<T>(dynamic value) => jsonSerializers.deserializeWith<T>(
        jsonSerializers.serializerForType(T),
        value,
      );

  BuiltList<T> _deserializeListOf<T>(Iterable value) => BuiltList(
        value.map((value) => _deserialize<T>(value)).toList(growable: false),
      );

  dynamic _decode<T>(entity) {
    /// handle case when we want to access to Map<String, dynamic> directly
    /// getResource or getMapResource
    /// Avoid dynamic or unconverted value, this could lead to several issues
    if (entity is T) return entity;

    try {
      if (entity is List) return _deserializeListOf<T>(entity);
      return _deserialize<T>(entity);
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    // use [JsonConverter] to decode json
    final jsonRes = super.convertResponse(response);
    final body = _decode<Item>(jsonRes.body);
    return jsonRes.copyWith<ResultType>(body: body);
  }

  @override
  Request convertRequest(Request request) => super.convertRequest(
        request.copyWith(
          body: serializers.serialize(request.body),
        ),
      );
}
*/
