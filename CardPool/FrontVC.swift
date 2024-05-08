//
//  FrontVC.swift
//  CardPool
//
//  Created by Rashdan Natiq on 2024-01-10.
//

import UIKit

class FrontVC: UIViewController {

    @IBOutlet weak var cardimage: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    var timer: Timer!
    var cards:[UIImage] = card.allcardimages
    

    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in buttons{
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showrandomimages), userInfo: nil, repeats: true)
    }
    
        
    @objc func showrandomimages(){
        cardimage.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    
    @IBAction func stopbutton(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartbutton(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }

}
