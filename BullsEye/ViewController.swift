import UIKit


class ViewController: UIViewController {
	
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var targetValue_label: UILabel!
	@IBOutlet weak var score_label: UILabel!
	@IBOutlet weak var round_label: UILabel!
	
	
	var targerValue = 0
	var score = 0
	var round = 0
	
   
	override func viewDidLoad() {
		super.viewDidLoad()
		
		startNewRound()
		
		// Slider customization
		
		let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
		slider.setThumbImage(thumbImageNormal, for: .normal)
		
		let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
		slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
		
		let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
		
		let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
		let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
		slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
		
		let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
		let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
		slider.setMaximumTrackImage(trackRightResizable, for: .normal)
	}

	
	func startNewRound () {
		targerValue = 1 + Int(arc4random_uniform(100))
		targetValue_label.text = String(targerValue)
		slider.value = 50.0
		
		round += 1
		round_label.text = "\(round)"
		
		score_label.text = "\(score)"
	}
	
	
	@IBAction func sliderMoved (_ slider: UISlider) {
	}
	
	
	@IBAction func showAlert () {
		let difference = abs(Int(slider.value) - targerValue)
		var points = 100 - difference
		
		let title: String
		switch difference {
		case 0:
			title = "Perfect!"
			points += 100
		case 1:
			points += 51
			fallthrough
		case 1...5:
			title = "You almost had it!"
		case 6...10:
			title = "Pretty good!"
		default:
			title = "Not even close..."
		}
		
		score += points
		
		let alert = UIAlertController(title: title, message: "You scored \(points) points", preferredStyle: .alert)
		
		let action = UIAlertAction(title: "Awesome", style: .default, handler: { action in
			self.startNewRound()
		})
		
		alert.addAction(action)
		
		present(alert, animated: true, completion: nil)
	}

	
	@IBAction func startOverTapped(_ sender: UIButton) {
		score = 0
		round = 0
		
		startNewRound()
	}
	
}

