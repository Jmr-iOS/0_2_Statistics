/************************************************************************************************************************************/
/** @file		AppDelegate.swift
 *  @project    0_2 - Statistics
 *  @brief      x
 *  @details    x
 *
 * 	@notes		x
 *
 * 	@section	Opens
 * 			none current
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?;
    
    var viewController:ViewController!;

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds);
        
        self.window?.backgroundColor = UIColor.white;
        
        self.viewController = ViewController();
        
        self.viewController.view.translatesAutoresizingMaskIntoConstraints = false;
        
        self.window?.rootViewController = viewController;
        
        self.window?.makeKeyAndVisible();
        
        print("AppDelegate.application():          Application launch complete");
        
        return true;
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        self.viewController.incrementDemoLabel(lineNum:1);
        print("A");
        return;
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        self.viewController.incrementDemoLabel(lineNum:2);
        print("B");
        return;
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        self.viewController.incrementDemoLabel(lineNum:3);
        print("C");
        return;
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        self.viewController.incrementDemoLabel(lineNum:4);
        print("D");
        return;
    }
    func applicationWillTerminate(_ application: UIApplication) {
        self.viewController.incrementDemoLabel(lineNum:5);
        print("E");
        return;
    }
}

