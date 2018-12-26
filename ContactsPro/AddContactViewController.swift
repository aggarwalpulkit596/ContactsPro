//
//  AddContactViewController.swift
//  ContactsPro
//
//  Created by Pulkit Aggarwal on 24/12/18.
//  Copyright © 2018 Maxx. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var contactImgView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        phoneTextField.delegate = self
        
        nameTextField.becomeFirstResponder()
        
        rounded(view: nameTextField, radius: 5)
        rounded(view: phoneTextField, radius: 5)
        rounded(view: contactImgView, radius: 50)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
        
        return true
    }

    @IBAction func selectPhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        
        present(picker,animated: true)
    
    }
    
    func rounded(view : UIView , radius : CGFloat) {
        
        view.layer.cornerRadius = radius
        view.layer.borderColor = UIColor(red: 0.27, green: 0.69, blue: 0.60, alpha: 1.00).cgColor
        view.layer.borderWidth  = 3
        view.clipsToBounds = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage]
        contactImgView.image = image as? UIImage
        
        dismiss(animated: true)
    }
    @IBAction func save(_ sender: Any) {
        
        if((nameTextField.text?.isEmpty)! || (phoneTextField.text?.isEmpty)! || contactImgView.image == nil)
        {
            let alert = UIAlertController(title: "All Required", message: "Please provide every information in order to continue", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert,animated: true)
            return
        }
        
        let name = nameTextField.text!
        let phoneNo = phoneTextField.text!

        let randomInt = arc4random_uniform(1000)
        let imageName = "\(name.removeSpaces())\(randomInt)"
        
        let newContact = Contact(name: name, phoneNo: phoneNo, imageName: imageName)
        contactsArray.insert(newContact, at: 0)
        
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: contactsArray)
        UserDefaults.standard.set(archivedData, forKey: "contact")
        
        
        
        let image = contactImgView.image!
        if let jpgImage = image.jpegData(compressionQuality: 0.8){
            let urlPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let imagePath = urlPath[0].appendingPathComponent(imageName)
            
            try? jpgImage.write(to: imagePath)
        }
        
        
        
    }
    
}
