//
//  LabelResponsivaView.swift
//  DelegateExample
//
//  Created by administrador on 17/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit
import Reusable

//protocolo responsável por setar os dados
protocol LabelResponsivaViewDataSource {
    func numberOfLabel() -> Int
    func colorOfText() -> UIColor
}

//protocolo responsável pelos callbacks de eventos
protocol LabelResponsivaViewDelegate {
    func didSelect()
}

class LabelResponsivaView: UIView, NibOwnerLoadable {
    @IBOutlet weak var labelCounter: UILabel!
    
    //MARK: - Vars
    var dataSource: LabelResponsivaViewDataSource?
    var delegate: LabelResponsivaViewDelegate?
    
    //MARK: - Life
    override func awakeFromNib() {
        super.awakeFromNib()
        self.loadNibContent()
        self.configure()
    }
    
    private func configure() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(LabelResponsivaView.didSelectView))
        self.addGestureRecognizer(gesture)
    }
    
    func reloadData() {
        self.labelCounter.text = "Matriculados: \(self.dataSource?.numberOfLabel() ?? 0)"
        self.labelCounter.textColor = self.dataSource?.colorOfText()
    }
    
    //MARK: - Actions
    @objc func didSelectView(){
        self.delegate?.didSelect()
    }
    
}
