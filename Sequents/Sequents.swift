//
//  Sequents.swift
//  Sequents
//
//  Created by 藤川 裕一 on 2017/05/30.
//
//

import Foundation
import UIKit

open class Sequents {
    private var viewList = [UIView]()
    private var startOffset: Int
    private var duration: Int
    private var delay: Int
    var direction: Direction
//    private var animId: Int

    open class Builder {
        fileprivate var offset = 100
        fileprivate var duration = 500
        fileprivate var delay = 0
        fileprivate var direction = Direction.forward
        fileprivate var origin: UIView

        init(origin: UIView) {
            self.origin = origin
        }

        open func offset(offset: Int) -> Builder {
            self.offset = offset
            return self
        }

        open func duration(duration: Int) -> Builder {
            self.duration = duration
            return self
        }

        open func delay(delay: Int) -> Builder {
            self.delay = delay
            return self
        }

        open func flow(flow: Direction) -> Builder {
            self.direction = flow
            return self
        }

        open func start() -> Sequents {
            return Sequents(builder: self)
        }
    }

    open static func origin(origin: UIView) -> Builder {
        return Builder(origin: origin)
    }

    init(builder: Builder) {
        self.startOffset = builder.offset
        self.duration = builder.duration
        self.delay = builder.delay
        self.direction = builder.direction
//        self.animId = builder.animId

        let origin: UIView = builder.origin
        print("origin is ")
        print(origin)
        fetchChildLayouts(views: origin)

        self.viewList = arrangeLayouts(viewList: viewList)

        setAnimation()
    }

    private func fetchChildLayouts(views: UIView) {
        guard views.subviews.count != 0 else {
            return
        }

        for view in views.subviews where view.subviews.count != 0 {

        }

        for view in views.subviews {
            if view.subviews.count != 0 {
                fetchChildLayouts(views: view)
            } else if !view.isHidden {
                // TODO: いったんviewを非表示にさせる。
                viewList.append(view)
            }
        }
    }

    private func arrangeLayouts(viewList: [UIView]) -> [UIView] {
        switch direction {
            case Direction.backward:
                return viewList.reversed()
            default: break
        }
        return viewList
    }

    private func setAnimation() {
        let count = viewList.count
        for item in 0 ..< count {
            let view: UIView = viewList[item]
            let offset = item * startOffset

            // TODO: アニメーションの初期化。

        }
    }
}
