//
//  ProgressiveProfileView.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import Foundation
import SwiftUI

struct ProgressiveProfileView: View {
    
    typealias ErrorViewActionHandler = () -> Void
    
    let state: ProfileState
    
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

struct ProgressiveProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressiveProfileView(state: .loading)
            .previewLayout(.sizeThatFits)
    }
}
