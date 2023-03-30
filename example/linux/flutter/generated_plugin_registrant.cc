//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <plugin_test/plugin_test_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) plugin_test_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PluginTestPlugin");
  plugin_test_plugin_register_with_registrar(plugin_test_registrar);
}
