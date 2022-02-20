//
//  Network.swift
//  ordulugorev
//
//  Created by Furkan Oğuz on 19.02.2022.
//

import Alamofire
import CoreGraphics

class Network {
    
    static var shared = Network()
    
    private let apiKey = "os04rvbNQ1FwrKPTeyJK60ALbwpAdrJZ"
    
    init() {}
    
    func getEvents(completion: @escaping (EventsResponse?) -> ()) {
        AF.request("https://app.ticketmaster.com/discovery/v2/events.json?apikey=\(apiKey)").responseDecodable(of: EventsResponse.self) { (response) in
            if let value = response.value {
                completion(value)
            } else {
                print(response.error)
                completion(nil)
            }
        }
        

    }
}
