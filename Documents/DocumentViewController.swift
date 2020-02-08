//
//  DocumentViewController.swift
//  Documents
//
//  Created by Jasmine Tan on 2/1/20.
//  Copyright © 2020 Jasmine Tan. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {

    @IBOutlet weak var docTextField: UITextField!
    @IBOutlet weak var docTextView: UITextView!
    
    var document: Document?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let document = document {
                 docTextView.text = document.content ?? ""
                 docTextField.text = document.name
                 
                 title = document.name
             } else {
                 title = ""
             }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nameChanged(_ sender: Any) {
        title = docTextField.text

    }
    @IBAction func save(_ sender: Any) {
        guard let name = docTextField.text else {
                return
            }
            
           // Documents.save(name: name, content: docTextView.text)
            
            navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
