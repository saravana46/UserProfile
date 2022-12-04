//
//  UsersModel.swift
//  UserProfile
//
//  Created by Saravana on 04/12/22.
//

import Foundation

struct UsersModel : Codable {
    let results : [Results]?

    enum CodingKeys: String, CodingKey {

        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }

}

struct Results : Codable {
    let gender : String?
    let name : Name?
    let location : Location?
    let email : String?
    let dob : Dob?
    let phone : String?
    let cell : String?
    let picture : Picture?
    let nat : String?

    enum CodingKeys: String, CodingKey {

        case gender = "gender"
        case name = "name"
        case location = "location"
        case email = "email"
        case dob = "dob"
        case phone = "phone"
        case cell = "cell"
        case picture = "picture"
        case nat = "nat"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        name = try values.decodeIfPresent(Name.self, forKey: .name)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        dob = try values.decodeIfPresent(Dob.self, forKey: .dob)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        cell = try values.decodeIfPresent(String.self, forKey: .cell)
        picture = try values.decodeIfPresent(Picture.self, forKey: .picture)
        nat = try values.decodeIfPresent(String.self, forKey: .nat)
    }

}

struct Name : Codable {
    let title : String?
    let first : String?
    let last : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case first = "first"
        case last = "last"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        first = try values.decodeIfPresent(String.self, forKey: .first)
        last = try values.decodeIfPresent(String.self, forKey: .last)
    }

}

struct Picture : Codable {
    let large : String?

    enum CodingKeys: String, CodingKey {

        case large = "large"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        large = try values.decodeIfPresent(String.self, forKey: .large)
    }

}

struct Location : Codable {
    let street : Street?
    let city : String?
    let state : String?
    let country : String?
    let postcode : Int?

    enum CodingKeys: String, CodingKey {

        case street = "street"
        case city = "city"
        case state = "state"
        case country = "country"
        case postcode = "postcode"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street = try values.decodeIfPresent(Street.self, forKey: .street)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        postcode = try values.decodeIfPresent(Int.self, forKey: .postcode)
    }

}

struct Street : Codable {
    let number : Int?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case number = "number"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}

struct Dob : Codable {
    let date : String?
    let age : Int?

    enum CodingKeys: String, CodingKey {

        case date = "date"
        case age = "age"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        age = try values.decodeIfPresent(Int.self, forKey: .age)
    }

}
