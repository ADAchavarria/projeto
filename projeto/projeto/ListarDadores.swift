//
//  ListarDadores.swift
//  projeto
//
//  Created by Bernardo on 04/06/2019.
//  Copyright © 2019 ipvc.estg. All rights reserved.
//

import UIKit

class ListarDadores: UIViewController {

    final let url = URL(string: "http://192.168.1.168/trab/api/logins")

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
        URLSession.shared.dataTask(with: downloadUrl) { data, urlRespose, error in
            print("Downloaded")
        }.resume()
    }
    
}
