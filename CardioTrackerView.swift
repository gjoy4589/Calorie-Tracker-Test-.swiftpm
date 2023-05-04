

import SwiftUI

struct CardioTrackerView: View {
    
    @State var timeRemaining = 62
    
    var longestRun = " "
    var lastRun = " "
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func convertSecondsToTime(timeInSeconds : Int) -> String {
        
        let minutes = timeInSeconds / 60
        
        let seconds = timeInSeconds % 60
        
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    var body: some View {
        VStack{
            Text("Cardio Tracker")
                .font(.title)
            Text(convertSecondsToTime(timeInSeconds:timeRemaining))
                .padding()
                .font(.system(size: 100))
                .onReceive(timer) { _ in
                    
                    timeRemaining -= 1
                    
                }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            CardioTrackerView()
        }
        
        
        
        struct CardioTrackerView_Previews: PreviewProvider {
            static var previews: some View {
                CardioTrackerView()
            }
        }
    }
}
