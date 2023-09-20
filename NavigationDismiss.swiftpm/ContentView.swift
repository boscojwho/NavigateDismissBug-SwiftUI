import SwiftUI

struct ContentView: View {
    
    var body: some View {
        /*
         Both system and custom navigation paths produce the same unexpected behaviour.
         */
        /// This view uses SwiftUI.NavigationPath.
        SystemNavigationPathView()
        /// This view uses a simple [Int] as its navigation path.
//        CustomNavigationPathView()
    }
}
