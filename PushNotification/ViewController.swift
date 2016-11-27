//
//  ViewController.swift
//  PushNotification
//
//  Created by Kentarou on 2016/11/27.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var array = [1,2,3,4,5]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func crash(_ sender: UIButton) {
        print(array[10])
    }

}

