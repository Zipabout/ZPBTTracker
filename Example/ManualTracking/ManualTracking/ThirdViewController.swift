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
    
    @IBOutlet weak var thirdKey: UITextField!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var thirdTextView: UITextView!
    
    @IBOutlet weak var opt1: UILabel!
    @IBOutlet weak var opt2: UILabel!
    @IBOutlet weak var opt3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thirdKey.delegate = self
        
        // Do any additional setup after loading the view.
    }
    @IBAction func sendEventThird(_ sender: AnyObject) {
        
        let method:ZPBTCallMethod =  ZPBTCallMethod.sharedInstance()
        
        method.callMethodName(thirdKey.text!, andParameterString: thirdTextView.text) { (object, responseCode, error) in
            
            let serveyObj = Survey()
            if let surveys = object as? [String: Any]{
                if let survey = surveys["survey"] as? [String: Any]{
                    
                    serveyObj.question = survey["question"] as! String?
                    
                    if let response = survey["response"] as? [String: String]{
                        serveyObj.opt1 = response["option_1"]
                        serveyObj.opt2 = response["option_2"]
                        serveyObj.opt3 = response["option_3"]
                    }
                }
                self.question.text = serveyObj.question
                self.opt1.text = serveyObj.opt1
                self.opt2.text = serveyObj.opt2
                self.opt3.text = serveyObj.opt2
            }
        }
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
