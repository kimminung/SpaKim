//
//  ContentView.swift
//  ttee
//
//  Created by 민웅킴 on 2/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!").shadow(radius: 50).font(.system(size: 17))
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
