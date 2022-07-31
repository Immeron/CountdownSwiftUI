//
//  RegisterViewModel.swift
//  CountdownSwiftUI
//
//  Created by Ilya Vinogradov on 31.07.2022.
//

import SwiftUI
import Combine


class RegisterViewModel: ObservableObject {
    @Published var nameTextField = ""
    @Published var color = Color.white
    @Published var date = Date()
    
    @Published var showingAlert = false
    
    var viewDismissalModePublisher = PassthroughSubject<Bool, Never>()
    private var shouldDismissView = false {
        didSet {
            viewDismissalModePublisher.send(shouldDismissView)
        }
    }
    
    func addToBase() {
        if nameTextField == "" || date <= Date() {
            showingAlert = true
            return
        }
        let countdown = Countdown(context: PersistenceController.shared.container.viewContext)
        countdown.id = UUID()
        countdown.name = self.nameTextField
        countdown.endTime = self.date
        
        PersistenceController.shared.saveContext()
        
        shouldDismissView = true
    }
    
}
