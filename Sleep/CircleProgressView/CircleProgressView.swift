//
//  CircleProgressView.swift
//  Sleep
//
//  Created by Hithakshi on 01/01/22.
//

import UIKit

@IBDesignable
class CircleProgressView: UIView {
    
    // MARK: IBOutlets
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var outerCicleView: UIView!
    
    // MARK: Layers
    var outerCircleBaseShapeLayer = CAShapeLayer()
    var outerCircleProgressShapeLayer = CAShapeLayer()
    let innerCircleBaseShapeLayer = CAShapeLayer()
    let innerCircleProgressShapeLayer = CAShapeLayer()

    // MARK: Properties
    // For Outer Circle Base
    var outerCircleProgress: CGFloat = 0.4
    var outerCircleLineWidth: CGFloat = 35
    var outerCircleStrokeColor: UIColor = #colorLiteral(red: 0.2513276041, green: 0.1046987548, blue: 0.3992351294, alpha: 1)
    var outerCircleFillColor: UIColor = .clear
    var outerCircleRadius: CGFloat {
        let diameter = min(outerCicleView.frame.width, outerCicleView.frame.height) - 20
        return diameter / 2
    }
    // For Outer Circle Progress
    var outerCircleProgressLineWidth: CGFloat { outerCircleLineWidth }
    var outerCircleProgressStrokeColor: UIColor = #colorLiteral(red: 0.3662098944, green: 0.1756564975, blue: 0.7621685863, alpha: 1)
    var outerCircleProgressFillColor: UIColor = .clear

    var arcCenter: CGPoint {
        CGPoint(
            x: outerCicleView.frame.width / 2,
            y: outerCicleView.frame.height / 2
        )
    }
    var paddingBetweenCircles: CGFloat = 3
    // For Inner Circle Base
    var innerCircleProgress: CGFloat = 0.7
    var innerCircleLineWidth: CGFloat = 30
    var innerCircleStrokeColor: UIColor = #colorLiteral(red: 0.2932778597, green: 0.1647810042, blue: 0.4097187519, alpha: 1)
    var innerCircleFillColor: UIColor = .clear
    var innerCircleRadius: CGFloat {
        ((outerCircleRadius * 2) - outerCircleLineWidth * 2 - paddingBetweenCircles) / 2
    }
    // For Inner Circle Progress
    var innerCircleProgressLineWidth: CGFloat { innerCircleLineWidth }
    var innerCircleProgressStrokeColor: UIColor = #colorLiteral(red: 0.9724089503, green: 0.9516558051, blue: 0.9956521392, alpha: 1)
    var innerCircleProgressFillColor: UIColor = .clear
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override func draw(_ rect: CGRect) {
        setupOuterCircleView()
        setupInnerCircleInOuterCircleView()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("\(Self.self)", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
    }
    
}

// MARK: Outer Circle view
extension CircleProgressView {
    
    private func setupOuterCircleView() {
        let circlePath = UIBezierPath(
            arcCenter: arcCenter,
            radius: outerCircleRadius,
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true
        )
        outerCircleBaseShapeLayer.path = circlePath.cgPath
        outerCircleBaseShapeLayer.fillColor = outerCircleFillColor.cgColor
        outerCircleBaseShapeLayer.strokeColor = outerCircleStrokeColor.cgColor
        outerCircleBaseShapeLayer.lineWidth = outerCircleLineWidth
        outerCicleView.layer.addSublayer(outerCircleBaseShapeLayer)
        setupOuterCircleProgressView()
    }
    
    private func setupOuterCircleProgressView() {
        let startAngle = CGFloat(-Double.pi / 2)
        let endAngle = startAngle + (outerCircleProgress * Double.pi * 2)
        let circlePath = UIBezierPath(
            arcCenter: arcCenter,
            radius: outerCircleRadius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )
        outerCircleProgressShapeLayer.path = circlePath.cgPath
        outerCircleProgressShapeLayer.fillColor = outerCircleProgressFillColor.cgColor
        outerCircleProgressShapeLayer.strokeColor = outerCircleProgressStrokeColor.cgColor
        outerCircleProgressShapeLayer.lineCap = .round
        outerCircleProgressShapeLayer.lineWidth = outerCircleProgressLineWidth
        outerCicleView.layer.addSublayer(outerCircleProgressShapeLayer)
    }
}
    
extension CircleProgressView {
    
    private func setupInnerCircleInOuterCircleView() {
        let circlePath = UIBezierPath(
            arcCenter: arcCenter,
            radius: innerCircleRadius,
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true
        )
        innerCircleBaseShapeLayer.path = circlePath.cgPath
        innerCircleBaseShapeLayer.fillColor = innerCircleFillColor.cgColor
        innerCircleBaseShapeLayer.strokeColor = innerCircleStrokeColor.cgColor
        innerCircleBaseShapeLayer.lineWidth = innerCircleLineWidth
        outerCicleView.layer.addSublayer(innerCircleBaseShapeLayer)
        setupInnerCircleProgressView()
    }
    
    private func setupInnerCircleProgressView() {
        let startAngle = CGFloat(-Double.pi / 2)
        let endAngle = startAngle + (innerCircleProgress * Double.pi * 2)
        let circlePath = UIBezierPath(
            arcCenter: arcCenter,
            radius: innerCircleRadius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )
        innerCircleProgressShapeLayer.path = circlePath.cgPath
        innerCircleProgressShapeLayer.fillColor = innerCircleProgressFillColor.cgColor
        innerCircleProgressShapeLayer.strokeColor = innerCircleProgressStrokeColor.cgColor
        innerCircleProgressShapeLayer.lineCap = .round
        innerCircleProgressShapeLayer.lineWidth = innerCircleProgressLineWidth
        outerCicleView.layer.addSublayer(innerCircleProgressShapeLayer)
    }

}
