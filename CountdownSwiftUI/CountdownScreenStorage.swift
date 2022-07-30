//
//  CountdownScreenStorage.swift
//  CountdownSwiftUI
//
//  Created by Ilya Vinogradov on 30.07.2022.
//

import Foundation
import CoreData
import Combine


class CountdownScreenStorage: NSObject {
    var countdowns = CurrentValueSubject<[Countdown], Never>([])
    private var frc : NSFetchedResultsController<Countdown>
    
    override init() {
        frc = NSFetchedResultsController(fetchRequest: Countdown.fetchRequest(), managedObjectContext: PersistenceController.shared.container.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        frc.delegate = self
        do {
            try frc.performFetch()
        } catch {
            NSLog("Oops, could not fetch songs")
        }
    }
}

extension CountdownScreenStorage: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let countdowns = controller.fetchedObjects as? [Countdown] else {
            return
        }
        self.countdowns.value = countdowns
    }
}
