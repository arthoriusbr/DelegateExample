//
//  ViewController.swift
//  DelegateExample
//
//  Created by administrador on 17/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var matriculadosCounterView: LabelResponsivaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.matriculadosCounterView.dataSource = self
        self.matriculadosCounterView.delegate = self
        self.matriculadosCounterView.reloadData()
    }

}

extension ViewController: LabelResponsivaViewDataSource, LabelResponsivaViewDelegate {
    //delegate functions
    func didSelect() {
        print("foi clicado")
        
    }
    
    //dataSource functions
    func colorOfText() -> UIColor {
        return .blue
    }
    
    func numberOfLabel() -> Int {
        return 3
    }
}

