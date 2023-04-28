import SwiftUI

struct CalorieTrackerView: View {
    @State private var calorieIntake: String = ""
    @State private var calorieHistory: [Int] = []
    
    var totalCalories: Int {
        calorieHistory.reduce(0, +)
    }
    
    var body: some View {
        VStack {
            Text("Calorie Tracker")
                .font(.title)
            
            TextField("Enter calorie intake", text: $calorieIntake)
                .padding()
                .keyboardType(.numberPad)
            
            Button("Add", action: {
                guard let calorie = Int(calorieIntake) else { return }
                calorieHistory.append(calorie)
                calorieIntake = ""
            })
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

struct CalorieTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieTrackerView()
    }
}
