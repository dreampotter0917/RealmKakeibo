//
//  ShoppingItemViewController.swift
//  RealmKakeibo
//
//  Created by あらいゆめ on 2023/02/11.
//

import UIKit
import RealmSwift

class shoppingitem: Object{
    
    @Persisted var title : String = ""
    @Persisted var price : Int = 0
    @Persisted var isMarked: Bool = false
    @Persisted var category: Category?
}

class ShoppingItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
