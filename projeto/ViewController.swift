//
//  ViewController.swift
//  projeto
//
//  Created by Bernardo on 04/06/2019.
//  Copyright © 2019 ipvc.estg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var lbl: UILabel!
    
    
    @IBAction func login(_ sender: Any) {
        let urlString = "http://192.168.1.3/trab/api/id/" + user.text!
       
        
        print("DATA:\(urlString)")
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(EntityReturnLogin.self, from: data)
                let jsonBodyString = String(data: data, encoding: .utf8)
                print("JSON STRING : ", jsonBodyString!)
                DispatchQueue.main.async {
                    if (self.user.text! == response.username){
                        print("TEXT: \(self.user.text!)")
                        print("WS: \(response.username)")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "menu") as! Menu
                        self.present(vc, animated: true, completion: nil)

                        //self.present(vc, animated: true, completion: nil)
                    } else {
                        self.lbl.text = "Erro"
                    }
                }
            } catch {
                self.lbl.text = "Erro"
                print("Error")
            }
            }.resume()
    }
}

