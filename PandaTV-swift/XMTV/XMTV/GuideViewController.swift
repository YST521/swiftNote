//
//  GuideViewController.swift
//  GuideViewExample
//
//  Created by ChuGuimin on 16/1/20.
//  Copyright © 2016年 cgm. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {
    
   

    
    var pageControl: UIPageControl!
    var startButton: UIButton!
    
  
    
    fileprivate var scrollView: UIScrollView!
    
    fileprivate let numOfPages = 3

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        let frame = self.view.bounds
        
        scrollView = UIScrollView(frame: frame)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        scrollView.contentOffset = CGPoint.zero
        // 将 scrollView 的 contentSize 设为屏幕宽度的3倍(根据实际情况改变)
        scrollView.contentSize = CGSize(width: frame.size.width * CGFloat(numOfPages), height: frame.size.height)
        
        scrollView.delegate = self
        
        for index  in 0..<numOfPages {
            let imageView = UIImageView(image: UIImage(named: "GuideImage\(index + 1)"))
            imageView.frame = CGRect(x: frame.size.width * CGFloat(index), y: 0, width: frame.size.width, height: frame.size.height)
            scrollView.addSubview(imageView)
        }
        
        self.view.insertSubview(scrollView, at: 0)
        
//        http://www.hangge.com/blog/cache/detail_604.html
        pageControl = UIPageControl.init()
        pageControl.frame = CGRect(x:0 ,y:650,width:414,height:40)
        pageControl.backgroundColor = UIColor.clear
        pageControl.tintColor = UIColor.red
        pageControl.numberOfPages = numOfPages
        self.view.addSubview(pageControl)
        
        
        startButton = UIButton.init()
        startButton.frame = CGRect(x:414*2 ,y:self.view.frame.size.height-150,width:414,height:40)
        startButton.backgroundColor = UIColor.red
        startButton.setTitle("Main", for: .normal)
        scrollView.addSubview(startButton);
        
        
        
        // 给开始按钮设置圆角
        startButton.layer.cornerRadius = 15.0
        // 隐藏开始按钮
//       startButton.alpha = 0.0
        
        startButton.addTarget(self, action: #selector(self.loginBtn), for:  .touchUpInside)
    }
    
    // 隐藏状态栏
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    
    func loginBtn(){
    
        // 进入主控制器
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        appDelegate.window = UIWindow.init()
        let tabBarController = TabBarController()
        appDelegate.window?.rootViewController = tabBarController
        appDelegate.window?.makeKeyAndVisible()
    
    }
}



// MARK: - UIScrollViewDelegate
extension GuideViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        // 随着滑动改变pageControl的状态
        pageControl.currentPage = Int(offset.x / view.bounds.width)
        
        // 因为currentPage是从0开始，所以numOfPages减1
       
        
        if pageControl.currentPage == numOfPages - 1 {
            UIView.animate(withDuration: 0.5, animations: {
                self.startButton.alpha = 1.0
            }) 
        } else {
            UIView.animate(withDuration: 0.2, animations: {
//                self.startButton.alpha = 0.0
                  self.startButton.alpha = 1.0
            })
        }
    }
}
