//
//  OpenModuleViewController.swift
//  FalabellaApp
//
//  Created by Karine Karapetyan on 01-05-22.
//

import UIKit
import Falabella


class OpenModuleViewController: UIViewController {

    @IBOutlet weak var mOpenModule: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mOpenModule.layer.cornerRadius = 5
        
    }

    @IBAction func openModule(_ sender: UIButton) {
        
        let fal = Falabella()
        let vc = fal.getCurrentViewController()
        guard let vc = vc else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    


}
