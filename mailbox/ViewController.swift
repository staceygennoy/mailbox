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
    
    var messageOriginalCenter: CGPoint!
    var messageOffset: CGFloat!
    var messageRight: CGPoint!
    var messageLeft: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.contentSize = imageView.image!.size
        
        messageOffset = 160
        messageRight = CGPoint(x: messageView.center.x - messageOffset, y: messageView.center.y)
        messageLeft = CGPoint(x: messageView.center.x + messageOffset, y: messageView.center.y)

    }

  
    @IBAction func didPanMessageView(sender: UIPanGestureRecognizer) {
        let velocity = sender.velocityInView(view)
        let translation = sender.translationInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            messageOriginalCenter = messageView.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            // only move the message if the new center is greater than or equal to 464
            //if (messageOriginalCenter.y + translation.y >= 464) {
                messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            //}
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                self.messageView.center = self.messageOriginalCenter
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

