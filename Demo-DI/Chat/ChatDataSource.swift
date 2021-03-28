//
//  ChatDataSource.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 3/28/21.
//

import UIKit

class ChatDataSource: NSObject, UITableViewDataSource {
    
    var dataProvider: ChatDataProvidable
    private let cellConstructor: ChatCellConstructor = ChatCellConstructor()
    
    init(dataProvider: ChatDataProvidable) {
        self.dataProvider = dataProvider
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataProvider.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellConstructor.getCell(by: dataProvider.getMessage(by: indexPath))
    }
}
