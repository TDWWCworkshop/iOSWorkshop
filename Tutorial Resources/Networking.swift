import Foundation

extension ViewController {
    
    func getFakeData() -> [Show]? {
        if let jsonString = loadJSONFile(withName: "tvShows") {
            if let jsonData = jsonString.data(using: .utf8) {
                let response = try? JSONDecoder().decode(ShowResponse.self, from: jsonData).results
                return response
            }
        }
        return []
    }
    
    //Add the folowing two lines of code to your ViewController when retirving live data
    //let defaultSession = URLSession(configuration: .default)
    //var dataTask: URLSessionDataTask?
    
    //Retrieve Live Data Using the ITunes API
    //    func getData(with searchTerm: String) {
    //        dataTask?.cancel()
    //        let url = "https://itunes.apple.com/search"
    //        // 1
    //        dataTask?.cancel()
    //        // 2
    //        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
    //            urlComponents.query = "media=tvShow&term=\(searchTerm)"
    //            // 3
    //            guard let url = urlComponents.url else { return }
    //            // 4
    //            dataTask = defaultSession.dataTask(with: url) { data, response, error in
    //                defer { self.dataTask = nil }
    //                // 5
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
    //                    // 6 Update the UI
    //                    DispatchQueue.main.async {
    //                        self.tableView.reloadData()
    //                    }
    //                }
    //            }
    //            // 7
    //            dataTask?.resume()
    //        }
    //    }
    
    func loadJSONFile(withName name: String) -> String? {
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
