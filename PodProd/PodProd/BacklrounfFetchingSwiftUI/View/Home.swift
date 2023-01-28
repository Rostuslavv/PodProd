//
//  Home.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 27.01.2023.
//

import SwiftUI
import UserNotifications

struct Home: View {
    
    @StateObject var data = TimerData()
    
    var body: some View {
        
        ZStack {
            VStack {
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false, content:  {
                    
                    // Timer Buttons...
                    
                    HStack(spacing: 20) {
                        ForEach(1...10, id: \.self) { index in
                            
                            // Each Time Wiil Be Multiples Of 5...
                            
                            let time = index * 5
                            
                            Text("\(time)")
                                .font(.system(size: 45, weight: .heavy))
                                .frame(width: 100, height: 100)
                            // Changing Color for selected Ones...
                                .background(data.time == time ? Color.pink : Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    withAnimation {
                                        data.time = time
                                        data.selectedTime = time
                                    }
                                }
                        }
                    }
                    
                })
                
                // Setting To center...
                .offset(y: 40)
                .opacity(data.buttonAnimation ? 0 : 1)
                
                Spacer()
                
                // Start Button...
                
                Button (action: {
                    withAnimation(Animation.easeInOut(duration: 0.65)) {
                        data.buttonAnimation.toggle()
                    }
                    // Delay Animation...
                    
                    // After button goes down is moving up
                    withAnimation(Animation.easeIn.delay(0.6)) {
                        data.timerViewOffset = 0
                    }
                    performNotifications()
                }, label: {
                    
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 80, height: 80)
                })
                .padding(.bottom, 35)
                // Disable if not selected...
                .disabled(data.time == 0)
                .opacity(data.time == 0 ? 0.6 : 1)
                // Moving down smoothly...
                .offset(y: data.buttonAnimation ? 300 : 0)
            }
            
            Color.pink
                // Decreasing height for each count...
                .overlay(
                    Text("\(data.selectedTime)")
                        .font(.system(size: 55, weight: .heavy))
                        .foregroundColor(.white)
                )
                .frame(height: UIScreen.main.bounds.height - data.timerHeightChange)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(.all, edges: .all)
                .offset(y: data.timerViewOffset)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.brown.ignoresSafeArea(.all, edges: .all))
        // Timer functionality...
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            // Conditions...
            if data.time != 0 && data.selectedTime != 0 && data.buttonAnimation {
                // Counting timer...
                data.selectedTime -= 1
                
                // Update height...
                let progressHeight = UIScreen.main.bounds.height / CGFloat(data.time)
                let diff = data.time - data.selectedTime
                
                withAnimation(.default) {
                    data.timerHeightChange = CGFloat(diff) * progressHeight
                }
                
                if data.selectedTime == 0 {
                    // Resentting...
                    withAnimation(.default) {
                        data.resetView()
                    }
                }
            }
        })
        .onAppear(perform: {
            
            // Permissions...
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { (_, _) in
            }
            
            // Setting delegate for in - App notification...
            UNUserNotificationCenter.current().delegate = data
            
        })
    }
    
    func performNotifications() {
        let content = UNMutableNotificationContent()
        content.title = "Notofication From Soft"
        content.body = "Timer has been finished!!!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(data.time), repeats: false)
        
        let request = UNNotificationRequest(identifier: "TIMER", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


