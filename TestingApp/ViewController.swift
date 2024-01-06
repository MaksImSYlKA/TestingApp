//
//  ViewController.swift
//  TestingApp
//
//  Created by Максим Сылка on 05.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    
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
            case 1:
                mainLabel.text = "Th second segment is selected"
            case 2:
                                mainLabel.text = "Th third segment is selected"
            default:
                mainLabel.text = slider.value.formatted()
            
                
        }
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

}

