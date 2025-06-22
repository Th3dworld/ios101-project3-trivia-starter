//
//  RestartViewController.swift
//  Trivia
//
//  Created by Matanda  Phiri  on 6/21/25.
//

import UIKit

class RestartViewController: UIViewController {
    
    @IBOutlet weak var RestartPromptView: UIView!
    
    @IBOutlet weak var FinalScoreLabel: UILabel!
    
    @IBAction func DidTapRestartButton(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RestartPromptView.layer.cornerRadius = 10
    }
    

}
