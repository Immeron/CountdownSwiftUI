//
//  ContentView.swift
//  CountdownSwiftUI
//
//  Created by Ilya Vinogradov on 30.07.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var modalPresented = false
    @ObservedObject var viewModel: CountdownViewModel = CountdownViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.countdowns) { item in
                    Text(item.name ?? "")
                }
            }
            .navigationTitle("Countdown")
            .toolbar {
                Button {
                    modalPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                }

            }
            .sheet(isPresented: $modalPresented) {
                RegisterCountdownView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
