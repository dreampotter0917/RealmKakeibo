//
//  ViewController.swift
//  RealmKakeibo
//
//  Created by あらいゆめ on 2023/02/11.
//

import UIKit
import RealmSwift

class ItemViewController: UIViewController , UITableViewDataSource {
    
    @IBOutlet var tableView:UITableView!
    
    let realm = try! Realm()
    var items: [shoppingitem] = []
    var selectCategory: Category!
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        items = readItems()
        navigationItem.title = selectCategory.title
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = readItems()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item: shoppingitem = items[indexPath.row]
        cell.setCell(title:item.title , price:item.price ,isMarked:item.isMarked )
        
        return cell
        
    }

    func readItems() -> [shoppingitem]{
        return Array(realm.objects(shoppingitem.self).filter("category == %@" , selectCategory))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewItemView"{
            let newItemViewController = segue.destination as! NewItemViewController
            newItemViewController.category = self.selectCategory
        }
            
    }

}

