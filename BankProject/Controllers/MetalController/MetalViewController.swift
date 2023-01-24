//
//  MetalViewController.swift
//  BankProject
//
//  Created by Mac on 19/01/2023.
//

import UIKit

class MetalViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    
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
    
    @IBAction func segmentControllerDidTap(_ sender: Any) {
        switch segmentController.selectedSegmentIndex {
            case 0:
                tableView.reloadData()
            case 1:
                tableView.reloadData()
            case 2:
                tableView.reloadData()
            default:
                break
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
        let arr = arrayMetalATM[indexPath.row]
        if segmentController.selectedSegmentIndex == 0 {
            metalCell.set(name: arr.name, filials_text: arr.filials_text, _10_out: arr.ZOL_10_out, _20_out: arr.ZOL_20_out, _50_out: arr.ZOL_50_out)
        } else if segmentController.selectedSegmentIndex == 1 {
            metalCell.set(name: arr.name, filials_text: arr.filials_text, _10_out: arr.PL_10_out, _20_out: arr.PL_20_out, _50_out: arr.PL_50_out)
        } else if segmentController.selectedSegmentIndex == 2 {
            metalCell.set(name: arr.name, filials_text: arr.filials_text, _10_out: arr.SIL_10_out, _20_out: arr.SIL_20_out, _50_out: arr.SIL_50_out)
        }
        
        return metalCell
    }
    
    
}
