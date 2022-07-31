//
//  CountdownViewModel.swift
//  CountdownSwiftUI
//
//  Created by Ilya Vinogradov on 30.07.2022.
//

import SwiftUI
import Combine


class CountdownViewModel: ObservableObject {
    @Published var countdowns: [Countdown] = []

    let context = PersistenceController.shared.container.viewContext
    private var cancellable = Set<AnyCancellable>()
    var dataStorage = CountdownScreenStorage()
    
    init() {
        dataStorage.countdowns.sink { countdowns in
            self.countdowns = countdowns
        }
        .store(in: &cancellable)
    }

}
