import SwiftUI

struct ContentView: View {
    

    var body: some View {
        Text("Hello, world!")
            .onTapGesture(perform: simpleSuccess)
    }
    
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}
