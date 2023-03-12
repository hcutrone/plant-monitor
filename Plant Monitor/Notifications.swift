//
//  Notifications.swift
//  Plant Monitor
//
//  Created by Harrison Cutrone on 3/3/23.
//

import SwiftUI

struct Notifications: View {
    @EnvironmentObject var modelData: ModelData
    var plant: PlantObject
    @State private var all: Bool = false

    var plantIndex: Int {
        modelData.users[0].plants.firstIndex(where: { $0.id == plant.id})!
    }

    func disableAllNotifications() {
        modelData.users[0].plants[plantIndex].notifications.moisture = false
        modelData.users[0].plants[plantIndex].notifications.temperature = false
        modelData.users[0].plants[plantIndex].notifications.sunlight = false
        modelData.users[0].plants[plantIndex].notifications.pH = false
        all = false
    }
    
    func updateAll() {
        all = modelData.users[0].plants[plantIndex].notifications.moisture &&
                modelData.users[0].plants[plantIndex].notifications.temperature &&
                modelData.users[0].plants[plantIndex].notifications.sunlight &&
                modelData.users[0].plants[plantIndex].notifications.pH
    }
    
    var body: some View {
        VStack {
            Text(plant.plantName + "'s Notifications")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            VStack {
                NotifToggle(label: "Soil Moisture", isOn: $modelData.users[0].plants[plantIndex].notifications.moisture)
                    .onChange(of: modelData.users[0].plants[plantIndex].notifications.moisture) { value in
                        updateAll()
                    }
                NotifToggle(label: "Temperature", isOn: $modelData.users[0].plants[plantIndex].notifications.temperature)
                    .onChange(of: modelData.users[0].plants[plantIndex].notifications.temperature) { value in
                        updateAll()
                    }
                NotifToggle(label: "Sunlight", isOn: $modelData.users[0].plants[plantIndex].notifications.sunlight)
                    .onChange(of: modelData.users[0].plants[plantIndex].notifications.sunlight) { value in
                        updateAll()
                    }
                NotifToggle(label: "pH", isOn: $modelData.users[0].plants[plantIndex].notifications.pH)
                    .onChange(of: modelData.users[0].plants[plantIndex].notifications.pH) { value in
                        updateAll()
                    }
                NotifToggle(label: "All", isOn: $all)
                    .onChange(of: all) { value in
                        if (value) {
                            modelData.users[0].plants[plantIndex].notifications.moisture = true
                            modelData.users[0].plants[plantIndex].notifications.temperature = true
                            modelData.users[0].plants[plantIndex].notifications.sunlight = true
                            modelData.users[0].plants[plantIndex].notifications.pH = true
                        }
                    }
            }
            .padding()
            Spacer()
            Button(action: disableAllNotifications) {
                Text("Turn off all notifications")
            }
        }
        .padding(.horizontal)
        .onAppear {
            updateAll()
        }
    }
    
    struct NotifToggle: View {
        var label: String
        var isOn: Binding<Bool>
        var body: some View {
            Toggle(label, isOn: isOn)
                .padding()
                .font(.title3)
        }
    }
}


struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications(plant: ModelData().users[0].plants[0]).environmentObject(ModelData())
    }
}
