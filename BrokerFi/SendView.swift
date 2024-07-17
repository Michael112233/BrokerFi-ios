//
//  SendView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/16.
//

import SwiftUI

struct SendView: View {
    public var from :String = "11121119211199"
    @State private var to :String = "8888888888"
    @State private var value :String = "19999999999"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            AddMenuView()
            
            VStack(spacing: 10) {
                Text("Send")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .fontWeight(.black)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                Text("Transfer your coins securely to another address")
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Send from")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                        .frame(height: getFrame().getHeight(requiredHeight: 56))
                    ScrollView(.horizontal) {
                        Text(from)
                    }   .frame(width: getFrame().getWidth(requiredWidth: 318), height: getFrame().getHeight(requiredHeight: 56), alignment: .leading)
                        .fixedSize(horizontal: true, vertical: false)
                }
                
                Text("Send to")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                TextField("Enter public address (0x)", text: $to)
                    .textFieldStyle(PasswordTextFieldStyle())
                
                Text("Amount")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                TextField("0.00", text: $value)
                    .textFieldStyle(PasswordTextFieldStyle())
            }
            
            
            HStack(alignment: .center) {
                Button {
                    sendTx()
                } label: {
                    BlackButton(content: "Send", requiredWidth: 350, requiredHeight: 44)
                }
            }
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
    
    private func sendTx() {
        print(1)
        guard let url = URL(string: "https://61843335.r2.cpolar.top/broker-fi/sendtx") else {
                print("Invalid URL")
                return
            }
            
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let postData = ["from": self.from, "to": self.to, "value": self.value]
        print(postData)
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: postData, options: [])
            urlRequest.httpBody = jsonData
        } catch {
            print("Failed to serialize JSON:", error)
            return
        }
            
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
                do {
                    if let error = error {
                        throw error
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse else {
                        throw NSError(domain: "InvalidResponse", code: 0, userInfo: nil)
                    }
                    
                    print("响应状态码:", httpResponse.statusCode)
                    
                    if let data = data {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(ReceiveMessage.self, from: data)
                        print("接收到的数据:", decodedData)
                    }
                } catch {
                    print("请求错误:", error)
                }
            }
            
            task.resume()
    }
}

#Preview {
    SendView()
}
