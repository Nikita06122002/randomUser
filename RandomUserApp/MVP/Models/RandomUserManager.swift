//
//  RandomUserManager.swift
//  RandomUserApp
//
//  Created by macbook on 27.11.2023.
//

import Foundation

struct RandomUserManager {
    let url = "https://randomuser.me/api"
    weak var delegate: RandomUserDelegate?
    
    func fetchUser() {
        performRequest(with: url)
        print("fetch")
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safedData = data {
                    if let user = parseJSON(safedData) {
                        self.delegate?.didUpdateUser(self, user: user)
                    }
                }
            }
            task.resume()
            print("task")
        }
    }
    
    func parseJSON(_ userData: Data) -> UserModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(RandomUserModel.self, from: userData)
            let result = decodedData.results[0]
            let name = result.name
            let first = name.first
            let last = name.last
            let title = name.title
            let gender = result.gender
            let email = result.email
            let picture = result.picture.large
            
            let user = UserModel(first: first, last: last, title: title, gender: gender, email: email, picture: picture)
            return user
        }
        catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
