//
//  ContentView.swift
//  HsaEnrollmentChart
//
//  Created by Jack Miller on 4/7/23.
//

import SwiftUI
import Charts


struct ContentView: View {
    @State var moneyYears: [MoneyCount] = [
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
    
    @State var retirementAge : String = "65"
    @State var rateOfReturn : String = "6%"
    
    @State var totalWorth : Float = 167600.0
    @State var contributions : Float = 144000.0
    @State var estExpenses : Float = 84000.0
    @State var investments : Float = 107600.0
    
    @State var annualProgress: Float = 4800.0
    @State var monthlyProgress: Float = 400.0
    
    let uiFontNavBar = UIFont.systemFont(ofSize: 17)
    let uiFontContent = UIFont.systemFont(ofSize: 22)
    let uiFontCaption = UIFont.systemFont(ofSize: 12)
    let uiFontRegular = UIFont.systemFont(ofSize: 17)
    let uiFontSubheadline = UIFont.systemFont(ofSize: 15)
    let uiFontLarge = UIFont.systemFont(ofSize: 28)
    let uiFontFootnote = UIFont.systemFont(ofSize: 13)
    
    var body: some View {
        return ZStack {
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "chevron.backward").padding(.trailing, 34)
                        Text("HSA Enrollment")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0)
                            .font(Font(uiFontNavBar))
                        Text ("Cancel")
                            .foregroundColor(.blue)
                    }
                    Group {
                        Text("How much would you like to contribute to your HSA?")
                            .font(Font(uiFontContent))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 32)
                            .padding(.top, 27)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("$ \(Int(annualProgress))/yr").font(.title3)
                        Slider(value: Binding(get: {
                                self.annualProgress
                            }, set: { (newVal) in
                                self.annualProgress = newVal
                                self.sliderChanged()
                            }), in: 0.0...7750.0) {
                            Text("Slider")
                        } minimumValueLabel: {
                            Text("$0").font(Font(uiFontFootnote))
                        } maximumValueLabel: {
                            Text("$7,750").font(Font(uiFontFootnote))
                        }
                        HStack{
                            FloatingTextField(title: "Monthly contribution", text: $monthlyProgress)
                            FloatingTextField(title: "Annual contribution", text: $annualProgress)
                        }.padding(.top, 16)
                    }
                    Group {
                        Text("See how your HSA investments could grow over time.")
                            .font(Font(uiFontContent))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 16)
                            .padding(.top, 32)
                            .fixedSize(horizontal: false, vertical: true)
                        HStack{
                            FloatingTextFieldString(title: "Retirement age", text: $retirementAge)
                            FloatingTextFieldString(title: "Rate of return", text: $rateOfReturn)
                        }
                    }
                    Text("In 30 years, your HSA could be worth")
                        .font(Font(uiFontSubheadline))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 32)
                    Text("$ \(Int(totalWorth))")
                        .font(Font(uiFontLarge))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Group{
                        HStack{
                            VStack {
                                Text ("Contributions")
                                    .font(Font(uiFontSubheadline))
                                Text("$\(Int(contributions))")
                                    .font(Font(uiFontRegular))
                                    .bold(true)
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0)
                            VStack {
                                Text ("Est expenses")
                                    .font(Font(uiFontSubheadline))
                                Text("-$\(Int(estExpenses))")
                                    .font(Font(uiFontRegular))
                                    .bold(true)
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0)
                            VStack {
                                Text ("Investments")
                                    .font(Font(uiFontSubheadline))
                                Text("$\(Int(investments))")
                                    .font(Font(uiFontRegular))
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
                            .chartLegend(position: .bottom, alignment: .leading, spacing: 1){
                                HStack {
                                    Text("Investment earnings")
                                }
                            }
                            .chartYAxis {
                                AxisMarks(position: .leading, values: [33400, 66800, 100200, 133600, 167000, 200400, 230460, 265000, 294400]) { _ in
                                    AxisValueLabel()
                                    AxisGridLine().foregroundStyle(.gray)
                                }
                            }
                            .chartXAxis {
                                AxisMarks(preset: .aligned) { value in
                                    AxisValueLabel()
                                }
                            }
                        }
                    }
                    .frame(height: 225)
                    .padding()
                    Button() {
                        print("Pressed!")
                    } label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity, minHeight: 56.0)
                            .bold(true)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 65)
                    Spacer()
                }
            }.padding()
             .frame(maxWidth: .infinity)
             .background(Color(UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)))
        }
    }
    
    func getDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        
        return formatter
    }
    
    func sliderChanged() {
        monthlyProgress = (annualProgress / 12)
        contributions = (annualProgress * 30)
        estExpenses = (annualProgress * 17.5)
        investments = (annualProgress * 22.4166666666667)
        totalWorth = ((contributions + investments) - estExpenses)
        
        moneyYears = [
            MoneyCount(year: "2023", money: 0),
            MoneyCount(year: "2024", money: (annualProgress * 0.46)),
            MoneyCount(year: "2025", money: (annualProgress * 0.99)),
            MoneyCount(year: "2026", money: (annualProgress * 1.41)),
            MoneyCount(year: "2027", money: (annualProgress * 1.94)),
            MoneyCount(year: "2028", money: (annualProgress * 2.49)),
            MoneyCount(year: "2029", money: (annualProgress * 3.08)),
            MoneyCount(year: "2030", money: (annualProgress * 3.70)),
            MoneyCount(year: "2031", money: (annualProgress * 4.36)),
            MoneyCount(year: "2032", money: (annualProgress * 5.06)),
            MoneyCount(year: "2033", money: (annualProgress * 5.80)),
            MoneyCount(year: "2034", money: (annualProgress * 6.59)),
            MoneyCount(year: "2035", money: (annualProgress * 7.42)),
            MoneyCount(year: "2036", money: (annualProgress * 8.30)),
            MoneyCount(year: "2037", money: (annualProgress * 9.24)),
            MoneyCount(year: "2038", money: (annualProgress * 10.23)),
            MoneyCount(year: "2039", money: (annualProgress * 11.29)),
            MoneyCount(year: "2040", money: (annualProgress * 12.40)),
            MoneyCount(year: "2041", money: (annualProgress * 13.58)),
            MoneyCount(year: "2042", money: (annualProgress * 14.83)),
            MoneyCount(year: "2043", money: (annualProgress * 16.16)),
            MoneyCount(year: "2044", money: (annualProgress * 17.57)),
            MoneyCount(year: "2045", money: (annualProgress * 19.06)),
            MoneyCount(year: "2046", money: (annualProgress * 20.64)),
            MoneyCount(year: "2047", money: (annualProgress * 22.32)),
            MoneyCount(year: "2048", money: (annualProgress * 24.09)),
            MoneyCount(year: "2049", money: (annualProgress * 25.98)),
            MoneyCount(year: "2050", money: (annualProgress * 27.97)),
            MoneyCount(year: "2051", money: (annualProgress * 30.08)),
            MoneyCount(year: "2052", money: (annualProgress * 32.33)),
            MoneyCount(year: "2053", money: (annualProgress * 34.92)),
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
