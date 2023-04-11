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
        MoneyCount(year: "2023", money: 0, type: "Extra savings"),
        MoneyCount(year: "2024", money: 2000, type: "Extra savings"),
        MoneyCount(year: "2025", money: 4000, type: "Extra savings"),
        MoneyCount(year: "2026", money: 6000, type: "Extra savings"),
        MoneyCount(year: "2027", money: 8000, type: "Extra savings"),
        MoneyCount(year: "2028", money: 10000, type: "Extra savings"),
        MoneyCount(year: "2029", money: 12000, type: "Extra savings"),
        MoneyCount(year: "2030", money: 14000, type: "Extra savings"),
        MoneyCount(year: "2031", money: 16000, type: "Extra savings"),
        MoneyCount(year: "2032", money: 18000, type: "Extra savings"),
        MoneyCount(year: "2033", money: 20000, type: "Extra savings"),
        MoneyCount(year: "2034", money: 22000, type: "Extra savings"),
        MoneyCount(year: "2035", money: 24000, type: "Extra savings"),
        MoneyCount(year: "2036", money: 26000, type: "Extra savings"),
        MoneyCount(year: "2037", money: 28000, type: "Extra savings"),
        MoneyCount(year: "2038", money: 30000, type: "Extra savings"),
        MoneyCount(year: "2039", money: 32000, type: "Extra savings"),
        MoneyCount(year: "2040", money: 34000, type: "Extra savings"),
        MoneyCount(year: "2041", money: 36000, type: "Extra savings"),
        MoneyCount(year: "2042", money: 38000, type: "Extra savings"),
        MoneyCount(year: "2043", money: 40000, type: "Extra savings"),
        MoneyCount(year: "2044", money: 42000, type: "Extra savings"),
        MoneyCount(year: "2045", money: 44000, type: "Extra savings"),
        MoneyCount(year: "2046", money: 46000, type: "Extra savings"),
        MoneyCount(year: "2047", money: 48000, type: "Extra savings"),
        MoneyCount(year: "2048", money: 50000, type: "Extra savings"),
        MoneyCount(year: "2049", money: 52000, type: "Extra savings"),
        MoneyCount(year: "2050", money: 54000, type: "Extra savings"),
        MoneyCount(year: "2051", money: 56000, type: "Extra savings"),
        MoneyCount(year: "2052", money: 58000, type: "Extra savings"),
        MoneyCount(year: "2053", money: 60000, type: "Extra savings"),
        MoneyCount(year: "2023", money: 56, type: "Investment earnings"),
        MoneyCount(year: "2024", money: 238, type: "Investment earnings"),
        MoneyCount(year: "2025", money: 556, type: "Investment earnings"),
        MoneyCount(year: "2026", money: 1017, type: "Investment earnings"),
        MoneyCount(year: "2027", money: 1630, type: "Investment earnings"),
        MoneyCount(year: "2028", money: 2402, type: "Investment earnings"),
        MoneyCount(year: "2029", money: 3349, type: "Investment earnings"),
        MoneyCount(year: "2030", money: 4476, type: "Investment earnings"),
        MoneyCount(year: "2031", money: 5796, type: "Investment earnings"),
        MoneyCount(year: "2032", money: 7321, type: "Investment earnings"),
        MoneyCount(year: "2033", money: 9064, type: "Investment earnings"),
        MoneyCount(year: "2034", money: 11037, type: "Investment earnings"),
        MoneyCount(year: "2035", money: 13256, type: "Investment earnings"),
        MoneyCount(year: "2036", money: 15735, type: "Investment earnings"),
        MoneyCount(year: "2037", money: 18491, type: "Investment earnings"),
        MoneyCount(year: "2038", money: 21540, type: "Investment earnings"),
        MoneyCount(year: "2039", money: 24900, type: "Investment earnings"),
        MoneyCount(year: "2040", money: 28592, type: "Investment earnings"),
        MoneyCount(year: "2041", money: 32634, type: "Investment earnings"),
        MoneyCount(year: "2042", money: 37049, type: "Investment earnings"),
        MoneyCount(year: "2043", money: 41860, type: "Investment earnings"),
        MoneyCount(year: "2044", money: 47092, type: "Investment earnings"),
        MoneyCount(year: "2045", money: 52769, type: "Investment earnings"),
        MoneyCount(year: "2046", money: 58920, type: "Investment earnings"),
        MoneyCount(year: "2047", money: 65575, type: "Investment earnings"),
        MoneyCount(year: "2048", money: 72763, type: "Investment earnings"),
        MoneyCount(year: "2049", money: 80517, type: "Investment earnings"),
        MoneyCount(year: "2050", money: 88874, type: "Investment earnings"),
        MoneyCount(year: "2051", money: 97869, type: "Investment earnings"),
        MoneyCount(year: "2052", money: 107543, type: "Investment earnings"),
        MoneyCount(year: "2053", money: 114000, type: "Investment earnings")
    ]
    
    let markColors: [Color] = [Color(UIColor(red: 0.64, green: 0.74, blue: 0.99, alpha: 1.00)), .blue]
    let types: [String] = ["Extra savings", "Investment earnings"]
    
    @State var retirementAge : String = "65"
    @State var rateOfReturn : String = "6%"
    
    @State var totalWorth : Float = 167600.0
    @State var contributions : Float = 144000.0
    @State var estExpenses : Float = 84000.0
    @State var investments : Float = 107600.0
    
    @State var annualProgress: Float = 4800.0
    @State var monthlyProgress: Float = 400.0
    
    let uiFontNavBar = UIFont.systemFont(ofSize: 17, weight: .bold)
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
                        Text("HSA enrollment")
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
                    Text("In **30 years**, your HSA could be worth")
                        .font(Font(uiFontSubheadline))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 32)
                    Text("$\(Int(totalWorth))")
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
                            }
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
                            }.padding(.trailing, 30)
                        }
                    }
                    VStack {
                        GroupBox () {
                            Chart(moneyYears){ item in
                                BarMark(
                                    x: .value("Years", item.year, unit: .year),
                                    y: .value("Money", item.money)
                                )
                                //Add stacking layers
                                .foregroundStyle(by: .value("Investment", item.type))
                            }
                            .chartForegroundStyleScale(domain: types.compactMap({ item in
                                            item
                                        }), range: markColors)
                            .chartLegend(position: .bottom, alignment: .leading, spacing: 1)
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
                    .padding(.trailing, 20)
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
            MoneyCount(year: "2023", money: 0, type: "Extra savings"),
            MoneyCount(year: "2024", money: ((annualProgress * 0.416667) * 1), type: "Extra savings"),
            MoneyCount(year: "2025", money: ((annualProgress * 0.416667) * 2), type: "Extra savings"),
            MoneyCount(year: "2026", money: ((annualProgress * 0.416667) * 3), type: "Extra savings"),
            MoneyCount(year: "2027", money: ((annualProgress * 0.416667) * 4), type: "Extra savings"),
            MoneyCount(year: "2028", money: ((annualProgress * 0.416667) * 5), type: "Extra savings"),
            MoneyCount(year: "2029", money: ((annualProgress * 0.416667) * 6), type: "Extra savings"),
            MoneyCount(year: "2030", money: ((annualProgress * 0.416667) * 7), type: "Extra savings"),
            MoneyCount(year: "2031", money: ((annualProgress * 0.416667) * 8), type: "Extra savings"),
            MoneyCount(year: "2032", money: ((annualProgress * 0.416667) * 9), type: "Extra savings"),
            MoneyCount(year: "2033", money: ((annualProgress * 0.416667) * 10), type: "Extra savings"),
            MoneyCount(year: "2034", money: ((annualProgress * 0.416667) * 11), type: "Extra savings"),
            MoneyCount(year: "2035", money: ((annualProgress * 0.416667) * 12), type: "Extra savings"),
            MoneyCount(year: "2036", money: ((annualProgress * 0.416667) * 13), type: "Extra savings"),
            MoneyCount(year: "2037", money: ((annualProgress * 0.416667) * 14), type: "Extra savings"),
            MoneyCount(year: "2038", money: ((annualProgress * 0.416667) * 15), type: "Extra savings"),
            MoneyCount(year: "2039", money: ((annualProgress * 0.416667) * 16), type: "Extra savings"),
            MoneyCount(year: "2040", money: ((annualProgress * 0.416667) * 17), type: "Extra savings"),
            MoneyCount(year: "2041", money: ((annualProgress * 0.416667) * 18), type: "Extra savings"),
            MoneyCount(year: "2042", money: ((annualProgress * 0.416667) * 19), type: "Extra savings"),
            MoneyCount(year: "2043", money: ((annualProgress * 0.416667) * 20), type: "Extra savings"),
            MoneyCount(year: "2044", money: ((annualProgress * 0.416667) * 21), type: "Extra savings"),
            MoneyCount(year: "2045", money: ((annualProgress * 0.416667) * 22), type: "Extra savings"),
            MoneyCount(year: "2046", money: ((annualProgress * 0.416667) * 23), type: "Extra savings"),
            MoneyCount(year: "2047", money: ((annualProgress * 0.416667) * 24), type: "Extra savings"),
            MoneyCount(year: "2048", money: ((annualProgress * 0.416667) * 25), type: "Extra savings"),
            MoneyCount(year: "2049", money: ((annualProgress * 0.416667) * 26), type: "Extra savings"),
            MoneyCount(year: "2050", money: ((annualProgress * 0.416667) * 27), type: "Extra savings"),
            MoneyCount(year: "2051", money: ((annualProgress * 0.416667) * 28), type: "Extra savings"),
            MoneyCount(year: "2052", money: ((annualProgress * 0.416667) * 29), type: "Extra savings"),
            MoneyCount(year: "2053", money: ((annualProgress * 0.416667) * 30), type: "Extra savings"),
            MoneyCount(year: "2023", money: 0, type: "Investment earnings"),
            MoneyCount(year: "2024", money: (annualProgress * 0.011), type: "Investment earnings"),
            MoneyCount(year: "2025", money: (annualProgress * 0.0497), type: "Investment earnings"),
            MoneyCount(year: "2026", money: (annualProgress * 0.1159), type: "Investment earnings"),
            MoneyCount(year: "2027", money: (annualProgress * 0.2119), type: "Investment earnings"),
            MoneyCount(year: "2028", money: (annualProgress * 0.339), type: "Investment earnings"),
            MoneyCount(year: "2029", money: (annualProgress * 0.5008), type: "Investment earnings"),
            MoneyCount(year: "2030", money: (annualProgress * 0.6978), type: "Investment earnings"),
            MoneyCount(year: "2031", money: (annualProgress * 0.932), type: "Investment earnings"),
            MoneyCount(year: "2032", money: (annualProgress * 1.207), type: "Investment earnings"),
            MoneyCount(year: "2033", money: (annualProgress * 1.525), type: "Investment earnings"),
            MoneyCount(year: "2034", money: (annualProgress * 1.888), type: "Investment earnings"),
            MoneyCount(year: "2035", money: (annualProgress * 2.299), type: "Investment earnings"),
            MoneyCount(year: "2036", money: (annualProgress * 2.761), type: "Investment earnings"),
            MoneyCount(year: "2037", money: (annualProgress * 3.278), type: "Investment earnings"),
            MoneyCount(year: "2038", money: (annualProgress * 3.852), type: "Investment earnings"),
            MoneyCount(year: "2039", money: (annualProgress * 4.487), type: "Investment earnings"),
            MoneyCount(year: "2040", money: (annualProgress * 5.187), type: "Investment earnings"),
            MoneyCount(year: "2041", money: (annualProgress * 5.956), type: "Investment earnings"),
            MoneyCount(year: "2042", money: (annualProgress * 6.798), type: "Investment earnings"),
            MoneyCount(year: "2043", money: (annualProgress * 7.718), type: "Investment earnings"),
            MoneyCount(year: "2044", money: (annualProgress * 8.721), type: "Investment earnings"),
            MoneyCount(year: "2045", money: (annualProgress * 9.810), type: "Investment earnings"),
            MoneyCount(year: "2046", money: (annualProgress * 10.993), type: "Investment earnings"),
            MoneyCount(year: "2047", money: (annualProgress * 12.275), type: "Investment earnings"),
            MoneyCount(year: "2048", money: (annualProgress * 13.661), type: "Investment earnings"),
            MoneyCount(year: "2049", money: (annualProgress * 15.159), type: "Investment earnings"),
            MoneyCount(year: "2050", money: (annualProgress * 16.774), type: "Investment earnings"),
            MoneyCount(year: "2051", money: (annualProgress * 18.515), type: "Investment earnings"),
            MoneyCount(year: "2052", money: (annualProgress * 20.389), type: "Investment earnings"),
            MoneyCount(year: "2053", money: (annualProgress * 22.404), type: "Investment earnings")
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
