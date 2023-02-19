//
//  ViewController.swift
//  navigation
//
//  Created by 안주환 on 2023/02/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var navToSecondVCBtn: UIButton!
    @IBOutlet var navToDetailVCBtn: UIButton!
    
    var stepNumber: Int = 1 {
        didSet {
            self.title = "스탭넘버: \(stepNumber)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navToSecondVCBtn.addTarget(self, action: #selector(navToSecondVC), for: .touchUpInside)
        navToDetailVCBtn.addTarget(self, action: #selector(navToDetailVC), for: .touchUpInside)
    }

    @objc fileprivate func navToDetailVC(_ sender: UIButton) {
        self.performSegue(withIdentifier: "navToDetailVC", sender: self)
        print(#fileID, #function, #line, "- detail")
    }
    
    @objc fileprivate func navToSecondVC(_ sender: UIButton) {
        self.performSegue(withIdentifier: "navToSecondVC", sender: self)
        print(#fileID, #function, #line, "- second")
    }
    
    @IBAction func onPushBtnClicked(_ sender: UIButton) {
        
        // storyboard
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        viewController.stepNumber = stepNumber + 1
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

