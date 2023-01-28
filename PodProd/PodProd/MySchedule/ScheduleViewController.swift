//
//  ScheduleViewController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 17.01.2023.
//

import UIKit
import FSCalendar

class ScheduleViewController: UIViewController {

    var calendarHightConstraint: NSLayoutConstraint!
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    let showHightButton: UIButton = {
       let button = UIButton()
        button.setTitle("Open  calendar", for: .normal)
        button.setTitleColor(UIColor(cgColor: .init(red: 100, green: 100, blue: 100, alpha: 100)), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Schedule"
        
        calendar.delegate = self
        calendar.dataSource = self
        
        hightMusterViewControllerIfNeeddet()
        setConstraint()
    }

    private func hightMusterViewControllerIfNeeddet() {
        if let splitViewController = self.splitViewController {
            if let navControler = splitViewController.viewControllers.last as? UINavigationController {
                navControler.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            }
        }
    }
}

extension ScheduleViewController: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
}


//MARK: - SetConstraint

extension ScheduleViewController {
    func setConstraint() {
        view.addSubview(calendar)
        
        calendarHightConstraint = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 400)
        calendar.addConstraint(calendarHightConstraint)
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)])
    }
}
