

import SwiftUI

struct CardioTrackerView: View {
    
    
    @State var timeRemaining = 600
    var longestRun = " "
    var lastRun = " "
   @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{

//            TextField("Enter Cardio Duration", text: $timeRemaining)
            
            Text("Cardio Tracker")
                .font(.title)
            Button("Start") {
                startTimer()
            }
            Button("Stop") {
                stopTimer()
            }
            Button("Reset") {
timeRemaining = 600
            }
            Text(convertSecondsToTime(timeInSeconds:timeRemaining))
                .padding()
                .font(.system(size: 100))
                .onReceive(timer) { _ in
                    
                    timeRemaining -= 1
                    
                }
            
        }
        
    }
    func convertSecondsToTime(timeInSeconds : Int) -> String {
        
        let minutes = timeInSeconds / 60
        
        let seconds = timeInSeconds % 60
        
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
            self.timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
        }
    
//    func reset() {
//        Text(convertSecondsToTime(timeInSeconds:timeRemaining)) = timeRemaining
//        }
    
    
}

struct CardioTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        CardioTrackerView()
    }
}





