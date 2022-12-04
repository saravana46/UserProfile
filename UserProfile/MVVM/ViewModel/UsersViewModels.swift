//
//  UsersViewModels.swift
//  UserProfile
//
//  Created by Saravana on 04/12/22.
//

import Foundation
import UIKit

class UsersViewModel {
    
    var Users:UsersModel?
    
    let sourcesURL = URL(string: "https://randomuser.me/api/")!
    
    func apiToGetQuestionData(completion : @escaping () -> ()) {
        
        URLSession.shared.dataTask(with: sourcesURL) { [self] (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let userData = try! jsonDecoder.decode(UsersModel.self, from: data)
                self.Users = userData
                completion()
            }
        }.resume()
    }
    
    func setUserName()-> String {
        let userName = "\(Users?.results?.first?.name?.title ?? "") \(Users?.results?.first?.name?.first ?? "") \(Users?.results?.first?.name?.last ?? "")"
        return userName
    }
    
    func loadFrom(userImageView: UIImageView) {
        guard let url = URL(string: Users?.results?.first?.picture?.large ?? "") else {
            return
        }
        
        DispatchQueue.main.async {
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    userImageView.image = loadedImage
                }
            }
        }
    }
    
    func setAddress()-> String {
        let userAddress = "\(Users?.results?.first?.location?.street?.number ?? 0),\(Users?.results?.first?.location?.street?.name ?? "")\n\(Users?.results?.first?.location?.city ?? ""),\(Users?.results?.first?.location?.state ?? ""),\(Users?.results?.first?.location?.country ?? "")\n\(Users?.results?.first?.location?.postcode ?? 0)"
        return userAddress
    }
    
    func setCountry()-> String {
        let userAddress = "\(Users?.results?.first?.location?.country ?? "")"
        return userAddress
    }
    
    func setAge()-> String {
        let userAge = "\(Users?.results?.first?.dob?.age ?? 0)"
        return userAge
    }
    
    func setState()-> String {
        let userState = "\(Users?.results?.first?.location?.state ?? "")"
        return userState
    }
    
    func setPhone()-> String {
        let userPhone = "\(Users?.results?.first?.phone ?? "")"
        return userPhone
    }
    
    func setEmail()-> String {
        let userEmail = "Email - \(Users?.results?.first?.email ?? "")"
        return userEmail
    }
    
    func setGender()-> String {
        let userGender = "Gender - \(Users?.results?.first?.gender ?? "")"
        return userGender
    }
    
    func setCell()-> String {
        let userCell = "Cell - \(Users?.results?.first?.cell ?? "")"
        return userCell
    }
    
    
}
