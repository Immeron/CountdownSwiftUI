//
//  ContentView.swift
//  CountdownSwiftUI
//
//  Created by Ilya Vinogradov on 30.07.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @ObservedObject var viewModel: CountdownViewModel = CountdownViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.countdowns) { item in
                   
                }
            }
            .navigationTitle("Countdown")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
