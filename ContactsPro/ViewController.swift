//
//  ViewController.swift
//  ContactsPro
//
//  Created by Pulkit Aggarwal on 19/12/18.
//  Copyright © 2018 Maxx. All rights reserved.
//

import UIKit

var contactsArray = [Contact]()
class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var contactImgView: UIImageView!
    @IBOutlet weak var contactCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactCollectionView.delegate = self
        contactCollectionView.dataSource = self
        
        rounded(view: contactImgView, radius: 110)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let unarchivedData = UserDefaults.standard.object(forKey: "contacts") as? Data
        
        if let unarchivedData = unarchivedData
        {
            contactsArray = NSKeyedUnarchiver.unarchiveObject(with: unarchivedData) as! [Contact]
            
            if(contactsArray.count > 0){
                let singleContact = contactsArray[0]
                nameLabel.text = singleContact.name
                phoneLabel.text = singleContact.phoneNo
                
                let imagepath = imagePath(imageName: singleContact.imageName)
                let image = UIImage(contentsOfFile: imagepath.path)
                
                contactImgView.image = image
                
                contactCollectionView.reloadData()
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contactsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contactCell", for: indexPath)
        
        let imgView = cell.viewWithTag(10) as! UIImageView
        
        let contact = contactsArray[indexPath.row]
        let imageName = contact.imageName
        
        let imagepath = imagePath(imageName: imageName)
        let image = UIImage(contentsOfFile: imagepath.path)
        imgView.image = image
        
        rounded(view: imgView, radius: 50)
        imgView.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contact = contactsArray[indexPath.row]
        let imageName = contact.imageName
        let name = contact.name
        let phoneNo = contact.phoneNo

        
        let imagepath = imagePath(imageName: imageName)
        let image = UIImage(contentsOfFile: imagepath.path)
        
        nameLabel.text = name
        phoneLabel.text = phoneNo
        contactImgView.image = image

    }
    

    
    func imagePath(imageName: String) -> URL {
        let urlPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let imagePath = urlPath[0].appendingPathComponent(imageName)
        return imagePath
    }
    
    func rounded(view : UIView , radius : CGFloat) {
        
        view.layer.cornerRadius = radius
        view.layer.borderColor = UIColor(red: 0.27, green: 0.69, blue: 0.60, alpha: 1.00).cgColor
        view.layer.borderWidth  = 3
        view.clipsToBounds = true
    }


}

