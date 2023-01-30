//
//  NewsController.swift
//  BankProject
//
//  Created by Mac on 24/01/2023.
//

import UIKit

class NewsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayNewsATM = [NewsModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        NewsProvider().getNews { news in
            self.arrayNewsATM = news
            self.tableView.reloadData()
        } failure: {
            
        }


    }


}

extension NewsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arr = arrayNewsATM[indexPath.row]
                if let url = URL(string: arr.link) {
                    UIApplication.shared.open(url)
                }
    }
}

extension NewsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNewsATM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        guard let newsCell = cell as? NewsCell else { return cell }
        let arr = arrayNewsATM[indexPath.row]
        
        newsCell.set(imageUrl: arr.img, headerNew: arr.name_ru, information: arr.link)
        
        return newsCell
    }
    
    
}


