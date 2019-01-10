//
//  Dog.swift
//  RealmCRUD
//
//  Created by Bayon Forte on 1/10/19.
//  Copyright © 2019 Bayon Forte. All rights reserved.
//

import Foundation

import UIKit

import RealmSwift

class Dog: Object {
    
    @objc dynamic var breed: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var price: Int16 = 0
    let dogs = List<Dog>()
    
}


