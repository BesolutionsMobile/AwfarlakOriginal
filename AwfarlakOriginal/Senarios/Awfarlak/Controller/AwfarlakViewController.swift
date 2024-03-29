//
//  ViewController.swift
//  AwfarlakOriginal
//
//  Created by mac on 1/27/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit

class AwfarlakViewController: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet var bigView: UIView!
    @IBOutlet weak var awfarlakBgImage: UIImageView!
    
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDesign()
    }
    
    //MARK: - Func to  Update Design
    
    func updateDesign()  {
        awfarlakBgImage.layer.cornerRadius = self.bigView.bounds.height * 0.3
        awfarlakBgImage.layer.masksToBounds = true
        awfarlakBgImage.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner  ]
        
    }
    
    
    
    //MARK: - IBAction
    
    @IBAction func logInBtnPressed(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    
    
    
    @IBAction func createAccountBtnPressed(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
}



   //MARK: - Extension


  //MARK:-UITextFieldDelegate

extension UIViewController: UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


 //MARK:- NSAttributedString

extension NSAttributedString {
    static func withDualText(text1: String ,ofSizeText1: CGFloat ,text2: String ,ofSizeText2: CGFloat ) -> NSMutableAttributedString{
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: text1, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: ofSizeText1)]))
        text.append(NSAttributedString(string: text2, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black , NSAttributedString.Key.font: UIFont.systemFont(ofSize: ofSizeText2)]))
        return text
    }
    
    static func withDualText2(text1: String ,ofSizeText1: CGFloat ,text2: String ,ofSizeText2: CGFloat ) -> NSMutableAttributedString{
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: text1, attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(named: "BtnColor") ?? "", NSAttributedString.Key.font: UIFont.systemFont(ofSize: ofSizeText1)]))
        text.append(NSAttributedString(string: text2, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black , NSAttributedString.Key.font: UIFont.systemFont(ofSize: ofSizeText2)]))
        return text
    }
}


  //MARK:- String

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughColor ,value:  UIColor.init(named: "BtnColor") ?? "", range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}




