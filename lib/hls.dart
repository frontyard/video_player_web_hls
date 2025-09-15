@JS()
library hls.js;

import 'dart:js_interop';

import 'package:web/web.dart' as web;

@JS('Hls.isSupported')
external bool isSupported();

@JS()
@staticInterop
class Hls {
  external factory Hls(HlsConfig config);
}

extension HlsExtension on Hls {
  external void stopLoad();

  external void loadSource(String videoSrc);

  external void attachMedia(web.HTMLVideoElement video);

  external void on(String event, JSFunction callback);

  external HlsConfig config;

  /// Gets the list of available audio tracks
  external JSArray get audioTracks;

  /// Sets the current audio track
  external set audioTrack(int audioTrackId);

  /// Gets the current audio track
  external int get audioTrack;
}

@JS()
@anonymous
@staticInterop
class HlsConfig {
  external factory HlsConfig({JSFunction xhrSetup});
}

extension HlsConfigExtension on HlsConfig {
  external JSFunction get xhrSetup;
}

class ErrorData {
  late final String type;
  late final String details;
  late final bool fatal;

  ErrorData(dynamic errorData) {
    type = errorData.type as String;
    details = errorData.details as String;
    fatal = errorData.fatal as bool;
  }
}

/// Represents an audio track from HLS.js
@JS()
@anonymous
@staticInterop
class HlsAudioTrack {
  external factory HlsAudioTrack();
}

extension HlsAudioTrackExtension on HlsAudioTrack {
  external int get id;
  external String get groupId;
  external String get name;
  external String get lang;
  external bool get default_;
}

/// Dart representation of an HLS audio track
class AudioTrack {
  final int id;
  final String groupId;
  final String name;
  final String language;
  final bool isDefault;

  AudioTrack({
    required this.id,
    required this.groupId,
    required this.name,
    required this.language,
    required this.isDefault,
  });

  factory AudioTrack.fromHlsAudioTrack(HlsAudioTrack track) {
    return AudioTrack(
      id: track.id,
      groupId: track.groupId,
      name: track.name,
      language: track.lang,
      isDefault: track.default_,
    );
  }
}
