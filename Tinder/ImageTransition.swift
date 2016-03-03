//
//  ImageTransition.swift
//  Tinder
//
//  Created by Vicki Tan on 3/2/16.
//  Copyright © 2016 Vicki Tan. All rights reserved.
//

import UIKit


class ImageTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 1
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
}

