//
//  ContentView.swift
//  HsaEnrollmentChart
//
//  Created by Jack Miller on 4/7/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    @State var annualValue : Float = 4800.0
    @State var monthlyValue : Float = 400.0
    
    @State var annualString : String = "4,800"
    @State var monthlyString : String = "400"
    
    @State var retirementAge : String = "65"
    @State var rateOfReturn : String = "6%"
    
    @State var totalWorth : Float = 167600.0
    
    let moneyYears: [MoneyCount] = [
        MoneyCount(year: "2023", money: 0),
        MoneyCount(year: "2024", money: 2206),
        MoneyCount(year: "2025", money: 4438),
        MoneyCount(year: "2026", money: 6805),
        MoneyCount(year: "2027", money: 9313),
        MoneyCount(year: "2028", money: 11972),
        MoneyCount(year: "2029", money: 14790),
        MoneyCount(year: "2030", money: 17777),
        MoneyCount(year: "2031", money: 20944),
        MoneyCount(year: "2032", money: 24301),
        MoneyCount(year: "2033", money: 27859),
        MoneyCount(year: "2034", money: 31630),
        MoneyCount(year: "2035", money: 35628),
        MoneyCount(year: "2036", money: 39866),
        MoneyCount(year: "2037", money: 44358),
        MoneyCount(year: "2038", money: 49119),
        MoneyCount(year: "2039", money: 54166),
        MoneyCount(year: "2040", money: 59516),
        MoneyCount(year: "2041", money: 65187),
        MoneyCount(year: "2042", money: 71199),
        MoneyCount(year: "2043", money: 77570),
        MoneyCount(year: "2044", money: 84325),
        MoneyCount(year: "2045", money: 91484),
        MoneyCount(year: "2046", money: 99073),
        MoneyCount(year: "2047", money: 107118),
        MoneyCount(year: "2048", money: 115645),
        MoneyCount(year: "2049", money: 124683),
        MoneyCount(year: "2050", money: 134264),
        MoneyCount(year: "2051", money: 144420),
        MoneyCount(year: "2052", money: 155185),
        MoneyCount(year: "2053", money: 167600),
    ]
    
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00))
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "chevron.backward").padding(.trailing, 34)
                        Text("HSA Enrollment")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0)
                            .font(.body)
                        Text ("Cancel")
                            .foregroundColor(.blue)
                    }
                    Group {
                        Text("How much would you like to contribute to your HSA?")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 32)
                            .padding(.top, 27)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("$ \(Int(annualValue))/yr").font(.title3)
                        Slider(value: $annualValue, in: 0.0...7750.0) {
                            Text("Slider")
                        } minimumValueLabel: {
                            Text("$0").font(.subheadline)
                        } maximumValueLabel: {
                            Text("$7,750").font(.subheadline)
                        }
                        HStack{
                            FloatingTextField(title: "Monthly contribution", text: $monthlyString)
                            FloatingTextField(title: "Annual contribution", text: $annualString)
                        }.padding(.top, 16)
                    }
                    Group {
                        Text("See how your HSA investments could grow over time.")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 16)
                            .padding(.top, 32)
                            .fixedSize(horizontal: false, vertical: true)
                        HStack{
                            FloatingTextField(title: "Retirement age", text: $retirementAge)
                            FloatingTextField(title: "Rate of return", text: $rateOfReturn)
                        }
                    }
                    Text("In 30 years, your HSA could be worth")
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 32)
                    Text("$ \(Int(totalWorth))")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Group{
                        HStack{
                            VStack {
                                Text ("Contributions")
                                Text("$144,000")
                                    .font(.body)
                                    .bold(true)
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0)
                            VStack {
                                Text ("Est expenses")
                                Text("-$84,000")
                                    .font(.body)
                                    .bold(true)
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0)
                            VStack {
                                Text ("Investments")
                                Text("$107,600")
                                    .font(.body)
                                    .bold(true)
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0)
                        }
                    }
                    VStack {
                        GroupBox () {
                            Chart(moneyYears){
                                BarMark(
                                    x: .value("Years", $0.year, unit: .year),
                                    y: .value("Money", $0.money)
                                )
                            }
                            .chartLegend(position: .top, alignment: .leading, spacing: 1)
                            .chartYAxis {
                                AxisMarks(position: .leading, values: [33400, 66800, 100200, 133600, 167000]) { _ in
                                    AxisValueLabel()
                                    AxisGridLine().foregroundStyle(.gray)
                                }
                            }
                        }
                    }
                    .frame(height: 216)
                    .padding()
                    Button() {
                        print("Pressed!")
                    } label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity, minHeight: 56.0)
                            .bold(true)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 16)
                    Spacer()
                }
            }.padding()
                .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
