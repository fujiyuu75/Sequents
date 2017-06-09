//
//  IndexPageViewController.swift
//  Demo
//
//  Created by 藤川 裕一 on 2017/06/09.
//  Copyright © 2017 藤川 裕一. All rights reserved.
//

import UIKit

class IndexPageViewController: UIPageViewController {

    let idList = ["first", "second", "third"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getFirst() -> FirstViewController {
        return storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as!FirstViewController
    }
    func getSecond() -> SecondViewController {
        return storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    }
    func getThird() -> ThirdViewController {
        return storyboard!.instantiateViewController(withIdentifier: "ThirdViewController") as!ThirdViewController
    }
}

extension IndexPageViewController : UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: ThirdViewController.self) {
            // 3 -> 2
            return getSecond()
        } else if viewController.isKind(of: SecondViewController.self) {
            // 2 -> 1
            return getFirst()
        } else {
            // 1 -> end of the road
            return nil
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: FirstViewController.self) {
            // 1 -> 2
            return getSecond()
        } else if viewController.isKind(of: SecondViewController.self) {
            // 2 -> 3
            return getThird()
        } else {
            // 3 -> end of the road
            return nil
        }
    }
}
