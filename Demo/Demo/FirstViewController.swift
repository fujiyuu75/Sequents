//
//  FirstViewController.swift
//  Demo
//
//  Created by 藤川 裕一 on 2017/06/03.
//  Copyright © 2017 藤川 裕一. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var sts: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.view.backgroundColor = .red
        
        print("FirstViewController")

//        if views.count != 0 {
//            for (index, view) in views.enumerated() {
//                view.alpha = 0
//                UIView.animate(withDuration: 1, delay: Double(index * 1), animations: {
//                    view.alpha = 1
////                    // アフィンをつくって組み合わせる
////                    let affine1 = CGAffineTransform(scaleX: 2.0, y: 2.0)
////                    let affine2 = CGAffineTransform(rotationAngle: 45.0)
//////                    affine1.concatenating(affine2)
////                    view.transform = affine1.concatenating(affine2)
//                })
//            }
//        }

        Sequents.origin(self.view).delay(0.5).duration(2.5).flow(Direction.backward).start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

