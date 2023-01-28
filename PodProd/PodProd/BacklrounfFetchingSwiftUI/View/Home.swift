//
//  Home.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 27.01.2023.
//

import SwiftUI

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
                            
                            let time = index * 10
                            
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
                .ignoresSafeArea(.all, edges: .all)
                .overlay(
                    Text("\(data.selectedTime)")
                        .font(.system(size: 55, weight: .heavy))
                        .foregroundColor(.white)
                )
                .offset(y: data.timerViewOffset)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.brown.ignoresSafeArea(.all, edges: .all))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


