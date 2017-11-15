/************************************************************************************************************************************/
/** @file       ActivityMonitor
 *  @project    0_2 - Statistics
 *  @brief      monitor activity events with the phone (on/off, lock/unlock, etc.)
 *  @details    x
 *
 *  @section    Opens
 *              none current
 *
 *     @section    Legal Disclaimer
 *             All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 *             Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


class ActivityMonitor : NSObject {

    var viewController : ViewController;
    var demoCts : [Int];
    
    //Defs
    let demoItems : [String] = ["applicationWillResignActive", "applicationDidEnterBackground", "applicationWillEnterForeground", "applicationDidBecomeActive", "applicationWillTerminate"];

    
    init(viewController : ViewController) {
        
        //Init
        self.viewController = viewController;
        self.demoCts = [0, 0, 0, 0, 0];
        super.init();
        
        return;
    }
    
    //@note     lineNum: 1-5, i: 0-4
    //@todo     fcn hdr!
    func incrementDemoLabel(lineNum : Int) {
       
        let i : Int = lineNum - 1;
        
        //Increment
        demoCts[i] = demoCts[i] + 1;
        
        //Update Printed Value
        self.updateLabel();
        
        return;
    }
    
    
    //@todo     fcn hdr!
    func updateLabel() {
        
        var printStr : String = "";
        
        for i in 0...(demoCts.count-1) {
            printStr = printStr + demoItems[i] + "\n" + String(format: "  %i\n", demoCts[i]);
        }

        print("updateLabel callled");
        
        self.viewController.demoLabel.text = printStr;

        return;
    }
}

