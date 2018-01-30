import Foundation

struct ShowResponse: Codable {
    /* This object stores the results of a successful networking call.
     * It tells us how many shows we got back, and gives us a list of these television shows
     * that we'll store as type "Show"
     */
    let resultCount: Int
    let results: [Show]
}

struct Show: Codable {
    /* This object represents a show. We will only use 3 properties from the response. You'll notice
     * the JSON response has more, but we'll choose to ignore the ones we don't care about, like
     * primaryGenreName and collectionType.
     */
    
    /* Example of one JSON response we will cast to be of type Show
     {
     "collectionType":"TV Season",
     "artistName":"The Good Doctor",
     "primaryGenreName":"Drama",
     "longDescription":"Shaun Murphy, a young surgeon with autism and savant syndrome, relocates from a quiet country life to join a prestigious hospital's surgical unit. Alone in the world and unable to personally connect with those around him, Shaun uses his extraordinary medical gifts to save lives and challenge the skepticism of his colleagues.",
     "imageName":"the-good-doctor.png"
     }
     */
    
    let artistName: String
    let longDescription: String
    let imageName: String
}

