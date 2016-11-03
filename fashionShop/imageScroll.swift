//
//  imageScroll.swift
//  fashionShop
//
//  Created by techmaster on 11/3/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class imageScroll: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    
    var imgScrollView: [UIScrollView] = []
    var imgArr: [String] = []
    var pageView: [UIImageView?] = []
    var curID = 0
//    var first = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageController.numberOfPages = imgArr.count
        pageController.currentPage = curID
    }
    
    override func viewDidLayoutSubviews() {
        let imgScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSize(width: imgScrollViewSize.width * CGFloat(imgArr.count) , height: 0)
        for i in 0..<imgArr.count {
            let imageView = UIImageView(image: UIImage(named: imgArr[i]+".jpg"))
            imageView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            imageView.isMultipleTouchEnabled = true
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapImg(_:)))
            tap.numberOfTapsRequired = 1
            imageView.addGestureRecognizer(tap)
            
            let doubleTap = UITapGestureRecognizer(target: self, action: #selector(dblTapImg(_:)))
            doubleTap.numberOfTapsRequired = 2
            imageView.addGestureRecognizer(doubleTap)
            // tap.require(toFail: doubleTap)
            pageView.append(imageView)
            
            let pageView1 = UIScrollView(frame: CGRect( x: CGFloat(i) * scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            pageView1.minimumZoomScale = 1
            pageView1.maximumZoomScale = 2
            pageView1.delegate = self
            pageView1.contentSize = imageView.bounds.size
            pageView1.addSubview(imageView)
            imgScrollView.append(pageView1)
            self.scrollView.addSubview(pageView1)
        }
    }
    
    func tapImg(_ gesture: UITapGestureRecognizer) {
        let position = gesture.location(in: pageView[pageController.currentPage])
        imgScale(scrollView.zoomScale * 2, position)
    }
    
    func dblTapImg(_ gesture: UITapGestureRecognizer) {
        let position = gesture.location(in: pageView[pageController.currentPage])
        imgScale(scrollView.zoomScale * 0.5, position)
    }
    
    func imgScale(_ scale: CGFloat,_ center: CGPoint) {
        var zoomRect = CGRect()
        let scrollViewSize = scrollView.bounds.size
        
        zoomRect.size.height = scrollViewSize.height / scale
        zoomRect.size.width = scrollViewSize.width / scale
        
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0)
        
        imgScrollView[pageController.currentPage].zoom(to: zoomRect, animated: true)
    }
}

extension imageScroll: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return pageView[pageController.currentPage]
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((self.scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        if (pageController.currentPage != page) {
            imgScrollView[pageController.currentPage].zoomScale = 1
            pageController.currentPage = page
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    }
}
