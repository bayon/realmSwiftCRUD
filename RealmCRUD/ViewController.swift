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
        func create(bodyNumber:String, name:String, price:Int16 ){
            let car = Car()
            car.bodyNumber = bodyNumber
            car.name = name
            car.price = price
            try! realm.write {
                realm.add(car)
            }
        }
        func  updateCarName(name:String,newName:String){
            
            let cars = realm.objects(Car.self).filter("name = %@", name)
            if let car = cars.first {
                try! realm.write {
                    car.name = newName
                }
            }
        }//end updateCarName
        
        
        
        func delete(number:String){
           
            let cars = realm.objects(Car.self).filter("bodyNumber = %@",number )
             if cars.count > 0 {
                 for car in cars {
                    try? realm.write ({
                        realm.delete(car)
                    })
                 }
             }
            
        }//end delete
 
        func readAll() {
            let cars =  realm.objects(Car.self)
            if cars.count > 0 {
                for car in cars {
                    print("\(car.bodyNumber):\(car.name):\(car.price)")
                }
            }
        }//end read
        
        func read(number: String){
            let cars = realm.objects(Car.self).filter("bodyNumber = %@",number )
            if cars.count > 0 {
                for car in cars {
                    print("\(car.bodyNumber):\(car.name):\(car.price)")
                }
            }
        }
        
        
        // delete(number:"no-2")
        // create(bodyNumber:"no-401", name:"coup401", price:20000 )
        // updateCarName(name:"car77",newName:"T-Bird77")
        // read(number: "no-77")
        readAll()
        
    }


}

class Car: Object {
    @objc dynamic var bodyNumber: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var price: Int16 = 0
    let cars = List<Car>()
}
