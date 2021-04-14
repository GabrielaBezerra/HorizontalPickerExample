//
//  ViewController.swift
//  HorizontalPickerExample
//
//  Created by Gabriela Bezerra on 14/04/21.
//

import UIKit

class ViewController: UIViewController {

    var horizontalTextPickerOptions: [String] = [
        "Apple",
        "Sith",
        "Borg",
        "Predator",
        "Alien",
        "Godzilla",
        "King Kong"
    ]

    lazy var horizontalPicker = HorizontalTextPickerView()

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        horizontalPicker.horizontalDataSource = self

        setupLayout()
    }

    func setupLayout() {
        self.view.addSubview(horizontalPicker)
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        NSLayoutConstraint.activate([
            horizontalPicker.widthAnchor.constraint(
                equalToConstant: 60
            ),
            horizontalPicker.heightAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.width
            ),
            horizontalPicker.centerYAnchor.constraint(
                equalTo: self.view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            horizontalPicker.centerXAnchor.constraint(
                equalTo: self.view.centerXAnchor
            )
        ])
    }

}

extension ViewController: HorizontalTextPickerViewDataSource {
    func didSelect(column: Int) {
        print(horizontalTextPickerOptions[column])
    }
}
