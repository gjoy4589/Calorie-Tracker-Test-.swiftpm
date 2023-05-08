import SwiftUI

struct LiftTrackerView: View {
    @State private var desiredWeight = ""
    @State private var calculatedPlates: [Double] = []
    @State private var message = ""
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            TextField("Enter Desired Weight", text: $desiredWeight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Calculate Weights", action: calculatePlates)
            
            List {
                ForEach(calculatedPlates, id: \.self) { calculatedPlate in
                    Text("\(calculatedPlate, specifier: "%.1f")")
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(message), dismissButton: .default(Text("OK")))
        }
    }
    
    func calculatePlates() {
        calculatedPlates = []
        let plates = [45, 35, 25, 10, 5, 2.5]
        
        if let weight = Double(desiredWeight) { // Check that it a Double
            if weight == 45 {
                message = "You only need the bar!"
                showingAlert = true
            } else if weight < 45 {
                message = "Must be above bar weight of 45"
                showingAlert = true
            } else if (Int(weight) % 5) != 0 {
                message = "Must be divisible by 5"
                showingAlert = true
            } else {
                var oneSideWeight = (weight - 45) / 2
                
                for plate in plates {
                    while (oneSideWeight - plate) >= 0 {
                        oneSideWeight -= plate
                        calculatedPlates.append(plate)
                    }
                }
            }
        }else {
            message = "Enter a valid number"
            showingAlert = true
            return
        }
    }
}

 
    
    

