//
//  CommercesTableViewController.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import UIKit
import PKHUD

class CommercesTableViewController: UITableViewController {
    
    lazy var interactor: CommercesInteractor = {
        let interactor = CommercesInteractor(interface: self)
        return interactor
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
		setupView()
        
        interactor.requestData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func setupView() {
		
		self.title = "Commerces"
		
		let nib = UINib(nibName: "CommerceTableViewCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: CommerceTableViewCell.cellIdentifier)
	}
	

}

extension CommercesTableViewController {
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return interactor.commercesCount()
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CommerceTableViewCell.cellIdentifier, for: indexPath) as! CommerceTableViewCell
		
		return interactor.configure(cell: cell, at: indexPath.row)
	}
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		interactor.goToDetailAt(index: indexPath.row, viewController: self)
    }
    
}


extension CommercesTableViewController: CommercesInteractorOutput {
    
    func loadData() {
        self.tableView.reloadData()
    }
    
    func showLoading() {
        HUD.show(.labeledProgress(title: "loading...", subtitle: nil))
    }
    
    func dismissLoading() {
        HUD.hide(animated: true)
    }
	
	
    
    
}













