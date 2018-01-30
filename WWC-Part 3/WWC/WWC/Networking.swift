import Foundation

extension ViewController {
    
    func getFakeData() -> [Show]? {
        // Loads in our dummy JSON response file
        if let jsonString = loadJSONFile(withName: "tvShows") {
            if let jsonData = jsonString.data(using: .utf8) {
                /* Tries casting the JSON as type ShowResponse (see Show.swift) and after casting it,
                 * returns the list of shows
                 */
                let response = try? JSONDecoder().decode(ShowResponse.self, from: jsonData).results
                return response
            }
        }
        return []
    }
    
    //Add the folowing two lines of code to your ViewController when retrieving live data
    //let defaultSession = URLSession(configuration: .default)
    //var dataTask: URLSessionDataTask?
    
    //Retrieve Live Data Using the iTunes API
    //    func getData(with searchTerm: String) {
    //        let url = "https://itunes.apple.com/search"
    //        // 1 Cancel the data task if it already exists
    //        dataTask?.cancel()
    //        // 2 Begin building the URL endpoint you are going to make a request to
    //        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
    //            urlComponents.query = "media=tvShow&term=\(searchTerm)"
    //            guard let url = urlComponents.url else { return }
    //            // 3 Create the task using the url endpoint you created
    //            dataTask = defaultSession.dataTask(with: url) { data, response, error in
    //                defer { self.dataTask = nil }
    //                // 4 Decide what you want to do if there's an error, or what you'd like to do if it's successful
    //                if let error = error {
    //                    print("DataTask error: " + error.localizedDescription + "\n")
    //                } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
    //                    let decoder = JSONDecoder()
    //                    do {
    //                        let results = try decoder.decode(ShowResponse.self, from: data).results
    //                        self.shows = results.sorted{ $0.artistName < $1.artistName }
    //                    } catch {
    //                        print(error.localizedDescription)
    //                    }
    //                    // 5 Update the UI
    //                    DispatchQueue.main.async {
    //                        self.tableView.reloadData()
    //                    }
    //                }
    //            }
    //            // 6 Start the task
    //            dataTask?.resume()
    //        }
    //    }
    
    func loadJSONFile(withName name: String) -> String? {
        // This function is used for reading in the tvShows.json and getting it's data ready to be read.
        if let path = Bundle(for: type(of: self)).path(forResource: name, ofType: "json") {
            do {
                let fileURL = URL(fileURLWithPath: path)
                let jsonData = try Data(contentsOf: fileURL, options: .mappedIfSafe)
                return String(data: jsonData, encoding: .utf8)
            } catch {
                print("Error converting to JSON")
            }
        }
        return nil
    }
}


