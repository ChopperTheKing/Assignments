//
//  ViewController.swift
//  August24b
//
//  Created by Ronnie Kissos on 8/24/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputBox: UITextView!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBAction func submitButton(_ sender: Any) {
        
    }
    @IBAction func zeroButton(_ sender: Any) {
        outputBox.text = "0"
    }
    @IBAction func oneButton(_ sender: Any) {
        outputBox.text = "1"
    }
    @IBAction func twoButton(_ sender: Any) {
        outputBox.text = "2"
    }
    @IBAction func threeButton(_ sender: Any) {
        outputBox.text = "3"
    }
    @IBAction func fourButton(_ sender: Any) {
        outputBox.text = "4"
    }
    @IBAction func fiveButton(_ sender: Any) {
        outputBox.text = "5"
    }
    @IBAction func sixButton(_ sender: Any) {
        outputBox.text = "6"
    }
    @IBAction func sevenButton(_ sender: Any) {
        outputBox.text = "7"
    }
    @IBAction func eightButton(_ sender: Any) {
        outputBox.text = "8"
    }
    @IBAction func nineButton(_ sender: Any) {
        outputBox.text = "9"
    }
    @IBAction func plusButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

