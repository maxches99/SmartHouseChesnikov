//
//  ProfileView.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 01.03.2021.
//

import SwiftUI
import Neumorphic

struct ProfileView: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("Max Chesnikov")
                .font(.system(size: 14, weight: .medium, design: .rounded))
            Image("photo")
                .resizable()
                .frame(width: 20, height: 20)
                .cornerRadius(7)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20).fill(Color.clear)
                .softInnerShadow(RoundedRectangle(cornerRadius: 20), darkShadow: Color.Neumorphic.darkShadow, lightShadow: Color.Neumorphic.lightShadow, spread: 0.05, radius: 2)
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
