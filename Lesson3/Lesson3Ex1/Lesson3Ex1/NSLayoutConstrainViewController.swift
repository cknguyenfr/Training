//
//  NSLayoutConstrainViewController.swift
//  Lesson3Ex1
//
//  Created by Can Khac Nguyen on 7/11/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit
enum RelatedConstraint : String{
    case TT = "TopToTop"
    case TB = "TopToBottom"
    case LL = "LeftToLeft"
    case LR = "LeftToRight"
    case RR = "RightToRight"
}
class NSLayoutConstrainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //red
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        addLayoutWithHalfByVertical(subView: redView, topViewRelated: view, leftViewRelated: view, rightViewRelated: view, heightViewRelated: view, arrayOrient: [.TT, .LL])
        //blue
        let blueView = UIView()
        blueView.backgroundColor = UIColor.cyan
        addLayoutWithHalfByHorizontal(subView: blueView, topViewRelated: redView, leftViewRelated: view, bottomViewRelated: view, widthViewRelated: view, arrayOrient: [.TB, .LL])
        //orange
        let orangeView = UIView()
        orangeView.backgroundColor = UIColor.orange
        addLayoutWithHalfByVertical(subView: orangeView, topViewRelated: redView, leftViewRelated: blueView, rightViewRelated: view, heightViewRelated: blueView,arrayOrient: [.TB, .LR])
        //green
        let greenView = UIView()
        greenView.backgroundColor = UIColor.green
        addLayoutWithHalfByHorizontal(subView: greenView, topViewRelated: orangeView, leftViewRelated: blueView, bottomViewRelated: view, widthViewRelated: orangeView, arrayOrient: [.TB, .LR])
        //button change view
        let button = UIButton()
        button.setTitle(">> NSLayoutAnchor", for: .normal)
        button.addTarget(self, action: #selector(buttonChangeToAnchorCliked), for: .touchUpInside)
        addButton(button: button, superView: redView)
    }
    
    @objc func buttonChangeToAnchorCliked(){
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NSLayoutAnchorViewController") as! NSLayoutAnchorViewController
        self.present(vc, animated: true, completion: nil)
    }

    func addLayoutWithHalfByVertical(subView: UIView, topViewRelated: UIView, leftViewRelated: UIView, rightViewRelated: UIView, heightViewRelated: UIView, arrayOrient: [RelatedConstraint]){
        self.view.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        if arrayOrient[0] == .TT{
            let _ = NSLayoutConstraint.init(item: subView, attribute: .top, relatedBy: .equal, toItem: topViewRelated, attribute: .top, multiplier: 1, constant: 0).isActive = true
        }else{
            let _ = NSLayoutConstraint.init(item: subView, attribute: .top, relatedBy: .equal, toItem: topViewRelated, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        }
        if arrayOrient[1] == .LL{
            let _ = NSLayoutConstraint.init(item: subView, attribute: .leading, relatedBy: .equal, toItem: leftViewRelated, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        }else{
            let _ = NSLayoutConstraint.init(item: subView, attribute: .leading, relatedBy: .equal, toItem: leftViewRelated, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        }
        let _ = NSLayoutConstraint.init(item: subView, attribute: .trailing, relatedBy: .equal, toItem: rightViewRelated, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        let _ = NSLayoutConstraint.init(item: subView, attribute: .height, relatedBy: .equal, toItem: heightViewRelated, attribute: .height, multiplier: 1/2, constant: 0).isActive = true
    }
    
    func addLayoutWithHalfByHorizontal(subView: UIView, topViewRelated: UIView, leftViewRelated: UIView, bottomViewRelated: UIView, widthViewRelated: UIView, arrayOrient: [RelatedConstraint]){
        self.view.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        if arrayOrient[0] == .TT{
            let _ = NSLayoutConstraint.init(item: subView, attribute: .top, relatedBy: .equal, toItem: topViewRelated, attribute: .top, multiplier: 1, constant: 0).isActive = true
        }else{
            let _ = NSLayoutConstraint.init(item: subView, attribute: .top, relatedBy: .equal, toItem: topViewRelated, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        }
        if arrayOrient[1] == .LL{
            let _ = NSLayoutConstraint.init(item: subView, attribute: .leading, relatedBy: .equal, toItem: leftViewRelated, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        }else{
            let _ = NSLayoutConstraint.init(item: subView, attribute: .leading, relatedBy: .equal, toItem: leftViewRelated, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        }
        let _ = NSLayoutConstraint.init(item: subView, attribute: .bottom, relatedBy: .equal, toItem: bottomViewRelated, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        let _ = NSLayoutConstraint.init(item: subView, attribute: .width, relatedBy: .equal, toItem: widthViewRelated, attribute: .width, multiplier: 1/2, constant: 0).isActive = true
    }
    
    func addButton(button: UIButton, superView: UIView){
        superView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        let _ = NSLayoutConstraint.init(item: button, attribute: .centerX, relatedBy: .equal, toItem: superView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        let _ = NSLayoutConstraint.init(item: button, attribute: .centerY, relatedBy: .equal, toItem: superView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        let _ = NSLayoutConstraint.init(item: button, attribute: .height, relatedBy: .equal, toItem: superView, attribute: .height, multiplier: 1/5, constant: 0).isActive = true
        let _ = NSLayoutConstraint.init(item: button, attribute: .width, relatedBy: .equal, toItem: superView, attribute: .width, multiplier: 1/2, constant: 0).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
