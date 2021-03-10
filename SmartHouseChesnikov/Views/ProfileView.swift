//
//  ProfileView.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 01.03.2021.
//

import SwiftUI
import Neumorphic
import URLImage

struct ProfileView: View {
    
    @State var profile: ProfileResponse
    
    var body: some View {
        HStack(alignment: .center) {
            Text(profile.name ?? "")
                .font(.system(size: 14, weight: .medium, design: .rounded))
            if let url = URL(string: profile.imgUrl ?? "") {
                URLImage(url: url) { image in
                    image
                        .resizable()
                        .frame(width: 20, height: 20)
                        .cornerRadius(7)
                }
            }
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
        ProfileView(profile: ProfileResponse.dummyData)
    }
}
