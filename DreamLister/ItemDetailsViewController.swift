//
//  ItemDetailsViewController.swift
//  DreamLister
//
//  Created by Son Ho on 5/25/18.
//  Copyright © 2018 Son Ho. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleTextField: CustomTextField!
    @IBOutlet weak var priceTextField: CustomTextField!
    @IBOutlet weak var detailsTextField: CustomTextField!
    
    var item: Item!
    var stores = [Store]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        storePicker.dataSource = self
        storePicker.delegate = self
        
        //initStoreData()
        getStores()
        bindData()
    }
    
    func bindData() {
        guard
        let item = item,
        let store = item.toStore else {
            return
        }
        titleTextField.text = item.title
        if item.price == 0.0 {
            priceTextField.text = ""
        } else {
            priceTextField.text = "\(item.price)"
        }
        detailsTextField.text = item.details
        var index = 0
        repeat {
            let s = stores[index]
            if s.name == store.name {
                storePicker.selectRow(index, inComponent: 0, animated: false)
            }
            index+=1
        } while (index < stores.count)
    
    }
    
    func initStoreData() {
        let store = Store(context: context)
        store.name = "Best Buy"
        let store1 = Store(context: context)
        store1.name = "Tesla Dealership"
        let store2 = Store(context: context)
        store2.name = "Frys Electronics"
        let store3 = Store(context: context)
        store3.name = "Target"
        let store4 = Store(context: context)
        store4.name = "Amazon"
        let store5 = Store(context: context)
        store5.name = "K Mart"
        
        ad.saveContext()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        do {
            stores = try context.fetch(fetchRequest)
            storePicker.reloadAllComponents()
        } catch {
            
        }
    }

    @IBAction func saveItemPressed(_ sender: UIButton) {
        var item: Item!
        if self.item == nil {
            item = Item(context: context)
        } else {
            item = self.item
        }
        guard
            let title = titleTextField.text,
            let price = priceTextField.text,
            let details = detailsTextField.text else {
            return
        }
        item.title = title
        item.price = (price as NSString).doubleValue
        item.details = details
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
}
