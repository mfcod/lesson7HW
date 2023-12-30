//
//  ViewController.swift
//  lesson7HW
//
//  Created by Maxim Fedoseenko on 28.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewUp = UILabel()
    private let viewRight = UILabel()
    private let viewDown = UILabel()
    private let viewLeft =  UILabel()
    
    private let viewCircle = UIView()
    private let step: CGFloat = 70
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewCircleAction()
        
        viewUpAction()
        viewRightAction()
        viewDownAction()
        viewLeftAction()
        
    }
    
    private func viewCircleAction() {
        viewCircle.frame = CGRect(x: 175, y: 400, width: 50, height: 50)
        viewCircle.backgroundColor = .blue
        viewCircle.layer.cornerRadius = 25
        view.addSubview(viewCircle)
    }
    
    
    //MARK: UP
    private func viewUpAction() {
        viewUp.frame = CGRect(x: 170, y: 600, width: 70, height: 40)
        viewUp.layer.cornerRadius = 10
        viewUp.clipsToBounds = true
        viewUp.text = "Up"
        viewUp.backgroundColor = .blue
        viewUp.textColor = .white
        viewUp.font = UIFont.systemFont(ofSize: 20)
        viewUp.font = UIFont.boldSystemFont(ofSize: 22)
        viewUp.textAlignment = .center
        viewUp.isUserInteractionEnabled = true  // Включаем взаимодействие с пользователем
        view.addSubview(viewUp)
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapUp))
        viewUp.addGestureRecognizer(gesture)
    }
    
    @objc private func tapUp() {
        //Получаем значение верхней границы безопасной области viewUp
        let minY = self.viewUp.safeAreaInsets.top
        let stepY = self.viewCircle.frame.origin.y - self.step
        
        if stepY > minY {
            //Это часто используется, чтобы убедиться, что значение не уходит за пределы определенного диапазона. В вашем случае, limitedY гарантирует, что вертикальная позиция viewCircle не будет ниже значения minY.
            let limitedY = max(stepY, minY)
            print("лимит \(limitedY)")
            //Устанавливаем новое значение limitedY в origin.y для viewCircle,
            //что обновляет положение viewCircle
            self.viewCircle.frame.origin.y = limitedY
        } else {
            showAlert(withTitle: "Ошибка", message: "Дальше нельзя")
        }
    }
    
    
    
    //MARK: RIGHT
    private func viewRightAction() {
        viewRight.frame = CGRect(x: 260, y: 670, width: 70, height: 40)
        viewRight.layer.cornerRadius = 10
        viewRight.clipsToBounds = true
        viewRight.text = "Right"
        viewRight.backgroundColor = .blue
        viewRight.textColor = .white
        viewRight.font = UIFont.systemFont(ofSize: 20)
        viewRight.font = UIFont.boldSystemFont(ofSize: 22)
        viewRight.textAlignment = .center
        viewRight.isUserInteractionEnabled = true
        view.addSubview(viewRight)
       
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapRight))
        viewRight.addGestureRecognizer(gesture)
        
        
    }
    
    @objc private func tapRight() {
        // это строка гарантирует, что viewCircle не выходит за правую границу viewRight.
        let minX = self.viewRight.frame.origin.x + self.viewRight.frame.size.width //size.width это ширина viewRight.
        let stepX = self.viewCircle.frame.origin.x + self.step
        
        if stepX < minX { //мы проверяем, не выходит ли viewCircle за пределы правой границы.
            let limitedX = min(stepX, minX)
            print("лимит \(limitedX)")
            self.viewCircle.frame.origin.x = limitedX
        } else {
            showAlert(withTitle: "Ошибка", message: "Дальше нельзя")
        }
    }

    
    
    //MARK: DOWN
    private func viewDownAction() {
        viewDown.frame = CGRect(x: 170, y: 745, width: 70, height: 40)
        viewDown.layer.cornerRadius = 10
        viewDown.clipsToBounds = true
        viewDown.text = "Down"
        viewDown.backgroundColor = .blue
        viewDown.textColor = .white
        viewDown.font = UIFont.systemFont(ofSize: 20)
        viewDown.font = UIFont.boldSystemFont(ofSize: 22)
        viewDown.textAlignment = .center
        viewDown.isUserInteractionEnabled = true
        view.addSubview(viewDown)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapDown))
        viewDown.addGestureRecognizer(gesture)
    }
    
    @objc private func tapDown() {
        viewCircle.frame.origin.y += 70
    }
    
    
    //MARK: LEFT
    private func viewLeftAction() {
        viewLeft.frame = CGRect(x: 80, y: 670, width: 70, height: 40)
        viewLeft.layer.cornerRadius = 10
        viewLeft.clipsToBounds = true
        viewLeft.text = "Left"
        viewLeft.backgroundColor = .blue
        viewLeft.textColor = .white
        viewLeft.font = UIFont.systemFont(ofSize: 20)
        viewLeft.font = UIFont.boldSystemFont(ofSize: 22)
        viewLeft.textAlignment = .center
        viewLeft.isUserInteractionEnabled = true
        view.addSubview(viewLeft)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapLeft))
        viewLeft.addGestureRecognizer(gesture)
    }
    
    @objc private func tapLeft() {
        viewCircle.frame.origin.x -= 70
    }
     
    
   private func showAlert(withTitle title: String, message: String) {
       let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
       
       let action = UIAlertAction(title: "Ok", style: .default)
       alert.addAction(action)
       present(alert, animated: true)
    }
    
    
    
}

#Preview {
    ViewController()
}

