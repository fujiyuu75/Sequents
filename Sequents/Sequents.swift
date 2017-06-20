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
    private var startOffset: Double
    private var duration: Double
    private var delay: Double
    var direction: Direction
    var animation: Animation

    open class Builder {
        fileprivate var offset = 0.2
        fileprivate var duration = 0.5
        fileprivate var delay = 0.0
        fileprivate var direction = Direction.forward
        fileprivate var origin: UIView
        fileprivate var animation = Animation.fadeIn

        init(_ origin: UIView) {
            self.origin = origin
        }

        open func offset(_ offset: Double) -> Builder {
            self.offset = offset
            return self
        }

        open func duration(_ duration: Double) -> Builder {
            self.duration = duration
            return self
        }

        open func delay(_ delay: Double) -> Builder {
            self.delay = delay
            return self
        }

        open func flow(_ flow: Direction) -> Builder {
            self.direction = flow
            return self
        }

        open func anim(_ anim: Animation) -> Builder {
            self.animation = anim
            return self
        }

        open func start() -> Sequents {
            return Sequents(self)
        }
    }

    open static func origin(_ origin: UIView) -> Builder {
        return Builder(origin)
    }

    init(_ builder: Builder) {
        self.startOffset = builder.offset
        self.duration = builder.duration
        self.delay = builder.delay
        self.direction = builder.direction
        self.animation = builder.animation

        let origin: UIView = builder.origin
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
        for item in 0..<count {
            let view: UIView = viewList[item]
            let delay = (Double(item) * startOffset) + self.delay

            switch animation {
            case .fadeIn:
                view.alpha = 0
                UIView.animate(withDuration: duration, delay: delay, animations: {
                    view.alpha = 1
                })
            case .fadeInDown:
                view.alpha = 0
                view.center.y += 50.0
                UIView.animate(withDuration: duration, delay: delay, animations: {
                    view.alpha = 1
                    view.center.y -= 50.0
                })
            case .fadeInUp:
                view.alpha = 0
                view.center.y -= 50.0
                UIView.animate(withDuration: duration, delay: delay, animations: {
                    view.alpha = 1
                    view.center.y += 50.0
                })
            case .fadeInLeft:
                view.alpha = 0
                view.center.x -= 50.0
                UIView.animate(withDuration: duration, delay: delay, animations: {
                    view.alpha = 1
                    view.center.x += 50.0
                })
            case .fadeInRight:
                view.alpha = 0
                view.center.x += 50.0
                UIView.animate(withDuration: duration, delay: delay, animations: {
                    view.alpha = 1
                    view.center.x -= 50.0
                })
            }
        }
    }
}
