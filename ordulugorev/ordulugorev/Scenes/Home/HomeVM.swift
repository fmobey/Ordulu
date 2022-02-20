//
//  HomeVM.swift
//  ordulugorev
//
//  Created by Furkan Oğuz on 19.02.2022.
//

import Foundation

class HomeVM: BaseVM {
    
    var reloadTableView: (() -> ())?
    var events: [Event] = []
    var tempEvents: [Event] = []
    
    func getData() {
        Network.shared.getEvents() { response in
            self.events = response?.embedded?.events ?? []
            self.tempEvents = response?.embedded?.events ?? []
            self.reloadTableView?()
        }
    }
    
    func aramaYap(text: String) {
        events = tempEvents.filter({ $0.name?.contains(text) ?? false })
        if text == "" {
            events = tempEvents
        }
        reloadTableView?()
    }
    
    func sirala() {
        events = events.sorted(by: { ($0.name ?? "") < ($1.name ?? "") })
        reloadTableView?()
    }
}
