import Foundation

struct Quote: Codable { // encodable, decodable
    
    var quote: String
    var author: String
    var image: String
    
    var quoteFormatted: String {
        return "❝" + quote + "❞"
    }
    
}
