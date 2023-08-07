//
//  SortingView.swift
//  SnowSeeker
//
//  Created by Fauzan Dwi Prasetyo on 07/08/23.
//

import SwiftUI


// MARK: - Challenge 3

struct SortingView: View {
    static let countries = ["Austria", "Canada", "France", "Italy", "United States"]
    
    @State private var selectedCountry = 0
    @Binding var sortedAlphabet: Int
    @Binding var sortedCountry: [String]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Alphabet", selection: $sortedAlphabet) {
                    Text("Ascending")
                        .tag(0)
                    Text("Descending")
                        .tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
                
                List {
                    Section("Select Country") {
                        Button {
                            if sortedCountry.count == 5 {
                                sortedCountry.removeAll(keepingCapacity: true)
                            } else {
                                addAllCountries()
                            }
                        } label: {
                            HStack {
                                Text("All")
                                Spacer()
                                Image(systemName: sortedCountry.count == 5 ? "checkmark.square" : "square")
                            }
                        }
                        .foregroundColor(.primary)
                        
                        ForEach(SortingView.countries, id: \.self) { country in
                            Button {
                                if sortedCountry.contains(country) {
                                    removeCountry(country)
                                } else {
                                    addCountry(country)
                                }
                            } label: {
                                HStack {
                                    Text(country)
                                    Spacer()
                                    Image(systemName: sortedCountry.contains(country) ? "checkmark.square" : "square")
                                }
                            }
                            .foregroundColor(.primary)
                        }
                    }
                }
            }
            .navigationTitle("Sort and Filter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func removeCountry(_ country: String) {
        if let index = sortedCountry.firstIndex(of: country) {
            sortedCountry.remove(at: index)
        }
    }
    
    func addCountry(_ country: String) {
        sortedCountry.append(country)
    }
    
    func addAllCountries() {
        sortedCountry.removeAll(keepingCapacity: true)
        sortedCountry = SortingView.countries
    }
}

struct SortingView_Previews: PreviewProvider {
    static var previews: some View {
        SortingView(sortedAlphabet: .constant(0), sortedCountry: .constant(["Canada", "Italy"]))
    }
}
