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

    var plantIndex: Int {
        modelData.users[0].plants.firstIndex(where: { $0.id == plant.id})!
    }

    func disableAllNotifications() {
        for index in modelData.users[0].plants[plantIndex].notifications.indices {
            modelData.users[0].plants[plantIndex].notifications[index].value = false
        }
    }

    func enableAllNotifications() {
        for index in modelData.users[0].plants[plantIndex].notifications.indices {
            modelData.users[0].plants[plantIndex].notifications[index].value = true
        }
    }

    var body: some View {
        VStack {
            Text(plant.plantName + "'s Notifications")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            VStack {
                ForEach(modelData.users[0].plants[plantIndex].notifications.indices, id: \.self) { index in
                    var valueBinding: Binding<Bool> = Binding(get: {
                        modelData.users[0].plants[plantIndex].notifications[index].value
                    }, set: { newValue in
                        modelData.users[0].plants[plantIndex].notifications[index].value = newValue
                    })
                    NotifToggle(label: modelData.users[0].plants[plantIndex].notifications[index].label, isOn: valueBinding)
                }

                Button(action: enableAllNotifications) {
                    Text("Turn on all notifications")
                }
            }
            .padding()
            Spacer()
            Button(action: disableAllNotifications) {
                Text("Turn off all notifications")
            }
        }
        .padding(.horizontal)
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
