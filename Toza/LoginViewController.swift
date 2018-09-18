//
//  ViewController.swift
//  Toza
//
//  Created by Farhad Saadatpei on 10/27/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Update Status Bar Style
        self.setNeedsStatusBarAppearanceUpdate()
        
        
    }
    
    //Change Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

