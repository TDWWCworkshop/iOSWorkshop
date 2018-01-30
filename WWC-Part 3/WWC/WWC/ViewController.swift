
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // Our "dataSource" or "model" is the data that we want to display
    var shows: [Show]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView properties
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.estimatedRowHeight = 10
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // get tv show data from our JSON
        shows = getFakeData()
        
        // set the original state of the tableview to not be editing
        self.tableView.isEditing = false
    }
    
    @IBAction func editTapped(_ sender: Any) {
        // set the isEditing property to be the opposite of whatever it is already.
        // this allows us to toggle between editing and not editing
        self.tableView.isEditing = !self.tableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // check to see if editing style is for deleting a row
        if editingStyle == .delete {
            
            // if true, delete our show from our list of shows
            shows?.remove(at: indexPath.row)
            
            // have the tableView delete the cell we selected
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        /* We can use this function to decide whether or not rows should be allowed to be moved.
         * For example, to stop the user from moving the first row we could type:
        if indexPath.row == 0 {
            return false
        } else {
            return true
        }
         * However, we're going to allow movement of ALL rows, so we will simply type return true
         */
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // Update our model's reference to the moved object
        
        // grab a reference to the show that the user is trying to move
        if let showToMove = shows?[sourceIndexPath.row] {
            
            // remove the object from its old location in the model 'shows'
            shows?.remove(at: sourceIndexPath.row)
            
            // insert the moved object into its new location in the model 'shows'
            shows?.insert(showToMove, at: destinationIndexPath.row)
        }
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

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //check if tv shows exist
        guard let shows = shows else {
            //if tv shows do not exist, deselect the row, don't display pop-up
            self.tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        
        //find view Controller by its storyboard ID
        let movieDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        
        //set tv show name, image and description using the selected tv show
        movieDetailVC?.tvShowName = shows[indexPath.row].artistName
        movieDetailVC?.tvShowImageName = shows[indexPath.row].imageName
        movieDetailVC?.tvShowDescription = shows[indexPath.row].longDescription
        
        //deselect row after selection
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        //presentation style and action
        movieDetailVC?.modalPresentationStyle = .popover
        self.present(movieDetailVC!, animated: true, completion: nil)
    }
}


