//
//  SettingsView.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 27.02.2021.
//

import SwiftUI
import Neumorphic

struct SettingsView: View {
    
    @StateObject var viewModel = SettingsViewModelImpl()
    
    var body: some View {
        VStack() {
            HStack(alignment: .center) {
                Text("Настройки")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                Spacer()
                Group {
                    switch viewModel.profileState {
                    case .failed(let error):
                        ErrorView(error: error, handler: viewModel.getProfile)
                    case .success(let profile):
                        ProfileView(profile: profile)
                    default:
                        ProgressiveProfileView(state: viewModel.profileState)
                    }
                }
            }
        Group {
            switch viewModel.state {
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getSettings)
            case .success(let settings):
                    
                    ForEach(settings) { setting in
                        HStack {
                            Button(setting.name ?? "", action: {})
                                .softButtonStyle(RoundedRectangle(cornerRadius: 20))
                            Spacer()
                        }
                        .padding([.top])
                    }
                    
                    HStack {
                        
                        Spacer()
                        
                        Image(uiImage: QRHelper(color: .systemFill).generateQRCode(from: "Max\n Chesnikov"))
                            .interpolation(.none)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .frame(width: 200, height: 200)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20).fill(Color.clear)
                                    .softInnerShadow(RoundedRectangle(cornerRadius: 20), darkShadow: Color.Neumorphic.darkShadow, lightShadow: Color.Neumorphic.lightShadow, spread: 0.05, radius: 2)
                                
                            )
                        
                        Spacer()
                        
                    }
                    .padding([.top])
                    
                    
                    Spacer()
            default:
                ProgressiveSettingsView(state: viewModel.state)
            }
        }
    }.onAppear(perform: {
        viewModel.getSettings()
        viewModel.getProfile()
    })
        .padding([.leading, .trailing])
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
