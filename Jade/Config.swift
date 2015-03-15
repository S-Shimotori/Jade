//
//  Config.swift
//  Jade
//
//  Created by S-Shimotori on 3/15/15.
//  Copyright (c) 2015 S-Shimotori. All rights reserved.
//

import UIKit

class Config {
    
    //already initialize or not
    class var initialized: Bool {
        get { return NSUserDefaults.standardUserDefaults().boolForKey("initialized") }
        set(value) {
            NSUserDefaults.standardUserDefaults().setBool(value, forKey:"initialized")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    
}