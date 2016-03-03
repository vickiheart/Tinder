//
//  CardsViewController.swift
//  Tinder
//
//  Created by Vicki Tan on 3/2/16.
//  Copyright © 2016 Vicki Tan. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var ryanImageView: UIImageView!
    var cardInitialCenter: CGPoint!
    var cardLeftPadding = CGFloat(10)
    
    var imageTransition: ImageTransition!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageTransition = ImageTransition()
        imageTransition.duration = 2

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController as! ProfileViewController
        
        destinationViewController.image = self.ryanImageView.image
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        imageTransition.duration = 2
        destinationViewController.transitioningDelegate = imageTransition
        
        var identifier = segue.identifier
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        
        
    }
    
        
    @IBAction func bottomDidPan(sender: UIPanGestureRecognizer) {
        var translation = sender.translationInView(view)
        
        ryanImageView.center.x = translation.x + 160
        
        if sender.state == UIGestureRecognizerState.Began {
        } else if sender.state == UIGestureRecognizerState.Changed {
            self.ryanImageView.transform = CGAffineTransformMakeRotation(CGFloat(translation.x * 15 / 160 * CGFloat(M_PI) / -180))
        } else if sender.state == UIGestureRecognizerState.Ended {
            if translation.x > -40 && translation.x < 50 {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.ryanImageView.center.x = 160
                    self.ryanImageView.transform = CGAffineTransformIdentity
                })
            } else if translation.x > 51 {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.ryanImageView.center.x = 1000
                })
            } else {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.ryanImageView.center.x = -1000
                })
            }
        }
    }

    @IBAction func imageDidPan(sender: UIPanGestureRecognizer) {
        var translation = sender.translationInView(view)

        ryanImageView.center.x = translation.x + 160
        
        if sender.state == UIGestureRecognizerState.Began {
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            self.ryanImageView.transform = CGAffineTransformMakeRotation(CGFloat(translation.x * 15 / 160 * CGFloat(M_PI) / 180))
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
                if translation.x > -40 && translation.x < 50 {
                    UIView.animateWithDuration(0.4, animations: { () -> Void in
                        self.ryanImageView.center.x = 160
                        self.ryanImageView.transform = CGAffineTransformIdentity
                    })
                } else if translation.x > 51 {
                    UIView.animateWithDuration(0.4, animations: { () -> Void in
                        self.ryanImageView.center.x = 1000
                    })
                } else {
                    UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.ryanImageView.center.x = -1000
                    })
                }
            }
    }
    
    
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("ProfileSegue", sender: self)
        
    }
    

    
}
