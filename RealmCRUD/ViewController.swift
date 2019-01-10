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
            car.bodyNumber = "no-9"
            car.name = "car9"
            car.price = 999
            try! realm.write {
                realm.add(car)
            }
        }

        
        func update(){
            let cars = realm.objects(Car.self).filter("name = %@", "car9")
            if let car = cars.first {
                try! realm.write {
                    car.name = "coup9909"
                    
                }
            }
        }//end update
        
        func delete(number:String){
           
            let cars = realm.objects(Car.self).filter("bodyNumber = %@",number )

            print(cars)
            print("cars count:\(cars.count)")
             if cars.count > 0 {
                 for car in cars {
                    print("car delete loop")
                    print(car)
                    /* try! realm.write {
                        realm.delete(car)
                     }*/
                    try? realm.write ({
                        realm.delete(car)
                    })
                 }
             }
        }//end delete
 
        func read() {
            
            let cars =  realm.objects(Car.self)
            if cars.count > 0 {
                for car in cars {
                    print("\(car.bodyNumber):\(car.name):\(car.price)")
                }
            }
        }//end read
        delete(number:"no-2")
       // create()
       // update()
        read()
    }


}

class Car: Object {
    @objc dynamic var bodyNumber: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var price: Int16 = 0
    let cars = List<Car>()
}
