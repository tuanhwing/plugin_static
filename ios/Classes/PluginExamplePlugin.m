#import "PluginExamplePlugin.h"
#if __has_include(<plugin_example/plugin_example-Swift.h>)
#import <plugin_example/plugin_example-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "plugin_example-Swift.h"
#endif

@implementation PluginExamplePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPluginExamplePlugin registerWithRegistrar:registrar];
}
@end
