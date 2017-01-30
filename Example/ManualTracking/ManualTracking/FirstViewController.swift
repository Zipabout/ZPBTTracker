//
//  FirstViewController.swift
//  ManualTracking
//
//  Created by Siju Satheesachandran on 12/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//

import UIKit
import ZPBTTracker

class FirstViewController: UIViewController,UITextFieldDelegate {
    
    //@IBOutlet weak var txtFirst: UITextField!

    @IBOutlet weak var txtFirstValue: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        //txtFirst.delegate = self
        txtFirstValue.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendEvent(_ sender: AnyObject) {
        //txtFirst.resignFirstResponder()
        txtFirstValue.resignFirstResponder()
        let event:ZPBTEventManager =  ZPBTEventManager.sharedInstance()
        var customParameter: [String: String] = [:]
        let jsonObject = [
            
            "CRS": txtFirstValue.text!
            ]
        
        
        let valid = JSONSerialization.isValidJSONObject(jsonObject)
        if valid
        {
            do {
                let data = try JSONSerialization.data(withJSONObject: jsonObject, options:[])
                if let content = String(data: data, encoding: String.Encoding.utf8) {
                  
                        customParameter["location"] =  String(content)
                    }
                
                
            } catch {
                print("JSON serialization failed:  \(error)")
               
            }
        }
        

        
        
       
        
   
        event.trackEvent(inPage: NSStringFromClass(type(of: self)), customParameter: customParameter)
    }

}

