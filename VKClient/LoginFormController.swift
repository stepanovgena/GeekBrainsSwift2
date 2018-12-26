//
//  LoginFormController.swift
//  VKClient
//
//  Created by Gennady Stepanov on 15/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import UIKit

final class LoginFormController: UIViewController {

  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var loginTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
 
  private let hardcodedLogin = ""
  private let hardcodedPassword = ""
  private let userId = "user001"
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    scrollView?.addGestureRecognizer(hideKeyboardGesture)
    
    StorageEmulator.setUserId(userId: userId)

    }
  @objc func keyboardWasShown(notification: Notification) {
    guard
      let info = notification.userInfo as NSDictionary?,
      let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
      else {
        return
    }
    let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
    scrollView?.contentInset = insets
    scrollView?.scrollIndicatorInsets = insets
  }
  
  @objc func keyboardWillBeHidden(notification: Notification) {
    let contentInsets = UIEdgeInsets.zero
    scrollView?.contentInset = contentInsets
    scrollView?.scrollIndicatorInsets = contentInsets
  }
  
  @objc func hideKeyboard() {
    self.scrollView?.endEditing(true)
  }
  
  @IBAction func loginButtonPressed(_ sender: CornerRadiusButton) {
    //segue created in storyboard
  }
  
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    let checkResult = checkUserData()
    if !checkResult {
      showLoginError()
    }
    return checkResult
  }
  
  func checkUserData() -> Bool {
    let userInputLogin = loginTextField.text
    let userInputPassword = passwordTextField.text
    if (userInputLogin == hardcodedLogin && userInputPassword == hardcodedPassword) {
      print("Auth OK")
      return true
    } else {
      print("Wrong credentials")
      return false
    }
  }
  
  func showLoginError() {
    let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
}
