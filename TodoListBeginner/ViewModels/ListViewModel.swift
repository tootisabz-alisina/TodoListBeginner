//
//  ListViewModel.swift
//  TodoListBeginner
//
//  Created by TOTI SABZ on 1/20/25.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
            
            print("Item added and saved to database")
        }
    }
    
    init() {
        getItems()
    }
    
    let itemKey: String = "item_list"
    
    func getItems() {
       
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        items = savedItems
        
    }
    
    
    func delete(indesSet: IndexSet){
        items.remove(atOffsets: indesSet)
    }
    
    
    func moveItem(from source: IndexSet, to destination: Int){
        items.move(fromOffsets: source, toOffset: destination)
    }
    
    func addItem(title: String){
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func toggleItem(item: ItemModel){
       if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.toggleIsComplete()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }

}
