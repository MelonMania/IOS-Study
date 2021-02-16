
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    let eggTimes : [String : Int] = ["Soft" : 3, "Medium" : 4, "Hard" : 7]
    var total = 0
    var secondProgress  = 0
    var timer = Timer()
    
    @IBOutlet var cookedInfo: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    @IBAction func pressedEgg(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        total = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondProgress = 0
        cookedInfo.text! = hardness
    
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondProgress < self.total {
                self.secondProgress += 1
                self.progressBar.progress = Float(self.secondProgress) / Float(self.total)
            }
            else{
                self.cookedInfo.text! = "Done"
                self.playSound()
                Timer.invalidate()
            }
        }
        
    
    }
    
    func playSound() {
        let soundURL =  Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: soundURL!)
            player.play()
    }
    
}
