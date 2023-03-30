#ifndef FLUTTER_PLUGIN_PLUGIN_TEST_PLUGIN_H_
#define FLUTTER_PLUGIN_PLUGIN_TEST_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace plugin_test {

class PluginTestPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PluginTestPlugin();

  virtual ~PluginTestPlugin();

  // Disallow copy and assign.
  PluginTestPlugin(const PluginTestPlugin&) = delete;
  PluginTestPlugin& operator=(const PluginTestPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace plugin_test

#endif  // FLUTTER_PLUGIN_PLUGIN_TEST_PLUGIN_H_
