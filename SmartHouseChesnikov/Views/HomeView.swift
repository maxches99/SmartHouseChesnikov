//
//  StockView.swift
//  TestWeatherAppSwiftUI
//
//  Created by Max Chesnikov on 17.02.2021.
//

import SwiftUI
import Neumorphic
import SwiftUICharts

struct HomeView: View {
	typealias HomeViewActionHandler = () -> Void
	
    let nameOfHouse: String
	let sensors: [Sensor]
	@State var finderString: String = ""
	
	let handler: HomeViewActionHandler
	
	internal init(nameOfHouse: String,
                  sensors: [Sensor],
				  handler: @escaping HomeView.HomeViewActionHandler) {
        self.nameOfHouse = nameOfHouse
		self.sensors = sensors
		self.handler = handler
	}
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
	
	var body: some View {
        VStack {
            HStack(alignment: .center){
                Image(systemName: "homekit")
                    .font(.system(size: 40))
                Text(nameOfHouse)
                    .font(.system(size: 35, weight: .bold, design: .rounded))
            }
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(sensors) { sensor in
                        SensorView(sensor: sensor)
                    }
                }
                .padding()
            }
        }
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
        HomeView(nameOfHouse: HomeResponse.dummyData.nameOfHouse ?? "", sensors: [Sensor.dummyData], handler: {})
	}
}

