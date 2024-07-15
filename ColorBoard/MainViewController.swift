//
//  MainViewController.swift
//  ColorBoard
//
//  Created by imac-2627 on 2024/7/11.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var vRGB: UIView!
    @IBOutlet weak var lbRed: UILabel!
    @IBOutlet weak var lbGreen: UILabel!
    @IBOutlet weak var lbBlue: UILabel!
    @IBOutlet weak var sldRedValue: UISlider!
    @IBOutlet weak var sldGreenValue: UISlider!
    @IBOutlet weak var sldBlueValue: UISlider!
    @IBOutlet weak var txfRedText: UITextField!
    @IBOutlet weak var txfGreenText: UITextField!
    @IBOutlet weak var txfBlueText: UITextField!
    
    
    // MARK: - Property
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txfRedText.delegate = self
        txfGreenText.delegate = self
        txfBlueText.delegate = self
    }
    
    
    // MARK: - UI Settings
    
    // MARK: - IBAction
    
    @IBAction func SliderSum(_ sender: Any){
        vRGB.backgroundColor = UIColor(
            red: CGFloat((sldRedValue.value)/255),
            green: CGFloat((sldGreenValue.value)/255),
            blue: CGFloat((sldBlueValue.value)/255),
            alpha: 1
        )
    }
    
    @IBAction func SliderToText(_ sender: UISlider){
        txfRedText.text = "\(Int(sldRedValue.value))"
        txfGreenText.text = "\(Int(sldGreenValue.value))"
        txfBlueText.text = "\(Int(sldBlueValue.value))"
        SliderSum(sender)
    }
    
    @IBAction func TextToSlider(_ sender: UITextField){
        if let redStringValue = txfRedText.text {
            if let redIntValue = Int(redStringValue) {
                let redValue = max(0, min(255,redIntValue))
                sldRedValue.setValue(Float(redValue), animated: true)
                txfRedText.text = "\(redValue)"
            } else {
                sldRedValue.setValue(0, animated: true)
                txfRedText.text = "0"
            }
        } else {
            sldRedValue.setValue(0, animated: true)
        }
        
        if let greenStringValue = txfGreenText.text {
            if let greenIntValue = Int(greenStringValue) {
                let greenValue = max(0, min(255,greenIntValue))
                sldGreenValue.setValue(Float(greenValue), animated: true)
                txfGreenText.text = "\(greenValue)"
            } else {
                sldGreenValue.setValue(0, animated: true)
                txfGreenText.text = "0"
            }
        } else {
            sldGreenValue.setValue(0, animated: true)
        }
        
        if let blueStringValue = txfBlueText.text {
            if let blueIntValue = Int(blueStringValue) {
                let blueValue = max(0, min(255,blueIntValue))
                sldBlueValue.setValue(Float(blueValue), animated: true)
                txfBlueText.text = "\(blueValue)"
            } else {
                sldBlueValue.setValue(0, animated: true)
                txfBlueText.text = "0"
            }
        } else {
            sldBlueValue.setValue(0, animated: true)
        }
        SliderSum(sender)
    }
    
    // MARK: - Function
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        TextToSlider(textField)
        return true
    }
}

// MARK: - Extensions
