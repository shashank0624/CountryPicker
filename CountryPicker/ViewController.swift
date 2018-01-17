//
//  ViewController.swift
//  CountryPicker
//
//  Created by Shashank Panwar on 1/17/18.
//  Copyright © 2018 Shashank Panwar. All rights reserved.
//

import UIKit
import MRCountryPicker

class ViewController: UIViewController, MRCountryPickerDelegate {

    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryCode: UILabel!
    @IBOutlet weak var phoneCode: UILabel!
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var countryCodeTxt : UITextField!
    
    let countryPicker = MRCountryPicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       countryPicker.countryPickerDelegate = self
        self.countryCodeTxt.inputView = countryPicker
        let localIdentifier = Locale.current.identifier
        let locale = NSLocale(localeIdentifier: localIdentifier)
        if let countryCode = locale.object(forKey: .countryCode) as? String {
            if let country:String = locale.displayName(forKey: .countryCode, value: countryCode) {
                countryPicker.setCountryByName(country)
            }
            countryPicker.setCountry(countryCode)
        }
        countryPicker.setLocale(localIdentifier)
        
    }
    
    public func countryPhoneCodePicker(_ picker: MRCountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        self.countryName.text = name
        self.countryCode.text = countryCode
        self.phoneCode.text = phoneCode
        self.countryFlag.image = flag
        self.countryCodeTxt.text = phoneCode
        self.countryCodeTxt.resignFirstResponder()
    }
    
}

