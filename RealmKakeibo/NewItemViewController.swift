//
//  NewItemViewController.swift
//  RealmKakeibo
//
//  Created by あらいゆめ on 2023/02/11.
//

import UIKit
import RealmSwift

class NewItemViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var markSwitch: UISwitch!
    
    let realm = try! Realm()
    var category: Category!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(){
        let item = shoppingitem()
        item.title = titleTextField.text ?? ""
        item.price = Int(priceTextField.text ?? "") ?? 0
        item.isMarked = markSwitch.isOn
        item.category = category
        createItem(item: item)
        
        
        //let previousNC = self.presentedViewController as! UINavigationController
        //let previousVC = previousNC.viewControllers[previousNC.viewControllers.count - 1] as! ItemViewController
        //previousVC.reloadTableView()
        
        self.dismiss(animated: true)
        
    }
    
    func createItem(item: shoppingitem){
        try! realm.write {
            realm.add(item)
        }
    }

}
