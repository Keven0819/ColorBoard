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
    
    // vRGB 顏色控制
    @IBAction func SliderSum(_ sender: Any) {
        
        //除以255是因為顏色範圍是0~255，但顏色要正確顯示到View，要是0~1
        vRGB.backgroundColor = UIColor(
            red: CGFloat((sldRedValue.value)/255),
            green: CGFloat((sldGreenValue.value)/255),
            blue: CGFloat((sldBlueValue.value)/255),
            alpha: 1
        )
    }
    
    // Slider 輸入數值
    @IBAction func SliderToText(_ sender: UISlider) {
        
        // 紅綠藍三個顏色數值的顯示，顯示在 TextField
        txfRedText.text = "\(Int(sldRedValue.value))"
        txfGreenText.text = "\(Int(sldGreenValue.value))"
        txfBlueText.text = "\(Int(sldBlueValue.value))"
        
        // 呼叫 View，將 Slider 的值傳入 vRGB 讓他顯示顏色
        SliderSum(sender)
    }
    
    // 會有三個部分一樣邏輯的 Code 來分別控制三種顏色
    @IBAction func TextToSlider(_ sender: UITextField) {
        
        // 紅色
        if let redStringValue = txfRedText.text {
            
            // 限制輸入的值只能用數字
            if let redIntValue = Int(redStringValue) {
                
                // 限制最高255，超過255會自動變成255，最低0
                let redValue = max(0, min(255,redIntValue))
                sldRedValue.setValue(Float(redValue), animated: true)
                txfRedText.text = "\(redValue)"
                
                // 如果不是數字的話會自動歸０
            } else {
                sldRedValue.setValue(0, animated: true)
                txfRedText.text = "0"
            }
            
            // 沒有輸入值的話也是0
        } else {
            sldRedValue.setValue(0, animated: true)
        }
        
        // 綠色
        if let greenStringValue = txfGreenText.text {
            
            // 限制輸入的值只能用數字
            if let greenIntValue = Int(greenStringValue) {
                
                // 限制最高255，超過255會自動變成255，最低0
                let greenValue = max(0, min(255,greenIntValue))
                sldGreenValue.setValue(Float(greenValue), animated: true)
                txfGreenText.text = "\(greenValue)"
                
                // 如果不是數字的話會自動歸０
            } else {
                sldGreenValue.setValue(0, animated: true)
                txfGreenText.text = "0"
            }
            
            // 沒有輸入值的話也是0
        } else {
            sldGreenValue.setValue(0, animated: true)
        }
        
        // 藍色
        if let blueStringValue = txfBlueText.text {
            
            // 限制輸入的值只能用數字
            if let blueIntValue = Int(blueStringValue) {
                let blueValue = max(0, min(255,blueIntValue))
                sldBlueValue.setValue(Float(blueValue), animated: true)
                txfBlueText.text = "\(blueValue)"
                
                // 如果不是數字的話會自動歸０
            } else {
                sldBlueValue.setValue(0, animated: true)
                txfBlueText.text = "0"
            }
            
            // 沒有輸入值的話也是0
        } else {
            sldBlueValue.setValue(0, animated: true)
        }
        
        // 以上程式執行完之後，呼叫 SliderSum，令 vRGB 做改變
        SliderSum(sender)
    }
    
    // MARK: - Function
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // 令用戶按下 Return(Enter) 鍵時會立即輸入，並隱藏鍵盤
        textField.resignFirstResponder()
        
        // 在 TextField 輸入值之後 同步我的 Slider
        TextToSlider(textField)
        return true
    }
}

// MARK: - Extensions
