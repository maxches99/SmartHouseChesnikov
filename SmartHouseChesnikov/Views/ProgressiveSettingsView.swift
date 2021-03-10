//
//  ProgressiveSettingsView.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import SwiftUI

struct ProgressiveSettingsView: View {
    
    typealias ErrorViewActionHandler = () -> Void
    
    let state: SettingsState
    
    var body: some View {
        VStack {
            ProgressView()
            Text(state.title)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
        }
    }
}

struct ProgressiveSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressiveSettingsView(state: .loading)
            .previewLayout(.sizeThatFits)
    }
}

