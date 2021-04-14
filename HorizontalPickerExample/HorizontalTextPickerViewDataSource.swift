//
//  HorizontalTextPickerViewDataSource.swift
//  HorizontalPickerExample
//
//  Created by Gabriela Bezerra on 14/04/21.
//

import Foundation
import UIKit

protocol HorizontalTextPickerViewDataSource {
    var horizontalTextPickerOptions: [String] { get set }
    func didSelect(column: Int)

    func numberOfComponents(in pickerView: UIPickerView) -> Int
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
}

extension HorizontalTextPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return horizontalTextPickerOptions.count
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let modeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        modeLabel.textColor = .systemBlue
        modeLabel.font = UIFont.systemFont(ofSize: 32)
        modeLabel.text = horizontalTextPickerOptions[row]
        modeLabel.textAlignment = .center

        let modeView = UIView()
        modeView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        modeView.addSubview(modeLabel)
        modeView.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))

        return modeView
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return UIScreen.main.bounds.width/2.5
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        didSelect(column: row)
    }
}
