//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Alex Navarro on 12/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack {
                CityTextView(city: "San Diego, CA")
                MainWeatherView(imageName: "cloud.sun.fill", temperature: 76)

                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUES", imageName: "cloud.sun.fill", temperature: 56)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 78)
                    WeatherDayView(dayOfWeek: "THUR", imageName: "cloud.sun.rain.fill", temperature: 78)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sun.dust.fill", temperature: 78)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.drizzle.fill", temperature: 78)
                }
                Spacer()

                Button {
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
    var topColor: Color
    var bottomColor: Color

    var body: some View {
        LinearGradient(colors: [topColor, bottomColor],
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


