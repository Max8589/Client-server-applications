//
//  LoginViewController.swift
//  VKApp
//
//  Created by admin on 10/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class Session {
    static let instance = Session()
    private init(){}
    var token = ""
    var userId = 0
}

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView?
    
    @IBOutlet private weak var titleLabel: UILabel?
    
    @IBOutlet private weak var loginHintLabel: UILabel?
    @IBOutlet private weak var loginTextField: UITextField?
    
    @IBOutlet private weak var passHintLabel: UILabel?
    @IBOutlet private weak var passTextField: UITextField?
    
    @IBOutlet private weak var loginButton: UIButton?
    
    @IBOutlet weak var loader: LoaderUIView?
    
    private let demoLogin = "123"
    private let demoPass = "456"
    
    // MARK: - init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.addNotifications()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addNotifications()
    }
    
    deinit {
        self.removeNotifications()
    }
    
    
    
    // MARK: - Notifications
    
    private func addNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHidde(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWasShown(notification: Notification) {
        guard let userInfo = notification.userInfo as NSDictionary? else {
            return
        }
        
        guard let keyBoardFrame = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {
            return
        }
        
        let keyboardHeight = keyBoardFrame.cgRectValue.size.height
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        self.scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillHidde(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView?.contentInset = contentInsets
        self.scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = Session.instance
        session.token = "token"
        session.userId = 1111
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loader?.start()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            self.loader?.stop()
        })
    }
    
    // MARK: - Actions
    
    
    @IBAction func loginButtonAction() {
        
        guard let loginText = self.loginTextField?.text else {
            print("Empty loginText")
            return
        }
        
        guard let passText = self.passTextField?.text else {
            print("Empty passText")
            return
        }
        
        if self.demoLogin == loginText && self.demoPass == passText {
            print("Success")
            self.performSegue(withIdentifier: "openApp", sender: nil)
        } else {
            print("loginText or passText are invalid")
            self.showErrorAlert()        }
    }
 
      // MARK: - Alert
    func showErrorAlert() {
        let alertController = UIAlertController(title: "Error", message: "Wrong login or pass", preferredStyle: .alert)
        
        let alertCancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) in
            print("alertCancelAction")
        }
        alertController.addAction(alertCancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func closeKeyboardAction() {
        print("closeKeyboardAction")
        self.view.endEditing(true)
    }
    
   // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepeare \(String(describing: segue.identifier))")
        
        if let identifier = segue.identifier, identifier == "openApp" {
            if let destinationVC = segue.destination  as? UITabBarController {
                destinationVC.selectedIndex = 0
            }
        }
        
    }
    
    
    
}
