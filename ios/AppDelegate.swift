//
//  AppDelegate.swift
//  Please
//
//  Created by Halim Abdelsadek on 03.07.22.
//

import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
//  var bridge: RCTBridge!
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//    let jsCodeLocation: URL
    ReactNativeNavigation.bootstrap(with: RNModuleInitialiser.init(), launchOptions: launchOptions)
//    jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource:nil)
//    let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "AwesomeProject", initialProperties: nil, launchOptions: launchOptions)
//    let rootViewController = UIViewController()
//    rootViewController.view = rootView
//    self.window = UIWindow(frame: UIScreen.main.bounds)
//    self.window?.rootViewController = rootViewController
//    self.window?.makeKeyAndVisible()
    return true
  }
}

@objc(RNModuleInitialiser)
final class RNModuleInitialiser: NSObject {}
extension RNModuleInitialiser: RCTBridgeDelegate {
    
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        #if DEBUG
        return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
        #else
        return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
        #endif
    }
    
    func extraModules(for bridge: RCTBridge!) -> [RCTBridgeModule]! {
        return ReactNativeNavigation.extraModules(for: bridge);
    }
    
}
