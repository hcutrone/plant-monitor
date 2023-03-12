//
//  HomeView.swift
//  Plant Monitor
//
//  Created by Harrison Cutrone on 3/2/23.
//

import SwiftUI

struct HomeView: View {
    var plant: PlantObject

    func foo() {}

    var body: some View {
        GeometryReader { geo in
            VStack{
                HStack(spacing: 0) {
                    NavigationLink {
                        MyPlantsView().navigationBarBackButtonHidden(true)
                    } label: {
                        VStack{
                            Image("Plant")
                            Text("My Plants")
                        }
                        .frame(width: geo.size.width * (1/3))
                    }
                    PlantImage(plantImage: plant.image)
                        .frame(width: geo.size.width * (1/3))
                    NavigationLink {
                        Notifications(plant: plant)
                    } label: {
                        Text("Bell")
                            .frame(width: geo.size.width * (1/3))
                    }
                }.padding(.bottom)

                Text(plant.plantName)
                    .font(.largeTitle)

                ScrollView {
                    plant.sunlightAttribute.padding()
                    plant.temperatureAttribute.padding()
                    plant.moistureAttribute.padding()
                    plant.pHAttribute.padding()
                }.padding(.horizontal)
                Spacer()

                HStack {
                    Button(action: foo) {
                        Text("Settings")
                    }
                    Spacer()
                    Button(action: foo) {
                        Text("Share")
                    }
                }
                .padding(.top)
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(plant: UserData(user: load("userData.json")).plants[0])
    }
}
