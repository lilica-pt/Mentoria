//
//  ViewController.swift
//  Taskez
//
//  Created by Lili Cabral on 17/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roundedTopView: UIView!
    @IBOutlet weak var roundedBottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
    }

    func setUpUI () {
        roundedTopView.layer.cornerRadius = 208
        roundedBottomView.layer.cornerRadius = 208
    }

}

