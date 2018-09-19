//
//  Model.swift
//  Weather
//
//  Created by Prog on 18/09/18.
//  Copyright © 2018 Cesar Franco. All rights reserved.
//

import Foundation

struct Main : Decodable{
    let temp : Float
    let tempMin : Float
    let tempMax : Float
}

struct Root : Decodable {
    let main : Main
}
