import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    var titre : String?
    
    var timer : Timer!

    @objc func setRandomBackgroundColor() {
          let colors = [
              UIColor(red: 233/255, green: 203/255, blue: 198/255, alpha: 1),
              UIColor(red: 38/255, green: 188/255, blue: 192/255, alpha: 1),
              UIColor(red: 253/255, green: 221/255, blue: 164/255, alpha: 1),
              UIColor(red: 235/255, green: 154/255, blue: 171/255, alpha: 1),
              UIColor(red: 87/255, green: 141/255, blue: 155/255, alpha: 1)
          ]
          let randomColor = Int(arc4random_uniform(UInt32 (colors.count)))
          self.view.backgroundColor = colors[randomColor]
      }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.setRandomBackgroundColor), userInfo: nil, repeats: true)
    
           self.setRandomBackgroundColor()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        if let titre2 = sender.title(for: .normal){
      titre = titre2
            playSound(songName: titre )
            sender.alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
                sender.alpha = 1
            }
            
        }
    }
    
    func playSound(songName:String?) {
        
        let url = Bundle.main.url(forResource: songName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

