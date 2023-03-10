//
//  MyPlantsView.swift
//  Plant Monitor
//
//  Created by Harrison Cutrone on 3/2/23.
//

import SwiftUI

struct MyPlantsView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var plantQuery: String = ""
    
    func foo() {}

    var body: some View {
        NavigationView {
            VStack {
                Text("My Plants")
                    .font(.largeTitle)
                TextField(
                        "Search - this doesn't work",
                        text: $plantQuery
                )
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(.black, lineWidth: 1))
                ScrollView(){
                    ForEach(modelData.users[0].plants) { plant in
                        NavigationLink {
                            HomeView(plant: plant).navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        } label: {
                            Plant(plantName: plant.plantName, plantImage: plant.image)
                        }
                    }.padding(.horizontal)
                }
                Spacer()
                NavigationLink {
                    NewPlantView()
                } label: {
                    Text("New Plant")
                }
            }
            .padding()
        }
    }
}

struct Plant: View {
    var plantName: String
    var plantImage: Image
    
    var body: some View {
        HStack {
            PlantImage(plantImage: plantImage).padding()
            Text(plantName).padding(.trailing)
        }
        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(.green, lineWidth: 2))
        .padding(.vertical)
    }
}

struct MyPlantsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlantsView().environmentObject(ModelData())
    }
}
