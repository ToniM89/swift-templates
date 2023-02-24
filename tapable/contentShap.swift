// https://www.hackingwithswift.com/books/ios-swiftui/disabling-user-interactivity-with-allowshittesting

VStack {
    Text("Hello")
    Spacer().frame(height: 100)
    Text("World")
}
.contentShape(Rectangle())
.onTapGesture {
    print("VStack tapped!")
}


// to make the space around the visible circle also tap able
Circle()
    .fill(.red)
    .frame(width: 300, height: 300)
    .contentShape(Rectangle())
    .onTapGesture {
        print("Circle tapped!")
    }
