//
//  ViewController.swift
//  Table View Cell Selection
//
//  Created by Fahim Rahman on 12/12/20.
//

// MARK: - Table View Multiple Cell Selection

import UIKit

// MARK: - Table View

final class ViewController: UIViewController {
    
    
    // MARK:- Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
    private var arrayData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Delegates and DataSources
        tableView.delegate = self
        tableView.dataSource = self
        
        // MARK: - Functions Called
        self.getData()
        self.updateUI()
    }
    
    
    // MARK: - Get Data Function
    
    private func getData() {
        
        arrayData = ["T","L","B","A","V","M","M","L","E"]
    }
    
    // MARK: - Update UI Function
    
    private func updateUI() {
        
        self.tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    // MARK: - Edit Button Action
    
    @IBAction func editTapped(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            self.tableView.isEditing = !self.tableView.isEditing
        }
    }
}



// MARK: - Table View Delegates


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    // MARK: - Cell Count
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return arrayData.count }
    
    
    
    // MARK: - Cell Items
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell {
            
            cell.textLabel?.text = arrayData[indexPath.row]
        
            return cell
        }
        return UITableViewCell()
    }
    
    
    // MARK: - Cell Selection
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Selected at ", indexPath.row)
    }
    
    
    // MARK: - Cell Deselection
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        print("Deselected at ", indexPath.row)
    }
}
