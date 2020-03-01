//
//  MyPlacesViewController.swift
//  AQI_Innovacer
//
//  Created by Akshat Sharma on 01/03/20.
//  Copyright © 2020 aks. All rights reserved.
//

import UIKit

class MyPlacesViewController: UIViewController {
    
    let cellIdentifier = "myPlacesCellIdentifier"
    
    var myCities: [City] = []
    
    var networkTasks: [URLSessionDataTask] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "AQI Indexes"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myCities.removeAll()
        if let storedmyCities = Util.getAllCities() {
            for city in storedmyCities {
                if city.isSelected {
                    myCities.append(city)
                }
            }
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
        tableView.register(MyPlaceTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
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
        let updateButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gobackward"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(updateAQI))
        self.navigationItem.rightBarButtonItem = updateButton
    }
    
    @objc func updateAQI() -> Void {
//        networkTasks.removeAll()
//        for city in myCities {
//            if let url = URL(string: Util.getMesurementsURL(forCity: city.cityName)) {
//                weak var weakSelf = self
//                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//                    if let data = data {
//                        if let value = Util.getPM25Value(fromData: data), let cityName = Util.getCityName(fromData: data) {
//                            let aqi = Util.calculateAQI(pm25: value)
//                            if let weakSelf = weakSelf {
//                                DispatchQueue.main.async {
//                                    weakSelf.setAQIToCity(aqi: aqi, cityName: cityName)
//                                    weakSelf.tableView.reloadData()
//                                }
//                            }
//                        }
//                    }
//                }
//                task.resume()
//                networkTasks.append(task)
//            }
//        }
    }
    
    func setAQIToCity(aqi: Int, cityName: String) {
//        for (index, city) in myCities.enumerated() {
//            if city.cityName == cityName {
//                myCities[index].setAQIIndex(value: aqi)
//            }
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        cancelALLPendingTasks()
    }
    
    func cancelALLPendingTasks() -> Void {
        for task in networkTasks {
            task.cancel()
        }
    }

}


extension MyPlacesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if let cell = cell as? MyPlaceTableViewCell {
            cell.selectionStyle = .none
            cell.updateView(withCity: myCities[indexPath.row])
        }
        return cell
    }
    
}

extension MyPlacesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
