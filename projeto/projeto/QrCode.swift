//
//  QrCode.swift
//  projeto
//
//  Created by Bernardo on 04/06/2019.
//  Copyright © 2019 ipvc.estg. All rights reserved.
//

import UIKit

class QrCode: UIViewController {
    
    
    @IBOutlet weak var texto: UITextField!
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var gerar: UIButton!
    @IBOutlet weak var guardar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        guardar.isEnabled = false
        // Do any additional setup after loading the view.
    }
    


    @IBAction func qrcode(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func gerar(_ sender: Any) {
        
        if let myString = texto.text {
            let data = myString.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "InputMessage")
            
            let ciImage = filter?.outputImage
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let transformImage = ciImage?.transformed(by: transform)
            
            let image = UIImage(ciImage: transformImage!)
            imagem.image = image
            
            
            guardar.isEnabled = true

        }
       
        
    }
    
    @IBAction func buttonScreenShot(_ sender: Any) {
        screenShotMethod();
    }
    
    func screenShotMethod(){
        
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
        
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
        
    
    }
}
