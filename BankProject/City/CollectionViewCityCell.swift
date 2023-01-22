//
//  CollectionViewCityCell.swift
//  BankProject
//
//  Created by Mac on 17/01/2023.
//

import UIKit

class CollectionViewCityCell: UICollectionViewCell {

    static let id = String(describing: CollectionViewCityCell.self)
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setName(massNames: String) {
        
        buttonOutlet.setTitle(massNames, for: .normal)
        
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        
        
    }
    

}
