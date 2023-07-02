//
//  FabricaViewController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 16.06.2023.
//

import UIKit
import SnapKit

class FabricaViewController: UIViewController {

    @IBOutlet weak var fabricaLabel: UILabel!
    
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var fabricaSamocat = [FabricaProtocol]()
    
    //public static let storyboardVC = UIStoryboard(name: "", bundle: Bundle.PodProd).instantiateInitialViewController()!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.backgroundColor = .red
        createSamocat(samocat: .electroSamocat)
        runInfoFunc()
        label.text = "wgkbegrwjpeorhbjpeb"
        setubView()
    }
    
    private func createSamocat(samocat: TypeSamocat) {
        let newSamocat = FabricaTypeSamocat.fabricaTypeSamocat.createdSamocat(name: samocat)
        fabricaSamocat.append(newSamocat)
    }
    
    private func runInfoFunc() {
        for ex in fabricaSamocat {
            ex.moving()
        }
    }
    
    private func setubView() {
        view.addSubview(label)
        setupConstraint()
    }
    
    func setupConstraint() {
        label.snp.makeConstraints { make in
            make.top.equalTo(view).offset(Constraint.top)
            make.leading.equalTo(view).offset(Constraint.left)
        }
    }
    
    private enum Constraint {
        static let top = 200
        static let left = 40
    }
}
