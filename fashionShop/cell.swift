//
//  cell.swift
//  fashionShop
//
//  Created by techmaster on 11/3/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class cell: UICollectionViewCell {
    var imageView: UIImageView!
    var name: UILabel!
    var price: UILabel!
    var priceHeight: CGFloat = 30
    var cellWidth: CGFloat = 100
    var nameHeight: CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: cellWidth, height: cellWidth + nameHeight)
    }
    
    func addSubview() {
        if (imageView == nil) {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cellWidth, height: cellWidth))
            imageView.layer.borderColor = tintColor.cgColor
            imageView.contentMode = .scaleAspectFit
            contentView.addSubview(imageView)
        }
        
        if (name == nil) {
            name = UILabel(frame: CGRect(x: 0, y: cellWidth, width: cellWidth, height: nameHeight))
            name.textAlignment = .center
            name.textColor = UIColor.black
            name.highlightedTextColor = tintColor
            name.font = UIFont.systemFont(ofSize: 11)
            name.numberOfLines = 2
            contentView.addSubview(name)
        }
        if (price == nil) {
            price = UILabel(frame: CGRect(x: 0, y: cellWidth + nameHeight, width: cellWidth, height: priceHeight))
            price.textAlignment = .center
            price.textColor = UIColor.brown
            price.font = UIFont.boldSystemFont(ofSize: 13)
            contentView.addSubview(price)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.layer.borderWidth = isSelected ? 5 : 0
        }
    }
}
