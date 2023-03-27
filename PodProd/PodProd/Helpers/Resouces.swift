//
//  Resouces.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 24.03.2023.
//

import UIKit

enum R {
    enum Colors {
        static var active = UIColor(hexString: "#437BFE")
        static var inActive = UIColor(hexString: "#929DA5")
        
        static var background = UIColor(hexString: "#F8F9F9")
        static var separator = UIColor(hexString: "#E8ECEF")
        static var secondary = UIColor(hexString: "#F0F3FF")
        
        static var titleGray = UIColor(hexString: "#545C77")
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }
        
        enum NavBarName {
            static var overview = "Today"
            static var session = "Hight Intensity Cardio"
            static var progress = "Workout Progress"
            static var settings = "Settings"
        }
        
        enum OverView {
            static var allWorkoutsButton = "All Workout"
        }
        
        enum Session {
            static var navBarLeft = "Pause"
            static var navbarRight = "Finish"
        }
        
        enum Progress {
            static var navBarLeft = "Export"
            static var navbarRight = "Details"
        }
    }
    
    enum Fonts {
        static func helvelticaregular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> String {
                switch tab {
                case .overview: return "house"
                case .session: return  "alarm"
                case .progress: return "chart.bar.fill"
                case .settings: return "gearshape"
                }
            }
        }
        
        enum Common {
            static var downErrowImage = "chevron.down"
            static var addButtonImage = "plus.circle.fill"
        }
    }
}
