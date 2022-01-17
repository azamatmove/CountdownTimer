//
//  ViewController.swift
//  CountdownTimer
//
//  Created by Azamat Sarinzhiev on 17/1/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var time = 30
    
    var timer = Timer()
    
    private lazy var timerLabel: UILabel = {
        let view = UILabel()
        view.text = "Timer by Azamat"
        view.font = .systemFont(ofSize: 21, weight: .bold)
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    private lazy var countdownLabel: UILabel = {
        let view = UILabel()
        view.text = "\(time)"
        view.font = .systemFont(ofSize: 80, weight: .bold)
        view.textAlignment = .center
        view.backgroundColor = .green
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var timerButton: UIButton = {
        let view = UIButton()
        view.setTitle("Start", for: .normal)
        view.layer.cornerRadius = 10
        view.backgroundColor = .black
        view.addTarget(nil, action: #selector(timerStarted), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSubview()
    }
    
    private func setupSubview() {
        
        view.addSubview(timerLabel)
        timerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(view.frame.height / -5)
        }
        
        view.addSubview(countdownLabel)
        countdownLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        
        view.addSubview(timerButton)
        timerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(view.frame.height / 3)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
    }
    @objc func timerStart() {
        time -= 1
        
        if time == 0{
            timer.invalidate()
        }
        
        countdownLabel.text = "\(time)"
        
        countdownLabel.backgroundColor = UIColor(red: Double.random(in: 0...200.0 / 255.0), green: Double.random(in: 0...200.0 / 255.0), blue: Double.random(in: 0...200.0 / 255.0), alpha: 1)
        countdownLabel.textColor = UIColor(red: Double.random(in: 0...200.0 / 255.0), green: Double.random(in: 0...200.0 / 255.0), blue: Double.random(in: 0...200.0 / 255.0), alpha: 1)
        }
        
        @objc func timerStarted(){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerStart), userInfo: nil, repeats: true)
        }
    }


