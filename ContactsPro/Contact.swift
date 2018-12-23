//
//  Contact.swift
//  ContactsPro
//
//  Created by Pulkit Aggarwal on 22/12/18.
//  Copyright © 2018 Maxx. All rights reserved.
//

import UIKit

class Contact: NSObject {
    
    let imageName:String
    let name:String
    let phoneNo:String
    
    init(name:String,phoneNo:String,imageName:String) {
        self.name = name
        self.phoneNo = phoneNo
        self.imageName = imageName
    }

}
