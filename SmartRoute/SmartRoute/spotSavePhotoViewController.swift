//
//  spotSavePhotoViewController.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/02/14.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit

class spotSavePhotoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [NSObject : AnyObject]?) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        importedImage.image = image
    }
    
    @IBAction func importImage(sender: AnyObject) {
        
        //フォトライブラリーから写真を取得
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        //編集できないようにする
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
        
    }
    
    @IBOutlet var importedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

