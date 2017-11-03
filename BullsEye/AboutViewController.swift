import UIKit
import WebKit


class AboutViewController: UIViewController {

	@IBOutlet weak var webView: WKWebView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
			if let htmlData = try? Data.init(contentsOf: url) {
				let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
				webView.load(htmlData, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: baseURL)
			}
		}
	}
	

	@IBAction func closeTapped(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)
	}
	
}
