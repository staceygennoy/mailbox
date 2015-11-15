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
    
    @IBOutlet weak var deleteViewIcon: UIImageView!
    
    var messageOriginalCenter: CGPoint!
    var messageOffset: CGFloat!
    var messageRight: CGPoint!
    var messageLeft: CGPoint!
    var archiveOriginalCenter: CGPoint!
    var deleteOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.contentSize = imageView.image!.size
        
    }

  
    @IBAction func didPanMessageView(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
       // let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            messageOriginalCenter = messageView.center
            archiveOriginalCenter = archiveViewIcon.center
            deleteOriginalCenter = deleteViewIcon.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            // Moving the message view along with user's panning
            messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            archiveViewIcon.center = CGPoint(x: archiveOriginalCenter.x + translation.x, y: archiveOriginalCenter.y)
            deleteViewIcon.center = CGPoint(x: deleteOriginalCenter.x + translation.x, y: deleteOriginalCenter.y)

            
            // detect where the message is, in order to set the background color
            let messageLeft = messageView.center.x - 160
            if (messageLeft >= -50 && messageLeft <= 50) {
                messageWrapperView.backgroundColor = UIColor.grayColor()
                archiveViewIcon.alpha = 0
                deleteViewIcon.alpha = 0
            }
            if (messageLeft < -50) {
                messageWrapperView.backgroundColor = UIColor.yellowColor()
            }
            if (messageLeft > 50 && messageLeft <= 220) {
                messageWrapperView.backgroundColor = UIColor.init(colorLiteralRed: 127/255, green: 228/255, blue: 134/255, alpha: 1)
                archiveViewIcon.alpha = 1
                deleteViewIcon.alpha = 0
            }
            if messageLeft > 220 {
                messageWrapperView.backgroundColor = UIColor.redColor()
                archiveViewIcon.alpha = 0
                deleteViewIcon.alpha = 1
            }

            
        } else if sender.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                self.messageView.center = self.messageOriginalCenter
                self.archiveViewIcon.center = self.archiveOriginalCenter
                self.deleteViewIcon.center = self.deleteOriginalCenter
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

