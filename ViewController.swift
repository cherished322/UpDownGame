//
//  ViewController.swift
//  UpDownGame
//
//  Created by 강태윤 on 2020/12/23.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Var/Let
    var randomValue: Int = 0
    var tryCount: Int = 0
    
    //MARK: - IBOutlet
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 15.0
        // Do any additional setup after loading the view.
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .highlighted)
        reset()
    }
    
    //MARK: - IBAction
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        sliderValueLabel.text = String(Int(slider.value))
    }
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            showAlert(message: "정답입니다.")
            reset()
            
        }else if tryCount >= 5 {
            showAlert(message: "틀렸습니다.")
            reset()
        }else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        }else if randomValue < hitValue {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        resetAlert(message: "초기화 하시겠습니까?")
    }
    
    //MARK: - SomeFunction
    func reset() {
        
        print("RESET!!")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
        
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        
    }
    func showAlert(message: String) {
        let scoreAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in self.reset() }
        scoreAlert.addAction(okAction)
        present(scoreAlert,
                animated: true,
                completion: nil)
        
    }
    func resetAlert(message: String) {
        let resetAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "확인", style: .default) { (action) in self.reset() }
        let noAction = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        resetAlert.addAction(yesAction)
        resetAlert.addAction(noAction)
        present(resetAlert,
                animated: true,
                completion: nil)
    }
    
}

//alert 복습
