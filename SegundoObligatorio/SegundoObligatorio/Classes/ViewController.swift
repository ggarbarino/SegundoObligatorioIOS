//
//  ViewController.swift
//  SegundoObligatorio
//
//  Created by Diego Pais on 5/18/16.
//  Copyright © 2016 Universidad Catolica. All rights reserved.
//

import UIKit
import SwiftLocation
import DateTools



class ViewController: UIViewController  {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherIconLabel: UILabel!
    @IBOutlet weak var dayWeathers: UICollectionView!
    let prefs = NSUserDefaults.standardUserDefaults()
    
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        condition: weather.id
//        iconString: weather.icon
//        ver: http://openweathermap.org/current#parameter
//        http://openweathermap.org/weather-conditions
        

    }
    
    override func viewDidAppear(animated: Bool) {
        
    
    
        
        APIClient.sharedClient.obtainCoordinates { () -> Void in
            
            APIClient.sharedClient.weatherOnCompletion { (weather, error) -> Void in
                
                if let weather = weather {
                    self.weather = weather
                    
                    
                    self.weatherIconLabel.text = WeatherIcon(condition: 500, iconString: "10d").iconText
                    
                    
                    
                    self.cityName.text = weather.city
                    self.temperature.text = weather.list?[0].temp?.description
                  //  self.weatherIconLabel.text = WeatherIcon(condition: weather.list![0].listw![0].id!, iconString: weather.list![0].listw![0].icon!).iconText
                    print(weather.list![0].listw![0].id)
                    print(weather.list![0].listw![0].icon!)
                    weather.list?.removeFirst()
                    
                    
                    //  self.dayWeathers.delegate = self
                    self.dayWeathers.dataSource = self
                    
                    self.dayWeathers.reloadData()
                    
                    
                    //    var actualDate: NSDate = (weather.list?[1].date)!
                    
                    
                    //    self.dateExample.text = actualDate.formattedDateWithFormat("EEE")
                    
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private struct Storyboard {
        static let CellIdentifier = "dayCell"
    }

}

extension ViewController : UICollectionViewDataSource
{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        
        return weather?.list?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath) as! WeatherCollectionViewCell
        
        cell.list = self.weather?.list?[indexPath.row]
        cell.interestTempLabel.text = cell.list.temp?.description
        cell.interestDayLabel.text = cell.list.date?.formattedDateWithFormat("EEE")
        cell.featuredIconView.text = WeatherIcon(condition: cell.list.listw![0].id!, iconString: cell.list.listw![0].icon!).iconText
        return cell
    }
    
}

