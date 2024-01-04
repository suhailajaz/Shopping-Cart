//
//  ViewController.swift
//  Project6.5-Milestone4-6
//
//  Created by suhail on 13/07/23.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingItems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "MY SHOPPING CART"
        tableView.register(ShoppingCell.nib, forCellReuseIdentifier: ShoppingCell.identifier)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addShoppingItem))
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareItemList))
        navigationItem.rightBarButtonItems = [shareButton,addButton]
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Clear List", image: nil, target: self, action: #selector(clearList))
        
        let defaults = UserDefaults.standard
        shoppingItems = defaults.object(forKey: "shoppingItems") as? [String] ?? [String]()
                                          
        
    }
    @objc func addShoppingItem(){
        let ac = UIAlertController(title: "Enter an item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self,weak ac] _ in
            guard let answer = ac?.textFields?[0].text else {return}
        self?.submit(answer)
        }
        ac.addAction(submitAction)
        present(ac,animated: true)
        
        
    }
    @objc func clearList(){
        shoppingItems.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    @objc func shareItemList(){
        let list = shoppingItems.joined(separator: "\n")
         let vc = UIActivityViewController(activityItems: [list], applicationActivities: [])
         vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
         present(vc,animated: true)
     
        }
                                                          
    func submit(_ answer: String){
        if !answer.isEmpty{
            shoppingItems.insert(answer, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            save()
        }
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingCell.identifier, for: indexPath) as! ShoppingCell
        cell.lblCurrentItem.text = shoppingItems[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func save(){
        let defaults = UserDefaults.standard
        defaults.set(shoppingItems,forKey: "shoppingItems")
    }
}

