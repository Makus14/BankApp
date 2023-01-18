//
//  CollectionViewBankCell.swift
//  BankProject
//
//  Created by Mac on 17/01/2023.
//

import UIKit

class CollectionViewBankCell: UICollectionViewCell {

    static let id = String(describing: CollectionViewBankCell.self)
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setName(massBank: String) {
        
        buttonOutlet.setTitle(massBank, for: .normal)
        
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        
    }
    
}
