//
//  CommentsViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 01/10/21.
//

import Foundation
import UIKit

class CommentsViewController: UIViewController {
    
    @IBOutlet var commentsView: UIView!
    @IBOutlet var commentsTableView: UITableView!
    @IBOutlet var textFieldView: UIView!
    @IBOutlet var commentTextField: UITextField!
    @IBOutlet var sendOutlet: UIButton!
    
    // @IBOutlet var bottomConstraint: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // Disappear tab bar
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func Properties() {
        
        commentsView.layer.cornerRadius = 36
        
        // commentsView.layer.masksToBounds = false
        // commentsView.layer.shadowRadius = 20
        // commentsView.layer.shadowOpacity = 1
        // commentsView.layer.shadowColor = UIColor.gray.cgColor
        // commentsView.layer.shadowOffset = CGSize(width: 0, height: 10)
        
        commentsTableView.backgroundColor = UIColor.white
        commentsTableView.estimatedRowHeight = 80
        commentsTableView.rowHeight = UITableView.automaticDimension
        
        textFieldView.layer.cornerRadius = 36
        
        commentTextField.setCommentsTextFieldUnderLine()
        
    }
    
    func handleTextField() {
        
        commentTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange() {
        
        if let commentText = commentTextField.text, !commentText.isEmpty {
            sendOutlet.setTitleColor(UIColor.systemBlue, for: .normal)
            sendOutlet.isEnabled = true
            return
        }
        
        sendOutlet.setTitleColor(UIColor.lightGray, for: .normal)
        sendOutlet.isEnabled = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let childView = UIHostingController(rootView: CommentsView())
        addChild(childView)
        theContainer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        childView.view.frame = theContainer.bounds
        theContainer.addSubview(childView.view)
        */
        
        Properties()
        hideKeyboardWhenTappedAround()
        empty()
        handleTextField()
        
        // Keyboard Show
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // Keyboard Hide
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    // Keyboard Show
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    // Keyboard Hide
    @objc func keyboardWillHide(notification: NSNotification) {
        
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
        
    }
    
    // empty and disable after a comment is posted
    func empty() {
        
        self.commentTextField.text = ""
        self.sendOutlet.isEnabled = false
        self.sendOutlet.setTitleColor(UIColor.lightGray, for: .normal)
        
    }
    
}

extension CommentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
        cell.backgroundColor = UIColor.white
        return cell
    }
    
}   // #138
