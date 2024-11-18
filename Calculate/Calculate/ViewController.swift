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
  var verticalStackView = UIStackView()
  let buttonDatas = [["7", "8", "9", "+"], ["4", "5", "6", "-"], ["1", "2", "3", "*"], ["AC", "0", "=", "/"]]

  override func viewDidLoad() {
    super.viewDidLoad()

    configureUI()
    configureLayout()
  }

  // UI 설정
  private func configureUI() {
    view.backgroundColor = .black

    [label, verticalStackView].forEach{
      view.addSubview($0)
    }

    configureLabel()
    configureVerticalStackView()
  }

  // label 스타일 설정
  private func configureLabel() {
    label.text = "12345"
    label.textColor = .white
    label.textAlignment = .right
    label.font = .boldSystemFont(ofSize: 60)
  }

  // VerticalStackView 스타일 설정
  private func configureVerticalStackView() {
    for i in 0..<4 {
      let view = makeHorizontalStackView(i)
      verticalStackView.addArrangedSubview(view)
    }

    verticalStackView.axis = .vertical
    verticalStackView.backgroundColor = .black
    verticalStackView.spacing = 10
    verticalStackView.distribution = .fillEqually
  }

  // horizontalStackView 생성
  private func makeHorizontalStackView(_ verIndex: Int) -> UIStackView {
    let stackview = UIStackView()

    stackview.axis = .horizontal
    stackview.backgroundColor = .black
    stackview.spacing = 10
    stackview.distribution = .fillEqually

    for i in 0..<4 {
      stackview.addArrangedSubview(makeButton(verIndex: verIndex, horIndex: i))
    }

    stackview.snp.makeConstraints() {
      $0.width.equalTo(350)
    }

    return stackview
  }

  // 버튼 생성
  private func makeButton(verIndex: Int, horIndex: Int) -> UIButton {
    let keypad = UIButton()
    let title = buttonDatas[verIndex][horIndex]
    let color = Int(title) == nil ? .orange : UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)

    keypad.setTitle(title, for: .normal)
    keypad.titleLabel?.font = .boldSystemFont(ofSize: 30)
    keypad.backgroundColor = color
    keypad.layer.cornerRadius = 80 / 2

    keypad.snp.makeConstraints() {
      $0.width.height.equalTo(80)
    }

    return keypad
  }

  // 레이아웃 설정
  private func configureLayout() {
    label.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(30)
      $0.top.equalToSuperview().inset(200)
      $0.height.equalTo(100)
    }

    verticalStackView.snp.makeConstraints {
      $0.top.equalTo(label.snp.bottom).offset(60)
      $0.centerX.equalToSuperview()
    }
  }
}

#Preview("ViewController") {
  ViewController()
}

