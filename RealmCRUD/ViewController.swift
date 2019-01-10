//
//  ViewController.swift
//  RealmCRUD
//
//  Created by Bayon Forte on 1/10/19.
//  Copyright © 2019 Bayon Forte. All rights reserved.
//

import UIKit

import RealmSwift

class Car: Object {
    
    @objc dynamic var bodyNumber: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var price: Int16 = 0
    let cars = List<Car>()
    
}




class ViewController: UIViewController {
    
    let realm:Realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        // delete(number:"no-2")
        // create(bodyNumber:"no-307", name:"truck307", price:4000 )
        // updateCarName(name:"car77",newName:"T-Bird77")
        // read(number: "no-77")
        
        
        readAll()
        
        //createDog(breed:"german shepard", name:"Thunder", price:400 )
        // createDog(breed:"hound dog", name:"Sniffer", price:600 )
        readAllDogs()
        
    }//end viewDidLoad
    
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
    }//end readAll
    
    func read(number: String){
        let cars = realm.objects(Car.self).filter("bodyNumber = %@",number )
        if cars.count > 0 {
            for car in cars {
                print("\(car.bodyNumber):\(car.name):\(car.price)")
            }
        }
    }//end read


    
    
    func createDog(breed:String, name:String, price:Int16 ){
         let dog = Dog()
        dog.breed = breed
        dog.name = name
        dog.price = price
        try! realm.write {
            realm.add(dog)
        }
    }
    
    func readAllDogs() {
        let dogs =  realm.objects(Dog.self)
        if dogs.count > 0 {
            for dog in dogs {
                print("\(dog.breed):\(dog.name):\(dog.price)")
            }
        }
    }//end readAll
   
}


