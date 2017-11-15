/************************************************************************************************************************************/
/** @file		ViewController.swift
 *  @project    0_2 - Statistics
 * 	@brief		x
 * 	@details	x
 *
 * 	@author		Justin Reina, Firmware Engineer, Jaostech
 * 	@created	11/13/17
 * 	@last rev	x
 *
 *
 * 	@notes		x
 *
 *  @section 	New Opens
 *		Location
 *		Step Count,  Misc. Health
 *		Phone On
 *		Phone Off
 *		Phone Unlock
 *		HealthKit Statistics (Step Count, etc.)
 *		Location
 *		Map
 *
 * 	@section	Opens
 * 			Detect & Report Phone Locks
 *          Detect & Report Phone Unlocks
 *          Detect & Report App Closes
 *          Detect & Report App Opens
 *
 *  @section    Status
 *          App correctly reports battery level
 *          App does not properly detect state transitions in AppDelegate & crashes
 *
 *  @section    Next Steps
 *          App does not crash on phone lock
 *
 *  @section    Battery Reference
 *      @url    https://stackoverflow.com/questions/27475506/check-battery-level-ios-swift
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit

class ViewController: UIViewController {

    var battLabel : UILabel!;
    var demoLabel : UILabel!;
    
    var monitor   : ActivityMonitor!;
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.translatesAutoresizingMaskIntoConstraints = false;
        
        //Add Battery Label
        self.addBattLabel();
        
        //Add Activity Monitor's Label
        self.addDemoLabel();
        
        //Add Activity Monitor
        self.monitor = ActivityMonitor(viewController: self);
        self.monitor.updateLabel();

//<temp>
//        self.incrementDemoLabel(lineNum: 1);
//        self.incrementDemoLabel(lineNum: 2);
//        self.incrementDemoLabel(lineNum: 1);
//</temp>
        
        print("ViewController.viewDidLoad():       viewDidLoad() complete");
        
        //listen to 'Home' press
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)),
                                               name: NSNotification.Name.UIApplicationWillResignActive,
                                               object: nil);
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        func addBattLabel()
     *  @brief      gen the new label to print the battery level
     *  @details    x
     *
     *  @post        battLabel init & displayed
     */
    /********************************************************************************************************************************/
    func addBattLabel() {
        
        //init label
        battLabel = UILabel();
        
        //set params
        battLabel.text          = "%";
        battLabel.font          = UIFont(name: "Arial", size: 15);
        battLabel.textColor     = UIColor.black;
        battLabel.textAlignment = .left;
        
        //formatting
        battLabel.numberOfLines = 0;
        battLabel.lineBreakMode = .byWordWrapping;
        battLabel.frame = CGRect(x: 10, y: 25, width: 300, height: 25);
        battLabel.backgroundColor = UIColor.blue;
        
        //display battery level
        self.updateBattLevel();
        
        view.addSubview(battLabel);
        
        return;
    }

    
    /********************************************************************************************************************************/
    /** @fcn        func addDemoLabel()
     *  @brief      display activity event counts
     *  @details    x
     *
     *  @post       demoLabel init & displayed
     */
    /********************************************************************************************************************************/
    func addDemoLabel() {
        
        //init label
        self.demoLabel = UILabel();
        
        //set params
        self.demoLabel.text          = "1\n2\n3\n4\n5";
        self.demoLabel.font          = UIFont(name: "Arial", size: 15);
        self.demoLabel.textColor     = UIColor.black;
        self.demoLabel.textAlignment = .left;
        
        //formatting
        self.demoLabel.numberOfLines = 0;
        self.demoLabel.lineBreakMode = .byWordWrapping;
        self.demoLabel.frame = CGRect(x: 10, y: 75, width: 300, height: 200);
        self.demoLabel.backgroundColor = UIColor.yellow;
        
        self.view.addSubview(self.demoLabel);
        
        return;
    }


    //@todo     consolidate!
    //@assum    valid inputs
    func incrementDemoLabel(lineNum : Int) {
        self.monitor.incrementDemoLabel(lineNum: lineNum);
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        func updateBattLevel()
     *  @brief      write the batter level to the screen (0 - 1)
     */
    /********************************************************************************************************************************/
    func updateBattLevel() {
        
        //Read Battery Level
        let battLvl : Float = BatteryMonitor.getBatteryLevel();            /* promoted at 0-100                                     */
        let battStr : String = String(format: "Batt: %.2f%%", battLvl);
        
        self.writeBattLabel(str: battStr);
        
        return;
    }


    /********************************************************************************************************************************/
    /** @fcn        func writeBattLabel(String str)
     *  @brief      write a new value to the battery label
     */
    /********************************************************************************************************************************/
    func writeBattLabel(str : String) {
        self.battLabel.text = str;
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        func demoPrint(lineNum : Int)
     *  @brief      increment value on said line
     *
     *  @param  [in] (Int) lineNum - line number to increment and print onto (lines 1-5)
     *
     *  @assum  valid input values
     */
    /********************************************************************************************************************************/
    func demoPrint(lineNum : Int) {
        
        
        return;
    }
    
    
    func applicationWillResignActive(_ notification: Notification) {
        print("I'm out of focus, home was pressed!");
        return;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        
        return;
    }
}



