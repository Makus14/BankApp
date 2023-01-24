//
//  CollectionViewCityCell.swift
//  BankProject
//
//  Created by Mac on 17/01/2023.
//

import UIKit

class CollectionViewCityCell: UICollectionViewCell {

    static let id = String(describing: CollectionViewCityCell.self)
    
    @IBOutlet weak var labelCityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setName(massNames: String) {
        
        labelCityName.text = massNames
        
    }
    
}
