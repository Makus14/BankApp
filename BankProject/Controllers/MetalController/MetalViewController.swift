//
//  MetalViewController.swift
//  BankProject
//
//  Created by Mac on 19/01/2023.
//

import UIKit

class MetalViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayMetalATM = [MetalModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        MetalProvider().getMetal { metal in
            self.arrayMetalATM = metal
            self.tableView.reloadData()
        } failure: {
            
        }

    }
    

}

extension MetalViewController: UITableViewDelegate {
    
}

extension MetalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMetalATM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MetalCell", for: indexPath)
        guard let metalCell = cell as? MetalCell else { return cell }
        
        metalCell.set(metal: arrayMetalATM[indexPath.row])
        return metalCell
    }
    
    
}
