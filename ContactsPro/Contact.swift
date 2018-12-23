//
//  Contact.swift
//  ContactsPro
//
//  Created by Pulkit Aggarwal on 22/12/18.
//  Copyright © 2018 Maxx. All rights reserved.
//

import UIKit

class Contact: NSObject,NSCoding {
    
    let imageName:String
    let name:String
    let phoneNo:String
    
    init(name:String,phoneNo:String,imageName:String) {
        self.name = name
        self.phoneNo = phoneNo
        self.imageName = imageName
    }
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        phoneNo = aDecoder.decodeObject(forKey: "phone") as! String
        imageName = aDecoder.decodeObject(forKey: "imageName") as! String

    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name,   forKey: "name")
        aCoder.encode(phoneNo,   forKey: "phone")
        aCoder.encode(imageName,   forKey: "imageName")


    }

}
