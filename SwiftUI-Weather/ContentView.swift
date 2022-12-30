//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Alex Navarro on 12/28/22.
//

import SwiftUI

struct ContentView: View {

    @State var isNight = false

    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(city: "San Diego, CA")
                MainWeatherView(imageName: "cloud.sun.fill", temperature: 76)

                HStack(spacing: 20) {
                    WeatherDayView(viewModel: WeatherDayViewModel(weekday: .mon, weatherType: .cloudy))
                    WeatherDayView(viewModel: WeatherDayViewModel(weekday: .tues, weatherType: .drizzle))
                    WeatherDayView(viewModel: WeatherDayViewModel(weekday: .wed, weatherType: .dusting))
                    WeatherDayView(viewModel: WeatherDayViewModel(weekday: .thurs, weatherType: .rain))
                    WeatherDayView(viewModel: WeatherDayViewModel(weekday: .fri, weatherType: .cloudy))
                }
                Spacer()

                Button {
                    isNight.toggle()
                    print("tapped")
                } label: {
                    ButtonView(buttonText: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {

    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    init(viewModel: WeatherDayViewModel) {
        self.dayOfWeek = viewModel.weekday.rawValue
        self.imageName = viewModel.weatherType.rawValue
        self.temperature = viewModel.temperature
    }

    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system( size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text(String("\(temperature)°"))
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var city: String
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text(String("\(temperature)°"))
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
    
}


