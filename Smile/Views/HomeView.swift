//
//  ContentView.swift
//  Smile
//
//  Created by David Ding on 7/18/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large) 
                .foregroundColor(.accentColor)
            Text("Home")
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
