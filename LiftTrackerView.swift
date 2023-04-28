import SwiftUI

struct LiftTrackerView: View {
    @State private var benchPress: String = ""
    @State private var squatLift: String = ""
    @State private var deadlift: String = ""
    @State private var benchHistory: [Int] = []
    @State private var squatHistory: [Int] = []
    @State private var deadliftHistory: [Int] = []
    
    
    var body: some View {
        VStack {
            Text("Get Big!")
            Button("Help") {
                //code
            }
            
            //        func weightTotal(){
            //            benchHistory + squatHistory + deadliftHistory
            //        }
        }
    }
}  
