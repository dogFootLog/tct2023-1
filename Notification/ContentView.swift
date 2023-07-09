//
//  ContentView.swift
//  Notification
//
//  Created by 강수희 on 2023/06/19.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ViewModel
    
    
    var filteredList: [DataModel1] {
        model.scheList.filter { sche in
            if sche.time >= Date() {
                return true
            }
            return false
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                
                Button {
                    model.showModal = true
                } label: {
                    Image(uiImage: .add)
                }
            }
            
            Spacer()
            
            VStack {
                Text("오늘 할 일")
                    .font(.title)
                
                List(filteredList) { data in
                    HStack {
                        Text(data.name)
                        
                        Spacer()
                        
                        Text(data.time.toCertainFormatString(format: "a hh시 mm분"))
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $model.showModal) {
            ModalView()
                .environmentObject(model)
        }
        .onAppear {
            if let savedData = UserDefaults.standard.object(forKey: "notiApp") as? Data {
                let decoder = JSONDecoder()
                if let savedObject = try? decoder.decode([DataModel1].self, from: savedData) {
                    model.scheList = savedObject
                }
            }
            
            if model.firstLoad {
                UNUserNotificationCenter.current().requestAuthorization(
                options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in
                print(didAllow) //
             })
                
                model.firstLoad = false
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
