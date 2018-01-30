
import Foundation
import UIKit

class ImageLabelCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func setup(labelName: String?, imageName: String?) {
        // Set the label of the cell to be the name we passed in
        self.label.text = labelName
        
        // Make sure we have the show's picture name before we try creating an image out of it
        guard let iconName = imageName else { return }
        self.cellImageView.image = UIImage(named: iconName)
    }
}
