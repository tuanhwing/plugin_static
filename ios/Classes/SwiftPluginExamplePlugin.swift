import Flutter
import UIKit

public class SwiftPluginExamplePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "PluginDemo", binaryMessenger: registrar.messenger())
    let instance = SwiftPluginExamplePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)

    //Stream
    let eventChannel = FlutterEventChannel(name: "PluginStream", binaryMessenger: registrar.messenger())
    eventChannel.setStreamHandler(Native.shared.eventHandler)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getPlatformVersion") {
        Native.shared.getPlatformVersion(callback: result)
    }
    else if (call.method == "showNative") {
        if let params = call.arguments as? Dictionary<String, String>{
            Native.shared.params = params
            Native.shared.showStoryboard(params:params)
            return
        }
        Native.shared.showStoryboard()
        
        
    }
  }
}
