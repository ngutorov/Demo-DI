//
//  ChatCellConstructor.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 4/1/21.
//

import UIKit.UITableViewCell

class ChatCellConstructor {
    
    func getCell(by model: Message) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.textAlignment = .right
        cell.textLabel?.text = model.text
        return cell
    }
}
