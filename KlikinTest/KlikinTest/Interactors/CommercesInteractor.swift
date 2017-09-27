//
//  CommercesInteractor.swift
//  KlikinTest
//
//  Created by Michel Barbou Salvador on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation


protocol CommercesInteractorInput :class {
    
    func requestData()
}

protocol CommercesInteractorOutput : class {
    
    func loadData()
    func showLoading()
    func dismissLoading()
}


class CommercesInteractor: CommercesInteractorInput {
    
    fileprivate var allCommerces = [Commerce]()
    
    weak fileprivate var interface :CommercesInteractorOutput?
    
    init(interface: CommercesInteractorOutput) {
        self.interface = interface
    }
    
    func requestData() {
        
        self.interface?.showLoading()
        
        ApiClient.commerces(success: { (commerces) in
            self.allCommerces = commerces
            self.interface?.dismissLoading()
            self.interface?.loadData()
        }) { (error) in
            self.interface?.dismissLoading()
        }
    }
    
    
    func commercesCount() -> Int {
        return self.allCommerces.count
    }
    
    
    func commerceAt(index: Int) -> Commerce? {
        return self.allCommerces[index]
    }
    
    
}















