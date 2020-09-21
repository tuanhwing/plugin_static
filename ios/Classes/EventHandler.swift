//
//  EventHandler.swift
//  plugin_example
//
//  Created by Tuan Hwing on 9/17/20.
//

import UIKit

class EventHandler: NSObject,FlutterStreamHandler {
    var sink:FlutterEventSink?
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.sink = events
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil
    }
    

}
