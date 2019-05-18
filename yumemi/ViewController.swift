//
//  ViewController.swift
//  yumemi
//
//  Created by kitaharamugirou on 2019/05/18.
//  Copyright © 2019 kitaharamugirou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let usecase = FuriganaUsecase()
    @IBOutlet weak var upperTextView: UITextView!
    @IBOutlet weak var lowerTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        upperTextView.text = ""
        lowerTextView.text = ""
        lowerTextView.isEditable = false
        upperTextView.delegate = self
        
        usecase.test()
    }
    
    
    
}

extension ViewController : UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
}

