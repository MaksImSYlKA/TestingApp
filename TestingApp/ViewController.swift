//
//  ViewController.swift
//  TestingApp
//
//  Created by Максим Сылка on 05.01.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var textField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegment(
            withTitle: "Third",
            at: 2,
            animated: false
        )
        setupSlider()
        setupMainLabel()
    }
    @IBAction func sliderAction() {
        mainLabel.text = slider.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }
    @IBAction func segmentedControlAction(){
        switch segmentedControl.selectedSegmentIndex {
            case 0:
                mainLabel.text = "Th first segment is selected"
                mainLabel.textColor = .red
            case 1:
                mainLabel.text = "Th second segment is selected"
                mainLabel.textColor = .yellow
                
            default:
                mainLabel.text = "The third segment is selected"
                mainLabel.textColor = .green
        }
    }
  
    @IBAction func doneButtonAction() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Error. TF is emptyю", andMessage: "Please enter you name.")
            return
        }
        
        if let _ = Double(inputText){
            showAlert(withTitle: "Wrong Format", andMessage: "Please, enter you name")
        }
        
        let userNamePattern = "^[a-zA-Z ]{3, 20}$"
        let isUsernameValid =  NSPredicate(format: "SELF MATCHES %@", userNamePattern).evaluate(with: inputText)
        
        if !isUsernameValid{
            showAlert(withTitle: "Wrong Format", andMessage: "Please, enter you name")
            return
        }
        
        mainLabel.text = inputText
        textField.text = ""
    }
    
  
    private func setupSlider(){
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .green
        
    }
    private func setupMainLabel(){
        mainLabel.text = slider.value.formatted()
        mainLabel.font = .systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    private func showAlert(withTitle title: String, andMessage: String){
        let alert = UIAlertController(
            title: title,
            message: "",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "Ок",
            style: .default) { _ in
                self.textField.text = ""
            }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

