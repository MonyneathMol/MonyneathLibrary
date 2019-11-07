//
//  NumberTextFeildRestriction.swift
//
//  Created by Monyneath Mol on 10/18/19.
//

import UIKit

open class NumberTextFeildRestriction :NSObject , UITextFieldDelegate {
    var maxLength = 30
    var minLength = 0
    
    public var textFeildErrorCallback : ((UITextField,String)->())?
    public var textFeildDihdkldBeginEditingCallback : ((UITextField,String)->())?
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
     
        let aSet = CharacterSet(charactersIn:"1234567890").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let  curString = compSepByCharInSet.joined(separator: "")
//        var digit = maxLength
        if(newString.length > maxLength)
        {
            print("error over max")
            textFeildErrorCallback?(textField,"Over max length")
        }
//        digit = maxLength
        return newString.length <= maxLength && string == curString
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textFeildDidBeginEditingCallback?(textField,"did beginEditing")
    }

}
