//
//  GenerateQRViewController.swift
//  QRTreasureHunt
//
//  Created by Lucas C Barros on 2023-12-10.
//  Ref: https://www.youtube.com/watch?v=6ZATcKiol88

import UIKit

class GenerateQRViewController: UIViewController {

//    var generateButton = UIButton()
    var codeView = UIImageView()
//    var codeStyleControl = UISegmentedControl()
    
    
    var dataToCode = "Hello World!"
    var filter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green
        
//        self.view.addSubview(generateButton)
//        generateButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(codeView)
        codeView.translatesAutoresizingMaskIntoConstraints = false
        codeView
            .centerToSuperview()
            .heightTo(200)
            .aspectRatio()
            .backgroundColor = .darkGray
        
        let data = dataToCode.data(using: .ascii, allowLossyConversion: false)
        
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        filter = CIFilter(name: "CIQRCodeGenerator")
        filter.setValue(data, forKey: "inputMessage")
        
        let image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
        
        codeView.image = image
    }
}
