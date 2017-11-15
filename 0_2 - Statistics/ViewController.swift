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
 * 	@section	Opens
 * 			none current
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit

class ViewController: UIViewController {

    var battLabel : UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.translatesAutoresizingMaskIntoConstraints = false;
        
        //Add Battery Label
        self.addBattLabel();

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
        battLabel.backgroundColor = UIColor.white;
        
        //display battery level
        self.updateBattLevel();
        
        view.addSubview(battLabel);
        
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
    
    
    func applicationWillResignActive(_ notification: Notification) {
        print("I'm out of focus, home was pressed!");
        return;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        
        return;
    }
}



