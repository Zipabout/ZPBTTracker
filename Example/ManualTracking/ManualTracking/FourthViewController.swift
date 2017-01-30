//
//  FourthViewController.swift
//  ManualTracking
//
//  Created by Siju Satheesachandran on 12/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//

import UIKit
import ZPBTTracker
class FourthViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtFourthValue: UITextField!
    @IBOutlet weak var txtFourth: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFourthValue.delegate = self
        txtFourth.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        let session:ZPBTSessionManager =  ZPBTSessionManager.sharedInstance()
        //track current page
        session.trackSession(inPage: NSStringFromClass(type(of: self)))

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func sendEventFourth(_ sender: AnyObject) {
        txtFourthValue.resignFirstResponder()
        txtFourth.resignFirstResponder()
        let event:ZPBTEventManager =  ZPBTEventManager.sharedInstance()
        
        var customParameter: [String: String] = [:]
        customParameter[txtFourth.text!] =  txtFourthValue.text!
        event.trackEvent(inPage: NSStringFromClass(type(of: self)), customParameter: customParameter)
        
    }
    
    
    @IBOutlet weak var sendEventFourth: UIButton!
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
