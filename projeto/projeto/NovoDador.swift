//
//  NovoDador.swift
//  projeto
//
//  Created by Bernardo on 04/06/2019.
//  Copyright © 2019 ipvc.estg. All rights reserved.
//

import UIKit

class NovoDador: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler : {
            (action) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var nome: UITextField!
    
    @IBOutlet weak var morada: UITextField!
    
    @IBOutlet weak var nascimento: UITextField!
    
    @IBOutlet weak var nmrsaude: UITextField!
    
    @IBOutlet weak var tiposangue: UITextField!
    
    @IBOutlet weak var hospital: UITextField!
    
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func novo(_ sender: Any) {
        var request = URLRequest(url: URL(string: "http://172.16.182.63/trab/api/teste")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if (username.text!.isEmpty || password.text!.isEmpty || nome.text!.isEmpty || morada.text!.isEmpty || nascimento.text!.isEmpty || nmrsaude.text!.isEmpty || tiposangue.text!.isEmpty || hospital.text!.isEmpty
            ){
            self.createAlert(title: "Registo inválido", message: "Por favor preencha todos os campos.")

        } else {
            
        
        
        
        do{

            let dados = EntityInputNovo(username: username.text!, password: password.text!, nome: nome.text!, morada: morada.text!, nascimento: nascimento.text!, nmrsaude: nmrsaude.text!, tiposangue: tiposangue.text!, hospital: hospital.text!)
            let jsonBody = try JSONEncoder().encode(dados)
            request.httpBody = jsonBody
            
            print("jsonBody:", jsonBody)
            
            let jsonBodyString = String(data: jsonBody, encoding: .utf8)
            
            print("JSON String : ", jsonBodyString!)

            
            
        } catch {
            print("Erro")
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                print("AAAAAAAAAAAAA")
                print(error!)
                return
            }
            
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            do {
                
                print(data)
                let decoder = JSONDecoder()
                let response = try decoder.decode(EntityReturnNovo.self, from: data)
                
                print("DATA:\(data)")
                let jsonBodyString = String(data: data, encoding: .utf8)
                print("JSON String : ", jsonBodyString!)
                
                print("RESPONSE MSG:\(response.status)")
                
                
                
            } catch let jsonError {
                print(jsonError)
                self.createAlert(title: "Erro!", message: "Preencha todos os campos.")
            }
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "menu") as! Menu
            self.present(vc, animated: true, completion: nil)
        task.resume()
       
        
        
    }
    
    }
}
