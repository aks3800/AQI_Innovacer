//
//  MyPlaceTableViewCell.swift
//  AQI_Innovacer
//
//  Created by Akshat Sharma on 01/03/20.
//  Copyright © 2020 aks. All rights reserved.
//

import UIKit

class MyPlaceTableViewCell: UITableViewCell {
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let aqiLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpView() {
        addSubview(cityLabel)
        NSLayoutConstraint.activate([
            cityLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            cityLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
        addSubview(aqiLabel)
        NSLayoutConstraint.activate([
            aqiLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            aqiLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }
    
    func updateView(withCity city: City) {
        cityLabel.text = city.cityName
        if city.aqiIndex > 0 {
            aqiLabel.text = "\(city.aqiIndex)"
        } else {
            aqiLabel.text = "NA"
        }
    }

}
