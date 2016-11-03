    //
//  imagesList.swift
//  fashionShop
//
//  Created by techmaster on 11/3/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class imagesList: UIViewController {
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopDescription: UITextView!
    
    var item: items!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shopName.text = item.name
        shopDescription.text = item.content
        imgProfile.image = UIImage(named: item.nameImages[0]+".jpg")
        imgProfile.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapImg))
        imgProfile.addGestureRecognizer(tap)
    }
    
    func tapImg() {
        pushView(0)
    }
    
    func collectionView(_ view: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        let cell = view.dequeueReusableCell(withReuseIdentifier: "ACell", for: indexPath) as! cell
        cell.cellWidth = 60
        cell.priceHeight = 0
        cell.nameHeight = 0
        cell.addSubview()
        cell.imageView.contentMode = .scaleAspectFit
        cell.imageView.image = UIImage(named: item.nameImages[(indexPath as NSIndexPath).item]+".jpg")
        return cell
    }
    
    func collectionView(_ view: UICollectionView, numberOfItemsInSection section: section ) -> Int {
        return item.nameImages.count
    }
    
    func collectionView(_ view: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        pushView((indexPath as NSIndexPath).item)
    }
    
    func pushView(_ index: Int) {
        let listView = self.storyboard?.instantiateViewController(withIdentifier: "imgscroll") as? imageScroll
        listView?.imgArr = item.nameImages
        listView?.curID = index
        self.navigationController?.pushViewController(listView!, animated: true)
    }
}
