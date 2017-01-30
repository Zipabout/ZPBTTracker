//
//  ThirdViewController.swift
//  ManualTracking
//
//  Created by Siju Satheesachandran on 12/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//

import UIKit
import ZPBTTracker

class ThirdViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var thirdValue: UITextField!
    @IBOutlet weak var thirdKey: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        thirdValue.delegate = self
        thirdKey.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func sendEventThird(_ sender: AnyObject) {
        thirdValue.resignFirstResponder()
        thirdKey.resignFirstResponder()
        let event:ZPBTEventManager =  ZPBTEventManager.sharedInstance()
        
        var customParameter: [String: String] = [:]
        customParameter[thirdKey.text!] =  thirdValue.text!
        
        event.trackEvent(inPage: NSStringFromClass(type(of: self)), customParameter: customParameter)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let session:ZPBTSessionManager =  ZPBTSessionManager.sharedInstance()
        //track current page
        session.trackSession(inPage: NSStringFromClass(type(of: self)))

    }

    @IBOutlet weak var sendEventThird: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
