import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_test/plugin_test.dart';
import 'package:plugin_test/plugin_test_platform_interface.dart';
import 'package:plugin_test/plugin_test_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginTestPlatform
    with MockPlatformInterfaceMixin
    implements PluginTestPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PluginTestPlatform initialPlatform = PluginTestPlatform.instance;

  test('$MethodChannelPluginTest is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginTest>());
  });

  test('getPlatformVersion', () async {
    PluginTest pluginTestPlugin = PluginTest();
    MockPluginTestPlatform fakePlatform = MockPluginTestPlatform();
    PluginTestPlatform.instance = fakePlatform;

    expect(await pluginTestPlugin.getPlatformVersion(), '42');
  });
}
