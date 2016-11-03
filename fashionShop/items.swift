//
//  items.swift
//  fashionShop
//
//  Created by techmaster on 11/3/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class items: NSObject {
    var name: String?
    var content: String?
    var nameImages: [String] = []
    var price: String?
    init(name: String, content: String, nameImages: [String], price: String)
    {
        self.name = name
        self.content = content
        self.nameImages = nameImages
        self.price = price
    }
}
