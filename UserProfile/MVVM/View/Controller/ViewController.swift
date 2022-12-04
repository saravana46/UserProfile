//
//  ViewController.swift
//  UserProfile
//
//  Created by Saravana on 04/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userPopView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryValueLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageValueLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var stateValueLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneValueLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    
    
    var viewModel = UsersViewModel()
    var Users:UsersModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Profile"
        initialLoads()
        viewModel.apiToGetQuestionData { [self] in
            self.Users = self.viewModel.Users
            DispatchQueue.main.async {
                self.setDesignUI()
            }
            print("Users: ",self.Users)
        }
    }
    
    func initialLoads() {
        
        userPopView.layer.shadowColor = UIColor.black.cgColor
        userPopView.layer.shadowOffset = CGSize(width: 3, height: 3)
        userPopView.layer.shadowOpacity = 0.5
        userPopView.layer.shadowRadius = 4.0
        userPopView.layer.cornerRadius = 10
        
        firstView.layer.borderWidth = 0.5
        secondView.layer.borderWidth = 0.5
        firstView.layer.cornerRadius = 5
        secondView.layer.cornerRadius = 5
        
        firstView.layer.borderColor = UIColor.darkGray.cgColor
        secondView.layer.borderColor = UIColor.darkGray.cgColor
        
        userImageView.layer.borderWidth = 0.5
        userImageView.layer.borderColor = UIColor.gray.cgColor
        userImageView.layer.cornerRadius = 5
        
        countryLabel.text = "Country"
        ageLabel.text = "Age"
        stateLabel.text = "State"
        phoneLabel.text = "Phone"
        
    }
    
    func setDesignUI() {
        
        userNameLabel.text = viewModel.setUserName()
        viewModel.loadFrom(userImageView: userImageView)
        addressLabel.text = viewModel.setAddress()
        countryValueLabel.text = viewModel.setCountry()
        ageValueLabel.text = viewModel.setAge()
        stateValueLabel.text = viewModel.setState()
        phoneValueLabel.text = viewModel.setPhone()
        emailLabel.text = viewModel.setEmail()
        genderLabel.text = viewModel.setGender()
        cellLabel.text = viewModel.setCell()
        
    }


}

