//
//  item.swift
//  Karle
//
//  Created by Utkarsh on 15/01/19.
//  Copyright © 2019 Utkarsh. All rights reserved.
//

import Foundation


class Item {
    
    var title: String = ""
    var done: Bool = false
    
    
    init(title: String = "", done: Bool = false) {
        self.title = title
        self.done = done
    }
}
