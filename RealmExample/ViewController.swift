//
//  ViewController.swift
//  RealmExample
//
//  Created by Mahmoud Waked on 11/8/20.
//

import UIKit
import RealmSwift
import Realm

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // 1- Init Realm
    let realm = try! Realm()
    
    // 2 - Get Data
    lazy var countries: Results<Country> = { self.realm.objects(Country.self) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if(countries.isEmpty) {
            addCountriesFirstTime()
        }
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Count: \(self.countries.count)")
        return self.countries.count
    }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
    
        let country = countries[indexPath.row]

    
    cell.countryLabel.text = country.name
        
    if(country.isFav){
        cell.favImage?.image = UIImage(named: "star")
    }else{
        cell.favImage?.image = UIImage(named: "star_not_fill")
    }
   
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
    
        let country = countries[indexPath.row]
        
        if(country.isFav){
            updateFavorite(id: country.id, isFav: false)
            cell.favImage?.image = UIImage(named: "star_not_fill")
        }else{
            updateFavorite(id: country.id, isFav: true)
            cell.favImage?.image = UIImage(named: "star")
        }
        
        tableView.reloadData()
    }

    func addCountriesFirstTime() {

      // 3 - Insert Data
        
      try! realm.write {
        let country = Country()
        country.id = 1
        country.name = "Egypt"
        realm.add(country)
      }
        
        try! realm.write {
          let country = Country()
            country.id = 2
          country.name = "Saudi Arabia"
          realm.add(country)
        }
        
        try! realm.write {
          let country = Country()
            country.id = 3
          country.name = "Algeria"
            country.isFav = false
          realm.add(country)
        }
        
        try! realm.write {
          let country = Country()
            country.id = 4
          country.name = "Iraq"
            country.isFav = false
          realm.add(country)
        }
        
        try! realm.write {
          let country = Country()
            country.id = 5
          country.name = "Qatar"
            country.isFav = false
          realm.add(country)
        }
        
        try! realm.write {
          let country = Country()
            country.id = 6
          country.name = "Kuwait"
            country.isFav = false
          realm.add(country)
        }
        
        countries = self.realm.objects(Country.self)
        
        tableView.reloadData()
        
        // 4 - Delete
//        realm.delete()
        
        
        
    }
    
    private func updateFavorite(id: Int, isFav: Bool){
        
        // 4 - Update
        
        let countries = realm.objects(Country.self).filter("id = \(id)")
        let realm = try! Realm()
        if let country = countries.first {
            try! realm.write {
                country.isFav = isFav
            }
        }
        
    }
    
    
}

