//
//  TabViewController.swift
//  TurkishNewsApp
//
//

import UIKit
import SwipeableTabBarController

class TabViewController: SwipeableTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeAnimatedTransitioning?.animationType = SwipeAnimationType.sideBySide
        isCyclingEnabled = true
    }

}
