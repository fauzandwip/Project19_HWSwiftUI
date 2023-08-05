//
//  sideView.swift
//  SnowSeeker
//
//  Created by Fauzan Dwi Prasetyo on 05/08/23.
//

import SwiftUI

struct sideView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New Secondary")
            } label: {
                Text("Hello, World!")
                    .navigationTitle("Primary")
            }
            
            Text("Secondary")
            
//            Text("Third")
        }
    }
}

struct sideView_Previews: PreviewProvider {
    static var previews: some View {
        sideView()
    }
}
