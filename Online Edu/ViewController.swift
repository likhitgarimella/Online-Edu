//
//  ViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 19/08/21.
//

import UIKit
import paper_onboarding

class ViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {
    
    @IBOutlet weak var onboardingView: OnboardingView!
    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBOutlet var one: UIView!
    @IBOutlet var two: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingView.dataSource = self
        onboardingView.delegate = self
        
    }
    
    func onboardingItemsCount() -> Int {
        return 2
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        
        let informationImageOne = UIImage(named: "onboardOne")
        let informationImageTwo = UIImage(named: "onboardTwo")
        let backgroundColor = UIColor.white
        let titleColor = UIColor.black
        let descriptionColor = UIColor.darkGray
        
        let titleFont = UIFont(name: "Poppins-Regular", size: 18)!
        let descriptionFont = UIFont(name: "Roboto-Regular", size: 16)!
        
        return [OnboardingItemInfo(informationImage: informationImageOne!, title: "Quick update", description: "Stay informed with the fastest and most effective way, wherever you are", pageIcon: UIImage(named: "white")!, color: backgroundColor, titleColor: titleColor, descriptionColor: descriptionColor, titleFont: titleFont, descriptionFont: descriptionFont),
        
                OnboardingItemInfo(informationImage: informationImageTwo!, title: "Notify quickly", description: "Receive notices about new courses and quick feedback", pageIcon: UIImage(named: "white")!, color: backgroundColor, titleColor: titleColor, descriptionColor: descriptionColor, titleFont: titleFont, descriptionFont: descriptionFont)][index]
        
    }
    
    ///
    func alreadyShown() -> Bool {
        return UserDefaults.standard.bool(forKey: "already_shown_onboarding")
    }
    
    ///
    private func markAsSeen() {
        UserDefaults.standard.set(true, forKey: "already_shown_onboarding")
    }
    
    @IBAction func gotStarted(_ sender: Any) {
        markAsSeen()
        dismiss(animated: true)
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        
        if index == 0 {
            one.backgroundColor = UIColor(red: 15/255, green: 60/255, blue: 122/255, alpha: 1.0)
            two.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
        }
        
        if index == 1 {
            two.backgroundColor = UIColor(red: 15/255, green: 60/255, blue: 122/255, alpha: 1.0)
            one.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
        }
        
        if index == 0 {
            if self.getStartedButton.alpha == 1 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.getStartedButton.alpha = 0
                })
            }
        }
        
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        
        if index == 1 {
            UIView.animate(withDuration: 0.2, animations: {
                self.getStartedButton.alpha = 1
            })
        }
        
    }
    
}   // #100
