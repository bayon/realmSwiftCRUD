//
//  OtherViewController.swift
//  RealmCRUD
//
//  Created by Bayon Forte on 1/10/19.
//  Copyright © 2019 Bayon Forte. All rights reserved.
//

import UIKit

import RealmSwift

 

class OtherViewController: UIViewController {

    
    var realm:Realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      
        
        readAll()
    }
    
    func readAll() {
        let cars =  realm.objects(Car.self)
        if cars.count > 0 {
            for car in cars {
                print("vc 2 - - - -- -  -\(car.bodyNumber):\(car.name):\(car.price)")
            }
        }
    }//end readAll

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
