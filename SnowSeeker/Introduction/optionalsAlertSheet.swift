//
//  optionalsAlertSheet.swift
//  SnowSeeker
//
//  Created by Fauzan Dwi Prasetyo on 05/08/23.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct optionalsAlertSheet: View {
    @State private var selectedUser: User?
    @State private var isShowingUser = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                selectedUser = User()
                isShowingUser = true
            }
//            .sheet(item: $selectedUser) { user in
//                Text(user.id)
//            }
//            .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//                Button(user.id) {}
//            }
            .alert("Welcome", isPresented: $isShowingUser) { }
    }
}

struct optionalsAlertSheet_Previews: PreviewProvider {
    static var previews: some View {
        optionalsAlertSheet()
    }
}
