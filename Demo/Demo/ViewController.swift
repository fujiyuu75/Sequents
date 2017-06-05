//
//  ViewController.swift
//  Demo
//
//  Created by 藤川 裕一 on 2017/06/03.
//  Copyright © 2017 藤川 裕一. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var texts: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let views = texts.subviews
        print(views.count)
        if views.count != 0 {
            for view in views {
                print(view.subviews.count)
            }
        }

        Sequents.origin(origin: texts).start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

