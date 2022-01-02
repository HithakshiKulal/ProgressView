//
//  SleepViewController.swift
//  Sleep
//
//  Created by Hithakshi on 01/01/22.
//

import UIKit

class SleepViewController: UIViewController {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var circleProgressView: CircleProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }
    
}

// MARK: Helper methods
extension SleepViewController {
    private func setupUI() {
        setupBackground()
        dayLabel.font = .systemFont(ofSize: 24, weight: .bold)
        dayLabel.textColor = .title
        dateLabel.font = .systemFont(ofSize: 16, weight: .regular)
        dateLabel.textColor = .subtitle
    }
    
    private func updateUI() {
        dayLabel.text = Date.dayOfWeek
        dateLabel.text = Date.dateString
    }
    
    private func setupBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = UIColor.primaryGradientColors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.locations = [0, 0.7, 1]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIColor {
    static let primaryGradientColors = [#colorLiteral(red: 0.1666029096, green: 0.07129707187, blue: 0.2856631875, alpha: 1), #colorLiteral(red: 0.3254980743, green: 0.09725961834, blue: 0.4683650732, alpha: 1), #colorLiteral(red: 0.4608908892, green: 0.1421281993, blue: 0.6139921546, alpha: 1)]
    static let title = UIColor.white
    static let subtitle = UIColor.lightGray
}

extension Date {
    
    static var dayOfWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: Date())
    }
    
    static var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM DD, YYYY"
        return dateFormatter.string(from: Date())
    }
}
