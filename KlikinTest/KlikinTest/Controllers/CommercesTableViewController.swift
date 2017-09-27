//
//  CommercesTableViewController.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import UIKit

class CommercesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

		setupView()
		
        ApiClient.commerces(success: { (commerces) in
            print(commerces)
        }) { (error) in
            print(error)
        }
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
		// #warning Incomplete implementation, return the number of sections
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return 10
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CommerceTableViewCell.cellIdentifier, for: indexPath) as! CommerceTableViewCell
		
		// Configure the cell...
		cell.nameLabel.text = "Comercio " + "\(indexPath.row + 1)"
		
		return cell
	}
}














