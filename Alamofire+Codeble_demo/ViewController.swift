//
//  ViewController.swift
//  Alamofire+Codeble_demo
//
//  Created by takuyaOhmuro on 2018/08/30.
//  Copyright © 2018年 takuyaOhmuro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var arrContacts = [Contact]()
    @IBOutlet weak var txtContacts: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AFWrapper.requestGETURL("https://api.androidhive.info/contacts/", sucess: { (responseobject) in
            print(responseobject)
            for aContact in responseobject["contacts"] as! [Any] {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: aContact, options: .prettyPrinted)
                    let reqJSONStr = String(data:jsonData,encoding:.utf8)
                    let data = reqJSONStr?.data(using:.utf8)
                    let jsonDecoder = JSONDecoder()
                    let aContact = try jsonDecoder.decode(Contact.self, from: data!)
                    self.arrContacts.append(aContact)
                    self.txtContacts.text = self.txtContacts.text + aContact.name + " " + aContact.phone.mobile + "\n"
                    print(self.arrContacts)
                }
                catch {
                    
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

