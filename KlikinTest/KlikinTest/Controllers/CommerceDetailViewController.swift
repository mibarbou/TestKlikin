//
//  CommerceDetailViewController.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import UIKit

class CommerceDetailViewController: UIViewController {
    
    let commerce: Commerce
    
    @IBOutlet weak var nameLabel: UILabel!
    
    init(commerce: Commerce) {
        
        self.commerce = commerce
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupView() {
        self.nameLabel.text = self.commerce.name
    }


}
