//
//  TSRoute.swift
//  BiliBili_sts
//
//  Created by sts on 2017/6/1.
//  Copyright © 2017年 sts. All rights reserved.
//

import Foundation
import UIKit



extension TSRecommendVC{
    
    private static var homeVCtransitioningDelegateAssociationKey:UInt8 = 0
    var homeVCtransitioningDelegate:UIViewControllerTransitioningDelegate?{
        get{
            return  objc_getAssociatedObject(self, &TSRecommendVC.homeVCtransitioningDelegateAssociationKey) as? UIViewControllerTransitioningDelegate
        }
        set(newValue){
            objc_setAssociatedObject(self, &TSRecommendVC.homeVCtransitioningDelegateAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// 跳转到网页展示
    ///
    /// - Parameter url: <#url description#>
    func presentWebVC(url:String) {
        
        let homeVc:TSHomeVC? = self.parent?.view.superview?.next as? TSHomeVC
        if homeVc == nil {
            TSLog(message: "homeVc is nil  ")
            return
        }
        
        let webvc = TSWebVC()
        webvc.webUrlStr = url
        let nav = UINavigationController.init(rootViewController: webvc)
        let delegate = TSSwipeTransitionDelegate()
        self.homeVCtransitioningDelegate = delegate
        nav.transitioningDelegate = delegate
        
        homeVc!.present(nav, animated: true, completion: nil)
    }
    
    func presentPlayVC(){
        let homeVc:TSHomeVC? = self.parent?.view.superview?.next as? TSHomeVC
        if homeVc == nil {
            TSLog(message: "homeVc is nil  ")
            return
        }
        
        let playvc = TSPlayVC()
        let nav = UINavigationController.init(rootViewController: playvc)
        let delegate = TSSwipeTransitionDelegate()
        self.homeVCtransitioningDelegate = delegate
        nav.transitioningDelegate = delegate
        homeVc!.present(nav, animated: true, completion: nil)

    }
}




