//
//  ListarDadores.swift
//  projeto
//
//  Created by Bernardo on 04/06/2019.
//  Copyright © 2019 ipvc.estg. All rights reserved.
//

import UIKit

class ListarDadores: UIViewController, UITableViewDataSource {
   
    final let url = URL(string: "http://192.168.1.3/trab/api/logins/")
    private var listas = [Lista]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    func downloadJson() {
        guard let downloadUrl = url else { return }
        URLSession.shared.dataTask(with: downloadUrl) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Something is wrong")
                return
            }
            print("Downloaded")
            
            do{
                let decoder = JSONDecoder()
                let downloadedListas = try decoder.decode(Listas.self, from: data)
                self.listas = downloadedListas.listas
                print(downloadedListas.listas)
                DispatchQueue.main.async {
                    self.tableView.reloadData()

                }
            } catch {
                print("Something wrong after downloaded")
            }
            
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListaDadoresCell") as? ListaDadoresCell else { return
                UITableViewCell() }
        
        cell.lblNome.text = "Nome: " + listas[indexPath.row].nome
        cell.lblTipo.text = "Tipo de sangue: " + listas[indexPath.row].tiposangue
        cell.lblHospital.text = "Hospital: " + listas[indexPath.row].hospital
        cell.lblNmrSaude.text = "Número de saúde: " + listas[indexPath.row].nmrsaude
        
        return cell
    }
    
}
