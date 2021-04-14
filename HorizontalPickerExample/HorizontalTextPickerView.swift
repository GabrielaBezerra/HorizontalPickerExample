//
//  HorizontalTextPickerView.swift
//  HorizontalPickerExample
//
//  Created by Gabriela Bezerra on 14/04/21.
//

import Foundation
import UIKit

class HorizontalTextPickerView: UIPickerView {

    var horizontalDataSource: HorizontalTextPickerViewDataSource!

    init() {
        super.init(frame: .zero)

        self.delegate = self
        self.dataSource = self

        self.backgroundColor = .white
        self.transform = CGAffineTransform(rotationAngle: -90 * (.pi/180))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HorizontalTextPickerView: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        horizontalDataSource.numberOfComponents(in: pickerView)
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        horizontalDataSource.pickerView(pickerView, numberOfRowsInComponent: component)
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        horizontalDataSource.pickerView(pickerView, viewForRow: row, forComponent: component, reusing: view)
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        horizontalDataSource.pickerView(pickerView, rowHeightForComponent: component)
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        horizontalDataSource.pickerView(pickerView, didSelectRow: row, inComponent: component)
    }
}
