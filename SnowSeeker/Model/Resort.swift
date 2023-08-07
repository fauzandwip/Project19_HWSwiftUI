//
//  Resort.swift
//  SnowSeeker
//
//  Created by Fauzan Dwi Prasetyo on 05/08/23.
//

import Foundation

struct Resort: Decodable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]
    
    var facilityTypes: [Facility] {
        return facilities.map(Facility.init)
    }
}
