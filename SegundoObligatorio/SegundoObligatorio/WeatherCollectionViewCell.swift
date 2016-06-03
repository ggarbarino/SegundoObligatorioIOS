//
//  interestCollectionViewCell.swift
//  SegundoObligatorio
//
//  Created by Diego Lázaro on 5/26/16.
//  Copyright © 2016 Universidad Catolica. All rights reserved.
//

import UIKit
import DateTools

class WeatherCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Public API
    var list: List! {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Private
   
    @IBOutlet weak var interestDayLabel: UILabel!
    @IBOutlet weak var featuredIconView: UILabel!
    @IBOutlet weak var interestTempLabel: UILabel!

    private func updateUI() {

        interestTempLabel.text = list.temp?.description
        interestDayLabel.text = list.date?.formattedDateWithFormat("EEE")
        featuredIconView.text = WeatherIcon(condition: list.listw![0].id!, iconString: list.listw![0].icon!).iconText
        
       
        
    }
    
}

