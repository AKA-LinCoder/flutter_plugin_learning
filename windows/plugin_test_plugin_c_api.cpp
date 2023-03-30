#include "include/plugin_test/plugin_test_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "plugin_test_plugin.h"

void PluginTestPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  plugin_test::PluginTestPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
