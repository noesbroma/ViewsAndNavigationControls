//
//  PageViewController.swift
//  ViewsAndNavigationControls
//
//  Created by Judith Leon on 8/4/24.
//

import UIKit

class PageViewController: UIPageViewController {

    private var myControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myGreenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vcGreen")
        let myPinkVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vcPink")
        
        myControllers.append(myGreenVC)
        myControllers.append(myPinkVC)
        
        setViewControllers([myGreenVC], direction: .forward, animated: true, completion: nil)
        
        dataSource = self
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = myControllers.firstIndex(of: viewController)
        
        if index == 0 {
            return myControllers.last
        }
        
        return myControllers.first
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = myControllers.firstIndex(of: viewController)
        
        if index == 0 {
            return myControllers.last
        }
        
        return myControllers.first
    }
    
    
    
}
