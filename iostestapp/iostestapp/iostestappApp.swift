//    
//  iostestappApp.swift
//  iostestapp
//

import SwiftUI
import Common

@main
struct iostestappApp: App {

    init() {
        DIManager.shared.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
