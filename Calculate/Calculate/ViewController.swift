//
//  ViewController.swift
//  Calculate
//
//  Created by mun on 11/14/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let stackView = UIStackView()
    let buttons = [UIButton(), UIButton(), UIButton(), UIButton()]
    let buttonDatas = ["7", "8", "9", "+"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureLayout()
    }
    
    // UI 설정
    private func configureUI() {
        view.backgroundColor = .black
        configureLabel()
        configureStackView()
        
        [label, stackView].forEach{
            view.addSubview($0)
        }
    }
    
    // label 스타일 설정
    private func configureLabel() {
        label.text = "12345"
        label.textColor = .white
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
    }
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        configureButton()
    }
    
    private func configureButton() {
        for i in buttons.indices {
            buttons[i].setTitle(buttonDatas[i], for: .normal)
            buttons[i].titleLabel?.font = .boldSystemFont(ofSize: 30)
            buttons[i].backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            stackView.addArrangedSubview(buttons[i])
        }
    }
    
    // 레이아웃 설정
    private func configureLayout() {
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(200)
            $0.height.equalTo(100)
        }
        
        stackView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.top.equalTo(label.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        for button in buttons {
            button.snp.makeConstraints {
                $0.height.width.equalTo(80)
            }
        }
        
    }
}

#Preview("ViewController") {
    ViewController()
}
