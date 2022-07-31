//
//  RegisterCountdownView.swift
//  CountdownSwiftUI
//
//  Created by Ilya Vinogradov on 31.07.2022.
//

import SwiftUI

struct RegisterCountdownView: View {
    @ObservedObject var viewModel = RegisterViewModel()
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $viewModel.nameTextField)
                }
                Section {
                    ColorPicker("Choose timer color", selection: $viewModel.color)
                    DatePicker("Date to", selection: $viewModel.date)
                }
                
            }
            .navigationTitle("New countdown")
            .alert("Some fields are not filled!", isPresented: $viewModel.showingAlert) {
                Button("OK", role: .cancel) {}
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Complete") {
                        viewModel.addToBase()
                    }
                }

            }
        }
        .onReceive(viewModel.viewDismissalModePublisher) { shouldDissmis in
            if shouldDissmis {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct RegisterCountdownView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterCountdownView()
    }
}
