//
//  DetailsViewController.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 28-04-22.
//

import UIKit

class DetailsViewController: BaseViewController {

    //MARK: -- Outlets
    @IBOutlet weak var mCodeLb: UILabel!
    @IBOutlet weak var mNameLb: UILabel!
    @IBOutlet weak var mUniteMeasureLb: UILabel!
    @IBOutlet weak var mDateLb: UILabel!
    @IBOutlet weak var mContentStackV: UIStackView!
    @IBOutlet weak var mValueLb: UILabel!
    
    lazy var presenter = DetailsPresenter(delegate: self)

    //MARK: -- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Methods
    func configureUI() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        mContentStackV.layer.cornerRadius = 5
    }
   
}


extension DetailsViewController: DetailsPresenterDelegate {
    /// Show details
    func presentDetails(valuta: Valuta) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.mCodeLb?.text = valuta.codigo
            self.mNameLb?.text = valuta.nombre
            self.mUniteMeasureLb.text = valuta.unidad_medida
            self.mDateLb.text = valuta.fecha.convertIsoDateFormater()
            self.mValueLb.text = "\(valuta.valor)"
        }

       
    }
    
    
}
