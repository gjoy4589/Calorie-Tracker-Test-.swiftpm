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
            }
            
            List(calorieHistory, id: \.self) { calorie in
                Text("\(calorie) calories")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
