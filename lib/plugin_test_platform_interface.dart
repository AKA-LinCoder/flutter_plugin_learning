import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_test_method_channel.dart';

abstract class PluginTestPlatform extends PlatformInterface {
  /// Constructs a PluginTestPlatform.
  PluginTestPlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginTestPlatform _instance = MethodChannelPluginTest();

  /// The default instance of [PluginTestPlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginTest].
  static PluginTestPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginTestPlatform] when
  /// they register themselves.
  static set instance(PluginTestPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
