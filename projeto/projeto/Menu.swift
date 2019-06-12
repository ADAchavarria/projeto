//
//  Menu.swift
//  projeto
//
//  Created by Bernardo on 04/06/2019.
//  Copyright © 2019 ipvc.estg. All rights reserved.
//

import UIKit

class Menu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        novoButton.layer.cornerRadius = 15
        listaButton.layer.cornerRadius = 15
        qrButton.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
    }
    
  
    @IBOutlet weak var novoButton: UIButton!
    
    @IBOutlet weak var listaButton: UIButton!

    @IBOutlet weak var qrButton: UIButton!
    
    @IBAction func novoDador(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "novodador") as! NovoDador
        self.present(vc, animated: true, completion: nil)
    }
    

    @IBAction func listarDadores(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "listar") as! ListarDadores
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func validarDoacao(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "qrcode") as! QrCode
        self.present(vc, animated: true, completion: nil)
    }
    
}
