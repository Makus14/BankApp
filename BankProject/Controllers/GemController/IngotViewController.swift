//
//  IngotViewController.swift
//  BankProject
//
//  Created by Mac on 19/01/2023.
//

import UIKit

class IngotViewController: UIViewController {

    @IBOutlet weak var viewController: UITableView!
    
    var arrayGemATM = [GemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewController.dataSource = self
        viewController.delegate = self
        
        GemProvider().getGem { gems in
            self.arrayGemATM = gems
            self.viewController.reloadData()
        } failure: {
            
        }

    }
    
}

extension IngotViewController: UITableViewDelegate {
    
}

extension IngotViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayGemATM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GemCell", for: indexPath)
        guard let gemCell = cell as? GemCell else { return cell }
        
        gemCell.set(gem: arrayGemATM[indexPath.row])
        return gemCell
    }
}
