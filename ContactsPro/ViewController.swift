//
//  ViewController.swift
//  ContactsPro
//
//  Created by Pulkit Aggarwal on 19/12/18.
//  Copyright © 2018 Maxx. All rights reserved.
//

import UIKit

var contactsArray = [Contact]()
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contact1 = Contact(name: "Pulkit", phoneNo: "9582054664", imageName: "image name")
        let contact2 = Contact(name: "Maxx", phoneNo: "9873476138", imageName: "anotherimage")
        
        contactsArray.append(contact1)
        contactsArray.append(contact2)

        UserDefaults.standard.set(contactsArray, forKey: "contact")

    }


}

