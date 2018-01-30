
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // Our "dataSource" or "model" is the data that we want to display
    var shows: [Show]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView properties
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.estimatedRowHeight = 10
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // get tv show data from our JSON
        shows = getFakeData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Make sure our shows has data, otherwise return 0 rows
        guard let shows = shows else { return 0 }
        
        // If shows exist, count the number of tv shows we put in the list and return that many rows.
        return shows.count
    }
    
    
    /* cellForRowAt will be called as many times as you have "numberOfRows". Each time it is called,
     * we will make a new cell, grab ONE show from the model, and use that show's data to populate the cell.
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Make sure our shows has data, otherwise we'll just return an empty tableViewCell
        guard let shows = shows else { return UITableViewCell() }
        
        // If 'shows' has some tv shows in it, make a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageLabelCell") as! ImageLabelCell
        
        // Grab the show from the model
        let tvShow = shows[indexPath.row] as Show
        
        // Set the label and the image using the data from our chosen tvShow
        let tvShowName = tvShow.artistName
        let imageName = tvShow.imageName
        cell.setup(labelName: tvShowName, imageName: imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // set the title of the section
        return "Shows"
    }
}

