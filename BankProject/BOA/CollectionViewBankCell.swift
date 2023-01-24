//
//  CollectionViewBankCell.swift
//  BankProject
//
//  Created by Mac on 17/01/2023.
//

import UIKit

class CollectionViewBankCell: UICollectionViewCell {

    static let id = String(describing: CollectionViewBankCell.self)
    
    @IBOutlet weak var labelNameOfUnit: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func setName(massBank: String) {
        
        labelNameOfUnit.text = massBank
        
    }
    
}
