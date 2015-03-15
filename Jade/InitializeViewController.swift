//
//  InitializeViewController.swift
//  Jade
//
//  Created by S-Shimotori on 3/15/15.
//  Copyright (c) 2015 S-Shimotori. All rights reserved.
//

import UIKit

class InitializeViewController: UIViewController {
    
    @IBOutlet private weak var explanationView: UIView!
    @IBOutlet private weak var explanationLabel: UILabel!
    @IBOutlet private weak var startInitializeButton: UIButton!
    
    @IBOutlet private weak var setTableView: UIView!
    @IBOutlet private weak var setSaturdayLabel: UILabel!
    @IBOutlet private weak var setSaturdaySwitch: UISwitch!
    @IBOutlet private weak var setSundayLabel: UILabel!
    @IBOutlet private weak var setSundaySwitch: UISwitch!
    @IBOutlet private weak var setStartDayLabel: UILabel!
    @IBOutlet private weak var setStartDaySegmentedControl: UISegmentedControl!
    @IBOutlet private weak var setPeriodNameLabel: UILabel!
    @IBOutlet private weak var setPeriodNameTextField: UITextField!
    @IBOutlet private weak var setNumberOfPeriodsLabel: UILabel!
    @IBOutlet private weak var numberOfPeriodsLabel: UILabel!
    @IBOutlet private weak var setNumberOfPeriodsStepper: UIStepper!
    @IBOutlet private weak var toSetPeriodButton: UIButton!
    
    private enum Phase {
        case Explanation
        case SetTable
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = .hisuiColor()

        
        setTableView.alpha = 0
        
        explanationLabel.text = "Jadeの初期設定を行います。\nすべての設定は後から変更することができます。\n詳細はマニュアルをご覧ください。"
        startInitializeButton.setTitle("設定を始める", forState:.Normal)
        startInitializeButton.addTarget(self, action:"onPressStartInitializeButton:", forControlEvents:.TouchUpInside)

        
        setSaturdayLabel.text = "土曜日を含む"
        setSaturdaySwitch.on = false
        setSundayLabel.text = "日曜日を含む"
        setSundaySwitch.on = false
        setSundaySwitch.addTarget(self, action:"changeValueSetSundaySwitch:", forControlEvents: UIControlEvents.ValueChanged)
        setStartDayLabel.text = "曜日始まり"
        setStartDaySegmentedControl.setTitle("月曜", forSegmentAtIndex:0)
        setStartDaySegmentedControl.setTitle("日曜", forSegmentAtIndex:1)
        enableStartDate(false)
        setPeriodNameLabel.text = "単位時間名"
        setPeriodNameTextField.text = "時限"
        setNumberOfPeriodsLabel.text = "1日のコマ数"
        setNumberOfPeriodsStepper.minimumValue = 1
        setNumberOfPeriodsStepper.maximumValue = 10
        setNumberOfPeriodsStepper.stepValue = 1
        setNumberOfPeriodsStepper.value = 4
        numberOfPeriodsLabel.text = String(Int(setNumberOfPeriodsStepper.value))
        setNumberOfPeriodsStepper.addTarget(self, action:"changeValueSetNumberOfPeriodsStepper:", forControlEvents:.ValueChanged)
        toSetPeriodButton.setTitle("次へ", forState:.Normal)
    }
    
    private func setPhase(phase: Phase) {
        func pageAnimation(duration: NSTimeInterval, previousView: UIView, nextView: UIView) {
            UIView.animateWithDuration(duration, delay:0,
                options:.CurveLinear,
                animations:{
                    previousView.alpha = 0
                },
                completion:{value in
                    previousView.hidden = true
                    nextView.hidden = false
                    UIView.animateWithDuration(duration, delay:0,
                        options:.CurveLinear,
                        animations:{
                            nextView.alpha = 1
                        },
                        completion: nil)
                }
            )
        }
        
        switch phase {
        case .Explanation:
            setTableView.hidden = true
        case .SetTable:
            pageAnimation(0.5, explanationView, setTableView)
        }
    }
    
    func onPressStartInitializeButton(sender: UIButton) {
        setPhase(.SetTable)
    }
    
    func changeValueSetSundaySwitch(sender: UISwitch) {
        enableStartDate(sender.on)
    }
    
    private func enableStartDate(value: Bool) {
        if value {
            setStartDayLabel.textColor = .blackColor()
            setStartDaySegmentedControl.enabled = true
        } else {
            setStartDayLabel.textColor = .grayColor()
            setStartDaySegmentedControl.selectedSegmentIndex = 0
            setStartDaySegmentedControl.enabled = false
        }
    }

    func changeValueSetNumberOfPeriodsStepper(sender: UIStepper) {
        numberOfPeriodsLabel.text = String(Int(sender.value))
    }
}
