//
//  ViewController.swift
//  LoginPage
//
//  Created by Lili Cabral on 15/05/22.
//

import UIKit

class SignViewController: UIViewController {

    @IBOutlet weak var backgroundNameView: UIView!
    @IBOutlet weak var backgroundEmailView: UIView!    
    @IBOutlet weak var backgroundPasswordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arredondarEPorSombra(minhaView: backgroundNameView)
        arredondarEPorSombra(minhaView: backgroundEmailView)
        arredondarEPorSombra(minhaView: backgroundPasswordView)
    }

    func arredondarEPorSombra(minhaView: UIView) {
        minhaView.layer.cornerRadius = 6
        minhaView.layer.masksToBounds = false
        minhaView.layer.shadowColor = UIColor.black.cgColor
        minhaView.layer.shadowOpacity = 0.1
        minhaView.layer.shadowOffset = CGSize(width: -1, height: 1)
        minhaView.layer.shadowRadius = 2
        minhaView.layer.shadowPath = UIBezierPath(rect: minhaView.bounds).cgPath
        minhaView.layer.shouldRasterize = true
    }

}

