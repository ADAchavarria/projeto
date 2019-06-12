//
//  ListaDadoresCell.swift
//  projeto
//
//  Created by Ricardo on 10/06/2019.
//  Copyright © 2019 ipvc.estg. All rights reserved.
//

import UIKit

class ListaDadoresCell: UITableViewCell {
    
    
    @IBOutlet weak var lblNome: UILabel!
    
    @IBOutlet weak var lblTipo: UILabel!
    
    @IBOutlet weak var lblHospital: UILabel!
    
    @IBOutlet weak var lblNmrSaude: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
