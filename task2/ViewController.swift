//
//  ViewController.swift
//  task2
//
//  Created by Gleb Tregubov on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        var cfg = UIButton.Configuration.filled()
        cfg.cornerStyle = .large
        cfg.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        cfg.imagePadding = 8
        cfg.imagePlacement = .trailing
        cfg.image = UIImage(systemName: "arrow.right.circle.fill")
        
        let buttons = [
            UIButton(configuration: cfg),
            UIButton(configuration: cfg),
            UIButton(configuration: cfg)
        ]
        
        buttons.forEach {
            $0.addTarget(self, action: #selector(touchDown(sender:)), for: .touchDown)
            $0.addTarget(self, action: #selector(touchUp(sender:)), for: .touchUpInside)
            $0.addTarget(self, action: #selector(touchUp(sender:)), for: .touchUpOutside)
        }
        
        buttons.last?.addTarget(self, action: #selector(handler), for: .touchUpInside)
        
        let titles = ["First Button", "Second Medium Button", "Third"]
        var topPadding: CGFloat = 75
        buttons.enumerated().forEach {
            $1.setTitle(titles[$0], for: .normal)
            $1.sizeToFit()
            $1.center = CGPoint(x: view.bounds.midX, y: topPadding)
            topPadding += 50
            view.addSubview($1)
        }

    }
    @objc func touchDown(sender: UIControl) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }

    }
    
    @objc func touchUp(sender: UIControl) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform.identity
        }
    }
    
    @objc func handler() {
        let modal = UIViewController()
        modal.view.backgroundColor = .systemGray3
        present(modal, animated: true)
    }

}
