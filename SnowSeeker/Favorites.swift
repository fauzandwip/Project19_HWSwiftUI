//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Fauzan Dwi Prasetyo on 07/08/23.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        resorts = []
        load()
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func load() {
        // MARK: - Challenge 2
        
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                resorts = decoded
            }
        }
    }
    
    func save() {
        // MARK: - Challenge 2
        
        do {
            let decoded = try JSONEncoder().encode(resorts)
            UserDefaults.standard.set(decoded, forKey: saveKey)
        } catch {
            fatalError("Failed save favorites data: \(error.localizedDescription)")
        }
    }
}
