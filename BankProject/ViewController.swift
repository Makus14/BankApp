//
//  ViewController.swift
//  BankProject
//
//  Created by Mac on 17/01/2023.
//

import UIKit
import GoogleMaps
import CoreLocation

final class ViewController: UIViewController {
    
    @IBOutlet weak var googleMapsView: GMSMapView!
    @IBOutlet weak var filterButtonHaveMoney: UIButton!
    @IBOutlet weak var filterButtonHaveNotMoney: UIButton!
    
    @IBOutlet weak var collectionBOA: UICollectionView!
    
    @IBOutlet weak var collectionCity: UICollectionView!
    
    let massBank: [String] = ["Банкоматы", "Отделения", "Всё"]
    var massNames = [String]() {
        didSet {
            collectionCity.reloadData()
        }
    }
    var cityBank: String?
    var choice: String?
    
    private var allMarkers = [GMSMarker]()
    private var dollarMarkers = [GMSMarker]()
    private var filialMarkers = [GMSMarker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionBOA.delegate = self
        collectionBOA.dataSource = self
        
        collectionCity.delegate = self
        collectionCity.dataSource = self
        
        googleMapsView.isMyLocationEnabled = true
        getBank()
        getFilials()
        registerCell()
    }
    
    private func getFilials() {
        FilialsProvider().getFilials { [weak self] allBank in
            guard let self else { return }
            for bank in allBank {
                if !self.massNames.contains(bank.name) {
                    self.massNames.append(bank.name)
                }
                if self.cityBank == nil {
                    
                } else {
                    if bank.name == self.cityBank! {
                        
                        self.drawMarkers(filials: bank)
                        
                    }
                }
            }
            
        } failure: {
            
        }
    }
    
    private func getBank() {
        BelarusbankProvider().getCurrency { [weak self] allBank in
            guard let self else { return }
            for bank in allBank {
                if !self.massNames.contains(bank.city) {
                    self.massNames.append(bank.city)
                }
                if self.cityBank == nil {
                    
                } else {
                    if bank.city == self.cityBank! {
                        
                        self.drawMarkers(bank: bank)
                    }
                }
                
            }
            
        } failure: { error in
            print(error)
        }
    }
        
    private func drawMarkers(bank: Location) {
        guard let bankXcoordinate = Double(bank.gps_x),
              let bankYcoordinate = Double(bank.gps_y) else { return }
        
        let position = CLLocationCoordinate2D(latitude: bankXcoordinate, longitude: bankYcoordinate)
        let marker = GMSMarker(position: position)
        getAdditionalInfo(marker: marker, title: bank.address, snippet: "\(bank.work_time), в наличии:\(bank.currency)")
        if marker.searchATMWithDollars(currency: bank.currency) {
            dollarMarkers.append(marker)
        }
        allMarkers.append(marker)
        marker.map = googleMapsView
    }
    
    private func drawMarkers(filials: FilialsModel) {
        guard let filialsXcoordinate = Double(filials.GPS_X),
              let filialsYcoordinate = Double(filials.GPS_Y) else { return }
        
        let position = CLLocationCoordinate2D(latitude: filialsXcoordinate, longitude: filialsYcoordinate)
        let marker = GMSMarker(position: position)
        
        filialMarkers.append(marker)
        marker.map = googleMapsView
        
    }
    
    private func registerCell() {
        let nib = UINib(nibName: CollectionViewBankCell.id, bundle: nil)
        collectionBOA.register(nib, forCellWithReuseIdentifier: CollectionViewBankCell.id)
        
        let nib2 = UINib(nibName: CollectionViewCityCell.id, bundle: nil)
        collectionCity.register(nib2, forCellWithReuseIdentifier: CollectionViewCityCell.id)
    }
        
    private func getAdditionalInfo(marker: GMSMarker, title: String, snippet: String) {
        marker.title = title
        marker.snippet = snippet
        if snippet.contains("Круглосуточно") {
            marker.icon = GMSMarker.markerImage(with: .systemGreen)
        }
        googleMapsView.selectedMarker = marker
    }
    
}

extension GMSMarker {
    
    func searchATMWithDollars(currency: String) -> Bool {
        var isHaveDollar = false
        
        if currency.isEmpty {
            isHaveDollar = false
        } else if currency.contains("USD") {
            isHaveDollar = true
        }
        return isHaveDollar
    }
    
}

extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionCity {
            cityBank = massNames[indexPath.row]
            googleMapsView.clear()
            getBank()
        } else if collectionView == collectionBOA {
            choice = massBank[indexPath.row]
            
        }
        }
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionBOA {
            return massBank.count
        } else {
            return massNames.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionBOA {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewBankCell.id, for: indexPath)
            guard let nameCell = cell as? CollectionViewBankCell else { return cell }
            nameCell.setName(massBank: massBank[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCityCell.id, for: indexPath)
            guard let nameCell = cell as? CollectionViewCityCell else { return cell }
            nameCell.setName(massNames: massNames[indexPath.row])
                
            return cell
        }
        
    }
    
    
}

