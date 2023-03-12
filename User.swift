//
//  User.swift
//  Plant Monitor
//
//  Created by Harrison Cutrone on 3/3/23.
//

import Foundation
import SwiftUI

struct User: Hashable, Codable {
    var id: Int
    var plants: [PlantObject]
}

struct PlantObject: Hashable, Codable, Identifiable {
    let id: UUID = UUID()
    var plantName: String
    var notifications: [NotificationsObject]

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var sunlightData: PlantAttribute
    private var temperatureData: PlantAttribute
    private var pHData: PlantAttribute
    private var moistureData: PlantAttribute
    struct PlantAttribute: Hashable, Codable {
        var label: String
        var goal: String
        var percentage: String
    }
    
    var sunlightAttribute: Attribute {
        Attribute(label: sunlightData.label, percentage: sunlightData.percentage, goal: sunlightData.goal)
    }
    var temperatureAttribute: Attribute {
        Attribute(label: temperatureData.label, percentage: temperatureData.percentage, goal: temperatureData.goal)
    }
    var moistureAttribute: Attribute {
        Attribute(label: moistureData.label, percentage: moistureData.percentage, goal: moistureData.goal)
    }
    var pHAttribute: Attribute {
        Attribute(label: pHData.label, percentage: pHData.percentage, goal: pHData.goal)
    }
}

struct NotificationsObject: Hashable, Codable, Identifiable {
    var label: String
    var value: Bool
    var id: String { label }
}
