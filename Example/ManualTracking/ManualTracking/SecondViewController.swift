//
//  SecondViewController.swift
//  ManualTracking
//
//  Created by Siju Satheesachandran on 12/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//

import UIKit
import ZPBTTracker

class SecondViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textEnd: UITextField!
    @IBOutlet weak var txtStart: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textEnd.delegate = self
        txtStart.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func sendEventSecon(_ sender: AnyObject) {
        
        textEnd.resignFirstResponder()
        txtStart.resignFirstResponder()
        
        let event:ZPBTEventManager =  ZPBTEventManager.sharedInstance()
        
        var customParameter: [String: String] = [:]
        
        let jsonObject = [
            
            "CRS_Start": txtStart.text!,
            "CRS_End" :  textEnd.text!
        ]
        
        let valid = JSONSerialization.isValidJSONObject(jsonObject)
        if valid
        {
            do {
                let data = try JSONSerialization.data(withJSONObject: jsonObject, options:[])
                if let content = String(data: data, encoding: String.Encoding.utf8) {
                    
                    customParameter["journey"] =  String(content)
                }
                
                
            } catch {
                print("JSON serialization failed:  \(error)")
                
            }
        }
        
   
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

