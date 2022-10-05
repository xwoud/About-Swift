//
//  ContentView.swift
//  TableWatchApp WatchKit Extension
//
//  Created by Hailey on 2021/07/09.
//

import SwiftUI

var listData = [
    ListData(name: "구글", bgColor: .secondary),
    ListData(name: "네이버", bgColor: .green),
    ListData(name: "애플", bgColor: .gray),
    ListData(name: "다음", bgColor: .purple),
]

struct ContentView: View {
    var body: some View {
        List {
            ForEach(listData) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                }
                .padding()
                .background(item.bgColor)
                .cornerRadius(10)
            }
            .listRowBackground(Color.clear)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
