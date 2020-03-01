//
//  AllPlacesViewController.swift
//  AQI_Innovacer
//
//  Created by Akshat Sharma on 01/03/20.
//  Copyright © 2020 aks. All rights reserved.
//

import UIKit

class AllPlacesViewController: UIViewController {
    
    let cellIdentifier = "allPlacesCellIdentifier"
    
    var allCities: [City] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setUpView() -> Void {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Selected Places"
        if let storedAllCities = Util.getAllCities() {
            allCities = storedAllCities
            tableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        PersistanceManager.shared.saveContext()
    }

}


extension AllPlacesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.selectionStyle = .none
        cell.accessoryType = .none
        cell.textLabel?.text = allCities[indexPath.row].cityName
        if allCities[indexPath.row].isSelected {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
}


extension AllPlacesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        allCities[indexPath.row].isSelected = !allCities[indexPath.row].isSelected
        tableView.reloadData()
    }
}
