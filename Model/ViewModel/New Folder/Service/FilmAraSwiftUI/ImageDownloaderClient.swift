
import Foundation
import Combine
import SwiftUI

class ImageDownloaderClient: ObservableObject {
    @Published var indirilengorsel: Data?
    
    func GorselIndır(url: String, completion: @escaping (Result<Data, ImageError>) -> Void) {
        guard let url = URL(string: url) else {
            return completion(.failure(.yanlisurl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                return completion(.failure(.yanlisgorsel))
            }
            
            DispatchQueue.main.async {
                self.indirilengorsel = data
                completion(.success(data))
            }
        }.resume()
    }
}

enum ImageError: Error {
    case yanlisurl
    case yanlisgorsel
}
