//
//  ViewController.swift
//  fashionShop
//
//  Created by techmaster on 11/3/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var item_: [items] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "items", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        for dic in (myDict!.allValues as? [[String: Any]])!
        {
            self.item_.append(items(name: dic["name"] as! String, content: dic["content"] as! String, nameImages: dic["images"] as! NSArray as! [String], price: dic["price"] as! String))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item_.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ACell", for: indexPath) as! cell
        cell.addSubview()
        cell.imageView.contentMode = .scaleAspectFit
        cell.imageView.image = UIImage(named: item_[(indexPath as NSIndexPath).item].nameImages[0]+".jpg")
        cell.name.text = item_[(indexPath as NSIndexPath).item].name
        cell.price.text = item_[(indexPath as NSIndexPath).item].price
        return cell
    }
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let listView = self.storyboard?.instantiateViewController(withIdentifier: "ViewDetailShop") as? imagesList
        listView?.item = item_[(indexPath as NSIndexPath).item]
        self.navigationController?.pushViewController(listView!, animated: true)
        
    }
}

