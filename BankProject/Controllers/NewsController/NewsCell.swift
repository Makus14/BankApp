//
//  NewsCell.swift
//  BankProject
//
//  Created by Mac on 24/01/2023.
//

import UIKit
import SDWebImage

class NewsCell: UITableViewCell {
    static let id = String(describing: NewsCell.self)
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var headerNew: UILabel!
    @IBOutlet weak var information: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func set(imageUrl: String, headerNew: String, information: String) {
        self.imageOutlet.sd_setImage(with: URL(string: imageUrl))
        self.headerNew.text = headerNew
        self.information.text = information
        
    }
    
    func set(image: UIImage) {
        self.imageOutlet.image = image
    }
    
    func loadImage(url: String) {
        DispatchQueue.global().async { [weak self] in
            guard let self,
             let imageUrl = URL(string: url),
                  let data = try? Data(contentsOf: imageUrl),
                  let resultImage = UIImage(data: data)
            else { return }
            
            DispatchQueue.main.async {
                self.imageOutlet.image = resultImage
            }
            
        }
    }

    

}

