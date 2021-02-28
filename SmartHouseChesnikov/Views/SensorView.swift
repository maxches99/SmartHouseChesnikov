//
//  SensorView.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 26.02.2021.
//

import SwiftUI
import Neumorphic

struct SensorView: View {
    
    let sensor: Sensor
    
    var body: some View {
        VStack {
            Text(sensor.name ?? "")
                .font(.system(size: 22, weight: .bold, design: .rounded))
            switch sensor.type {
            case .smoke:
                Image(systemName: sensor.value ?? "")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .padding(.top, 16)
            default:
                Text(sensor.value ?? "")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .padding(.top, 16)
            }
        }
        .padding()
        .frame(maxWidth: 200, maxHeight: 200)
        .background(
            RoundedRectangle(cornerRadius: 30).fill(Color.clear)
                .softInnerShadow(RoundedRectangle(cornerRadius: 30), darkShadow: Color.Neumorphic.darkShadow, lightShadow: Color.Neumorphic.lightShadow, spread: 0.05, radius: 2)
        )
    }
}

struct SensorView_Previews: PreviewProvider {
    static var previews: some View {
        SensorView(sensor: Sensor.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
