import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var showImageName: UIImageView!
    @IBOutlet weak var showDescription: UITextView!
    
    //public optional tv show attributes
    var tvShowName: String?
    var tvShowImageName: String?
    var tvShowDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setup the label, image and textView with content on initial load
        setup()
    }
    
    func setup() {
        //set the showName, showImageName and showDescription
        showName.text = tvShowName
        showImageName.image = UIImage(named: tvShowImageName!)
        showDescription.text = tvShowDescription
    }
    
    @IBAction func tappedOk(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
