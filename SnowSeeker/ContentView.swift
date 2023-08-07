//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Fauzan Dwi Prasetyo on 05/08/23.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    
    @State private var searchedText = ""
    
    // MARK: - Challenge 3
    @State private var showingSortFilter = false
    @State private var sortedAlphabet = 0
    @State private var sortedCountry = SortingView.countries
    
    var filteredResorts: [Resort] {
        if searchedText.isEmpty {
            return resorts
        } else {
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchedText)}
        }
    }
    
    // MARK: - Challenge 3
    var sortedResorts: [Resort] {
        let sortedResortsCountry = filteredResorts.filter { sortedCountry.contains($0.country) }
        
        if sortedAlphabet == 0 {
            return sortedResortsCountry.sorted { $0.name < $1.name }
        } else {
            return sortedResortsCountry.sorted { $0.name > $1.name }
        }
    }
    
    var body: some View {
        NavigationView {
            List(sortedResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            }
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchedText, prompt: "Search for a resort")
            .toolbar {
                Button {
                    showingSortFilter = true
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                }
            }
            .sheet(isPresented: $showingSortFilter) {
                SortingView(sortedAlphabet: $sortedAlphabet, sortedCountry: $sortedCountry)
            }
            
            WelcomeView()
        }
        .environmentObject(favorites)
//        .phoneOnlyNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
