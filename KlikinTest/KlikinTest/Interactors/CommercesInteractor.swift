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
	func goToDetailAt(index: Int, viewController: CommercesTableViewController)
	func configure(cell: CommerceTableViewCell, at index: Int) -> CommerceTableViewCell
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
	
	fileprivate func commerceAt(index: Int) -> Commerce? {
		return self.allCommerces[index]
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
	
	func goToDetailAt(index: Int, viewController: CommercesTableViewController) {
		if let commerce = commerceAt(index: index) {
			let commerceDetailVC = CommerceDetailViewController(commerce: commerce)
			viewController.navigationController?.pushViewController(commerceDetailVC, animated: true)
		}
	}
	
	func configure(cell: CommerceTableViewCell, at index: Int) -> CommerceTableViewCell {
		if let commerce = commerceAt(index: index) {
			cell.configureCellWith(commerce: commerce)
		}
		return cell
	}

}















