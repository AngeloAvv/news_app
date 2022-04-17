// Autogenerated from Pigeon (v2.0.3), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

class Article {
  Article({
    required this.title,
    this.descr,
    this.urlToImage,
    required this.url,
    this.publishedAt,
    this.content,
  });

  String title;
  String? descr;
  String? urlToImage;
  String url;
  String? publishedAt;
  String? content;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['title'] = title;
    pigeonMap['descr'] = descr;
    pigeonMap['urlToImage'] = urlToImage;
    pigeonMap['url'] = url;
    pigeonMap['publishedAt'] = publishedAt;
    pigeonMap['content'] = content;
    return pigeonMap;
  }

  static Article decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return Article(
      title: pigeonMap['title']! as String,
      descr: pigeonMap['descr']! as String,
      urlToImage: pigeonMap['urlToImage'] as String?,
      url: pigeonMap['url']! as String,
      publishedAt: pigeonMap['publishedAt'] as String?,
      content: pigeonMap['content'] as String?,
    );
  }
}

class _ArticleApiCodec extends StandardMessageCodec {
  const _ArticleApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is Article) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return Article.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class ArticleApi {
  /// Constructor for [ArticleApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  ArticleApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _ArticleApiCodec();

  Future<List<Article?>> articles() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ArticleApi.articles', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as List<Object?>?)!.cast<Article?>();
    }
  }
}
