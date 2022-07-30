//
//  CountdownViewModel.swift
//  CountdownSwiftUI
//
//  Created by Ilya Vinogradov on 30.07.2022.
//

import Foundation
import Combine


class CountdownViewModel: ObservableObject {
    let context = PersistenceController.shared.container.viewContext
    @Published var countdowns: [Countdown] = []
    private var cancellable = Set<AnyCancellable>()
    var dataStorage = CountdownScreenStorage()
    
    init() {
        dataStorage.countdowns.sink { countdowns in
            self.countdowns = countdowns
        }
        .store(in: &cancellable)
    }
}
