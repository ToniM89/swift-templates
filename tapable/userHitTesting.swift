// https://www.hackingwithswift.com/books/ios-swiftui/disabling-user-interactivity-with-allowshittesting

ZStack {
    Rectangle()
        .fill(.blue)
        .frame(width: 300, height: 300)
        .onTapGesture {
            print("Rectangle tapped!")
        }

    Circle()
        .fill(.red)
        .frame(width: 300, height: 300)
        .onTapGesture {
            print("Circle tapped!")
        }
        .allowsHitTesting(false)
}
