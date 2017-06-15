//
//  AnimationViewController.swift
//  Demo
//
//  Created by 藤川 裕一 on 2017/06/15.
//  Copyright © 2017 藤川 裕一. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var stacks: UIStackView!
    @IBOutlet weak var picker: UIPickerView!

    var list = [["bounceIn", "fadeIn", "fadeInDown", "fadeInUp", "fadeInLeft", "fadeInRight", "rotateIn"]]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return list.count
    }

    func pickerView(_ namePickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list[component].count
    }

    //表示する文字列を指定する
    //PickerViewに表示する配列の要素数を設定する
    func pickerView(_ namePickerview: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[component][row]
    }

    //ラベル表示
    func pickerView(_ namePickerview: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        // 選ばれた項目
        let item = list[component][row]

        print(item + "が選ばれた。")
        print(row)

        switch row {
        case 0:
            Sequents.origin(self.stacks).anim(Animation.bounceIn).start()
        case 1:
            Sequents.origin(self.stacks).anim(Animation.fadeIn).start()
        case 2:
            Sequents.origin(self.stacks).anim(Animation.fadeInDown).start()
        case 3:
            Sequents.origin(self.stacks).anim(Animation.fadeInUp).start()
        case 4:
            Sequents.origin(self.stacks).anim(Animation.fadeInLeft).start()
        case 5:
            Sequents.origin(self.stacks).anim(Animation.fadeInRight).start()
        case 6:
            Sequents.origin(self.stacks).anim(Animation.rotateIn).start()
        default: break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        picker.dataSource = self
        picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
