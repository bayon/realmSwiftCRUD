//
//  ViewController.swift
//  RealmCRUD
//
//  Created by Bayon Forte on 1/10/19.
//  Copyright © 2019 Bayon Forte. All rights reserved.
//

import UIKit
//1)
import RealmSwift

class ViewController: UIViewController {
    
    //2)
    let realm:Realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //3)
        func create(){
            let car = Car()
            car.bodyNumber = "no-2"
            car.name = "car2"
            car.price = 8880
            try! realm.write {
                realm.add(car)
            }
        }
/*
        let car = Car()
        car.bodyNumber = "no-2"
        car.name = "car2"
        car.price = 8880
        */
        //4)
        //CREATE
        /*
        try! realm.write {
            realm.add(car)
        }
 */
        
        func update(){
            let cars = realm.objects(Car.self).filter("name = %@", "car2")
            if let car = cars.first {
                try! realm.write {
                    car.name = "coup2"
                    
                }
            }
        }//end update
        //UPDATE
        /*
        let cars = realm.objects(Car.self).filter("name = %@", "car2")
        if let car = cars.first {
            try! realm.write {
                car.name = "coup2"
                
            }
        }
        */
        // DELETE
        /*
        let deleteNumber: String = "no-1"
        let cars = realm.objects(Car.self).filter("bodyNumber = %@","\(deleteNumber) " )
        
        if cars.count > 0 {
            for car in cars {
                try! realm.write {
                    realm.delete(car)
                }
            }
        }
        */
        func delete(){
            // DELETE

             let deleteNumber: String = "no-1"
             let cars = realm.objects(Car.self).filter("bodyNumber = %@","\(deleteNumber) " )
            
             if cars.count > 0 {
                 for car in cars {
                     try! realm.write {
                        realm.delete(car)
                     }
                 }
             }
        }//end delete
 
        func read() {
            //5)
            //READ
            
            let cars =  realm.objects(Car.self)
            if cars.count > 0 {
                for car in cars {
                    print("\(car.bodyNumber):\(car.name):\(car.price)")
                }
            }
        }//end read
 
        
        read()
    }


}

class Car: Object {
    @objc dynamic var bodyNumber: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var price: Int16 = 0
    let cars = List<Car>()
}
