Text("Hello, World!")
    .onTapGesture(count: 2) {
        print("Double tapped!")
    }

Text("Hello, World!")
    .onLongPressGesture(minimumDuration: 2) {
        print("Long pressed!")
    }

Text("Hello, World!")
    .onLongPressGesture {
        print("Long pressed!")
    }


Text("Hello, World!")
    .onLongPressGesture(minimumDuration: 1) {
        print("Long pressed!")
    } onPressingChanged: { inProgress in
        print("In progress: \(inProgress)!")
    }


// 

struct ContentView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0

    var body: some View {
        Text("Hello, World!")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        currentAmount = amount - 1
                    }
                    .onEnded { amount in
                        finalAmount += currentAmount 
                        currentAmount = 0
                    }
            )
    }
}

//

struct ContentView: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero

    var body: some View {
        Text("Hello, World!")
            .rotationEffect(currentAmount + finalAmount)
            .gesture(
                RotationGesture()
                    .onChanged { angle in
                        currentAmount = angle
                    }
                    .onEnded { angle in
                        finalAmount += currentAmount
                        currentAmount = .zero
                    }
            )
    }
}

// only the inner one will be executed becaus child gesture has a higher prio

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .onTapGesture {
            print("VStack tapped")
        }
    }
}

// outer one will be executed

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
    }
}

// both will be executed

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
    }
}


// 

