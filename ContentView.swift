import SwiftUI

struct ContentView: View {
    @State private var calorieIntake: String = ""
    @State private var calorieHistory: [Int] = []

    var totalCalories: Int {
        calorieHistory.reduce(0, +)
    }

    var body: some View {
        VStack {
            Text("Calorie Tracker")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding()

            TextField("Enter calorie intake", text: $calorieIntake)
                .padding()
                .keyboardType(.numberPad)

            Button(action: {
                guard let calorie = Int(calorieIntake) else { return }
                calorieHistory.append(calorie)
                calorieIntake = ""
            }) {
                Text("Add")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(40)
            }
            .padding()

            HStack {
                Text("Calorie History:")
                    .font(.headline)
                    .padding(.top)
                Spacer()
                Button(action: {
                    calorieHistory.removeAll()
                }) {
                    Text("Clear All")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }

            List {
                ForEach(calorieHistory, id: \.self) { calorie in
                    Text("\(calorie) calories")
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(action: {
                                if let index = calorieHistory.firstIndex(of: calorie) {
                                    calorieHistory.remove(at: index)
                                }
                            }) {
                                Text("Delete")
                                    .foregroundColor(.white)
                                    .background(Color.red)
                            }
                        }
                }
            }
            .listStyle(GroupedListStyle())

            HStack {
                Text("Total Calories:")
                    .font(.headline)
                    .padding(.top)
                Spacer()
                Text("\(totalCalories)")
                    .font(.headline)
                    .padding(.top)
            }

            Spacer()
        }
        .padding()
        .onAppear {
            // Load calorie history
            if let savedHistory = UserDefaults.standard.array(forKey: "CalorieHistory") as? [Int] {
                calorieHistory = savedHistory
            }
        }
        .onDisappear {
            // Save calorie history
            UserDefaults.standard.set(calorieHistory, forKey: "CalorieHistory")
        }
    }
}

struct ContentView_Previewst0: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//1. add clear button
//2. add edit and delete functionality
//3. add data persistance
