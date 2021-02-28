//
//  SettingsView.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 27.02.2021.
//

import SwiftUI
import Neumorphic

struct SettingsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Настройки")
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                Spacer()
            }
            .padding()
            HStack {
                Button("Добавить новый датчик", action: {})
                .softButtonStyle(RoundedRectangle(cornerRadius: 20))
                Spacer()
            }
            .padding()
            
            HStack {
                Button("Изменить тему", action: {})
                .softButtonStyle(RoundedRectangle(cornerRadius: 20))
                Spacer()
            }
            .padding([.leading, .trailing])
            
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
