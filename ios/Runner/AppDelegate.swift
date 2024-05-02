import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      // Check if the device is an iPhone
             if UIDevice.current.userInterfaceIdiom == .phone {
                 // This device is an iPhone, continue launching the app
                 
                 // Initialize Google Maps
                 GMSServices.provideAPIKey("AIzaSyBrbWFXlOYpaq51wteSyFS2UjdMPOWBlQw")
                 
                 // Register Flutter plugins
                 GeneratedPluginRegistrant.register(with: self)
                 
                 // Return the result of super's method
                 return super.application(application, didFinishLaunchingWithOptions: launchOptions)
             } else {
                 // This device is an iPad, exit the app
                 exit(0)
             }

  }
}
