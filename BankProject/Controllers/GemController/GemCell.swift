//
//  GemCell.swift
//  BankProject
//
//  Created by Mac on 19/01/2023.
//

import UIKit

class GemCell: UITableViewCell {
    static let id = String(describing: GemCell.self)
    
    @IBOutlet weak var attestatOutlet: UILabel!
    @IBOutlet weak var name_ruOutlet: UILabel!
    @IBOutlet weak var graniOutlet: UILabel!
    @IBOutlet weak var weightOutlet: UILabel!
    @IBOutlet weak var colorOutlet: UILabel!
    @IBOutlet weak var costOutlet: UILabel!
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var numberOfATM: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func set(gem: GemModel) {
        self.attestatOutlet.text = "\(gem.attestat)"
        self.name_ruOutlet.text = "\(gem.name_ru)"
        self.graniOutlet.text = "\(gem.grani)"
        self.weightOutlet.text = "\(gem.weight)"
        self.colorOutlet.text = "\(gem.color)"
        self.costOutlet.text = "\(gem.cost)"
        self.nameOutlet.text = "\(gem.name)"
        self.numberOfATM.text = "\(gem.filials_text)"
    }
   

}
