//
//  MetalCell.swift
//  BankProject
//
//  Created by Mac on 19/01/2023.
//

import UIKit

class MetalCell: UITableViewCell {
    static let id = String(describing: MetalCell.self)
    
    @IBOutlet weak var metal10Outlet: UILabel!
    @IBOutlet weak var metal20Outlet: UILabel!
    @IBOutlet weak var metal50Outlet: UILabel!
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var filials_textOutlet: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func set(metal: MetalModel) {
        self.metal10Outlet.text = "\(metal.ZOL_10_out)"
        self.metal20Outlet.text = "\(metal.ZOL_20_out)"
        self.metal50Outlet.text = "\(metal.ZOL_50_out)"
        self.nameOutlet.text = "\(metal.name)"
        self.filials_textOutlet.text = "\(metal.filials_text)"
    }
}
