//
//  NewPlantView.swift
//  Plant Monitor
//
//  Created by Harrison Cutrone on 3/4/23.
//

import SwiftUI

struct NewPlantView: View {
    func foo() {}
    var body: some View {
        VStack {
            Image("Plant")
            Text("Tell us about your plant:").padding()
            NavigationLink {
                KnowSpecies()
            } label: {
                Text("I know the species!")
            }.padding()
            NavigationLink {
                DoNotKnowSpecies()
            } label: {
                Text("I don't know the species!")
            }
        }.padding(.bottom)
    }
}

struct KnowSpecies: View {
    @State private var species: String = ""
    @State private var moisture: String = ""
    @State private var sunlight: String = ""
    @State private var temperature: String = ""
    @State private var pH: String = ""
    var body: some View {
        VStack {
            Text("New Plant").font(.title)
            HStack {
                Text("Species: ")
                TextField("String of Pearls", text: $species)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(.black, lineWidth: 1))
            }.padding()
            Spacer()
            Text("Here's what we found:").font(.title2)
            LabeledTextBox(label: "Moisture", variable: $moisture)
            LabeledTextBox(label: "Sunlight", variable: $sunlight)
            LabeledTextBox(label: "Temperature", variable: $temperature)
            LabeledTextBox(label: "pH", variable: $pH)
            Spacer()
        }
    }
}

struct LabeledTextBox: View {
    var label: String
    var variable: Binding<String>
    var body: some View {
        HStack {
            Text(label + ": ")
            TextField("", text: variable)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(.black, lineWidth: 1))
        }.padding()
    }
}

struct DoNotKnowSpecies: View {
    var body: some View {
        Text("Do not know the species")
    }
}


struct NewPlantView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlantView()
        KnowSpecies()
    }
}
