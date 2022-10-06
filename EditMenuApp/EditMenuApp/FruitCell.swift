//
//  FruitCell.swift
//  MenuItemApp
//
//  Created by Minnit on 2022/10/05.
//

import UIKit

class FruitCell: UITableViewCell {
    
    // MARK: Property
    static let identifier = "FruitCell"

    // MARK: Override Function
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLongGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLongGesture()
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        // 지정된 Action을 활성화 / 비활성화 하게 만들기
        return action == #selector(cut(_:)) || action == #selector(copy(_:))
    }

    override var canBecomeFirstResponder: Bool {
        // becomeFirstResponder를 활성화 시키기
        return true
    }

    // MARK: Edit Menu Action Function
    private func setupLongGesture() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(recognizer:)))
        addGestureRecognizer(longPressGesture)
    }
    
    @objc private func handleLongPressGesture(recognizer: UIGestureRecognizer) {
        guard recognizer.state == .began,
              let recognizerView = recognizer.view,
              let recognizerSuperview = recognizerView.superview else { return }
        
        self.becomeFirstResponder()
        // 현재 누른 cell을 first responder로 만들어주기 위함
        
        let menuController = UIMenuController.shared
        menuController.arrowDirection = .default // 화살표 방향 default 값이 .default
        menuController.showMenu(from: recognizerSuperview, rect: recognizerView.frame) // edit menu를 보여 줄 영역 잡기
        NotificationCenter.default.addObserver(self, selector: #selector(willHideEditMenu), name: UIMenuController.willHideMenuNotification, object: nil)
        // Edit Menu 팝업이 닫힐 때를 알기 위해 observer를 생성
        backgroundColor = UIColor(red: 17/255, green: 144/255, blue: 255/255, alpha: 0.12)
    }
    
    @objc private func willHideEditMenu() {
        // Edit Menu 팝업이 닫힐 때
        backgroundColor = .clear
        NotificationCenter.default.removeObserver(self, name: UIMenuController.willHideMenuNotification, object: nil)
    }
}
