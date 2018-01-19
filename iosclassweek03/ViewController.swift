//
//  ViewController.swift
//  iosclassweek03
//
//  Created by YEN JUILEE on 2017/3/8.
//  Copyright © 2017年 YEN JUILEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changePhotoButtonPressed(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var headButton: UIButton!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        headButton.setBackgroundImage(info[UIImagePickerControllerOriginalImage] as? UIImage, for: .normal)
        dismiss(animated: true, completion: nil)
        
    }
}

