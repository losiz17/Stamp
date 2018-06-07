//
//  ViewController.swift
//  Stamp
//
//  Created by 吉川莉央 on 2018/06/07.
//  Copyright © 2018年 RioYoshikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet var haikeiImageView: UIImageView!
    var imageView: UIImageView!
    
    var imageNameArray: [String] = ["hana","hoshi","onpu","shitumon"]
    var imageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        if imageIndex != 0{
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            imageView.image = image
            
            imageView.center = CGPoint(x: location.x, y: location.y)
            
            self.view.addSubview(imageView)
        }
    }

    @IBAction func selectedFirst(_ sender: Any) {
        imageIndex = 1
    }
    
    @IBAction func selectedSecond(_ sender: Any) {
        imageIndex = 2
    }
    
    @IBAction func selectedThird(_ sender: Any) {
        imageIndex = 3
    }
    
    @IBAction func selectedFourth(_ sender: Any) {
        imageIndex = 4
    }
    
    @IBAction func back(_ sender: Any) {
        self.imageView.removeFromSuperview()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        haikeiImageView.image = image
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func selectBackground(_ sender: Any) {
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion:  nil)
        
    }

    

    @IBAction func save(_ sender: Any) {
        let rect:CGRect = CGRect(x: 0, y: 30, width: 320, height: 380)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
    }
}

