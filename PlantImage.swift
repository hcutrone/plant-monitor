//
//  CircleImage.swift
//  Plant Monitor
//
//  Created by Harrison Cutrone on 3/2/23.
//

import SwiftUI

struct PlantImage: View {
    var plantImage: Image

    var body: some View {
        plantImage
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(.green, lineWidth: 4)
            }
            .shadow(radius: 7)
            
    }
}

struct PlantImage_Previews: PreviewProvider {
    static var previews: some View {
        PlantImage(plantImage: Image("MD"))
    }
}
