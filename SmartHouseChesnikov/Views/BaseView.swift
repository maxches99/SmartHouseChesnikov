//
//  BaseView.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation
import SwiftUI
import Neumorphic

struct BaseView: View {
    
    @StateObject var viewModel = HomeViewModelImpl(service: HomeServiceImpl())
    @State private var isPresented = false
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getHome)
            case .success(let sensors):
                TabView {
                    HomeView(nameOfHouse: viewModel.home.nameOfHouse ?? "",sensors: sensors, handler: viewModel.getHome)
                        .tabItem {
                            Image(systemName: "homekit")
                            Text("Датчики")
                        }
                    SettingsView()
                        .tabItem {
                            Image(systemName: "airport.extreme")
                            Text("Настройки")
                        }
                }
            default:
                ProgressiveView(state: viewModel.state)
            }
        }.onAppear(perform: {
            viewModel.getHome()
        })
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
