//
//  LoginViewController.swift
//  idoubs
//
//  Created by Man Huynh on 2/2/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var IDtextF: UITextField!
    @IBOutlet var PasstextF: UITextField!
    @IBOutlet var LoginBnt: UIButton!
    var defaultValues: GetDefaultValues = GetDefaultValues()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func InitUI() {
        self.LoginBnt.layer.cornerRadius = 15
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func Login(sender: AnyObject) {
        defaultValues.makeImpuAdress(id: self.IDtextF.text!, pass: self.PasstextF.text!)
        self.dismiss(animated: true, completion: nil)
    }
}
