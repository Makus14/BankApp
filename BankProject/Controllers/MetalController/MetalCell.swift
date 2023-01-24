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
    
    func set(name: String, filials_text: String, _10_out: String, _20_out: String, _50_out: String) {
        self.metal10Outlet.text = "\(_10_out)"
        self.metal20Outlet.text = "\(_20_out)"
        self.metal50Outlet.text = "\(_50_out)"
        self.nameOutlet.text = "\(name)"
        self.filials_textOutlet.text = "\(filials_text)"
    }
    
}
