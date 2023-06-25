//
//  ModalView.swift
//  Notification
//
//  Created by 강수희 on 2023/06/19.
//

import SwiftUI

struct ModalView: View {
    @EnvironmentObject var model: ViewModel
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    @State var date = Date()
    @State var name: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("일정 이름", text: $name)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))

            
            DatePicker(selection: $date, displayedComponents: [.hourAndMinute], label: {
                
            })
                .datePickerStyle(.wheel)
            
            HStack {
                Button {
                    model.showModal = false
                } label: {
                    Text("취소")
                }
                
                Spacer()
                
                Button {
                    model.scheList.append(DataModel1(id: model.scheList.count + 1, name: name, time: date))
                    
                    if let encoded = try? JSONEncoder().encode(model.scheList) {
                        UserDefaults.standard.setValue(encoded, forKey: "notiApp")
                    }
                    
                    scheduleNotification(title: name, body: name, date: date)
                    
                    model.showModal = false
                } label: {
                    Text("저장")
                }

            }
            .padding()
        }
        .padding()
    }
    
    func scheduleNotification(title: String, body: String, date: Date) {
        // 알림을 생성할 날짜를 정의합니다.
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date) // 여기에 알림을 발생시킬 날짜를 지정할 수 있습니다.

        // 알림 콘텐츠를 생성합니다.
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default

        // 알림 트리거를 생성합니다.
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        // 알림 요청을 생성합니다.
        let request = UNNotificationRequest(identifier: "Notification", content: content, trigger: trigger)

        // 알림 센터에 요청을 추가합니다.
        notificationCenter.add(request) { error in
            if let error = error {
                print("알림 요청 추가 중 오류 발생: \(error.localizedDescription)")
            } else {
                print("알림 요청이 성공적으로 추가되었습니다.")
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
