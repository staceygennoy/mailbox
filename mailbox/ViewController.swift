//
//  ViewController.swift
//  mailbox
//
//  Created by Stacey Gennoy on 11/10/15.
//  Copyright © 2015 Stacey Gennoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var messageView: UIImageView!
    
    @IBOutlet weak var messageWrapperView: UIView!
    
    @IBOutlet weak var archiveViewIcon: UIImageView!
    
    var messageOriginalCenter: CGPoint!
    var messageOffset: CGFloat!
    var messageRight: CGPoint!
    var messageLeft: CGPoint!
    var archiveOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.contentSize = imageView.image!.size
        
    }

  
    @IBAction func didPanMessageView(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            messageOriginalCenter = messageView.center
            archiveOriginalCenter = archiveViewIcon.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            // Moving the message view along with user's panning
            messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            archiveViewIcon.center = CGPoint(x: archiveOriginalCenter.x + translation.x, y: archiveOriginalCenter.y)

            // detect when message has moved all the way to either left or right
            let messageLeft = messageView.center.x - 160
            if messageLeft < -280 {
             //   print("user swiped all the way to the left")
            }
            if messageLeft > 280 {
             //   print("user swiped all the way to the right")
            }
            
            // change the color based on which direction
            if velocity.x > 0 {
                messageWrapperView.backgroundColor = UIColor.redColor()
            }
            else if velocity.x < 0 {
                messageWrapperView.backgroundColor = UIColor.init(colorLiteralRed: 127/255, green: 228/255, blue: 134/255, alpha: 1)
            }
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                self.messageView.center = self.messageOriginalCenter
                self.archiveViewIcon.center = self.archiveOriginalCenter
            }, completion: {
                (Bool) -> Void in
            })
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

