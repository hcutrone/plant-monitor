//
//  Attributes.swift
//  Plant Monitor
//
//  Created by Harrison Cutrone on 3/2/23.
//

import SwiftUI

struct Attribute: View {
    var label: String
    var percentage: String
    var goal: String
    func foo() {}
    
    var body: some View {
        Button(action: foo) {
            VStack {
                Text(label)
                    .frame(width: 200)
                    .font(.title)
                Text(percentage + "%")
                    .frame(height: 120)
                Text(goal)
                    .font(.title2)
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(.green, lineWidth: 4)
            }
        }
    }
}

struct Attribute_Previews: PreviewProvider {
    static var previews: some View {
        Attribute(label: "Sunlight", percentage: "60", goal: "6 hrs/day")
    }
}
