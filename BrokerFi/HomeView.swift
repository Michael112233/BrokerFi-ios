//
//  HomeView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/14.
//

import SwiftUI

struct HomeView: View {
    @State private var isBroker :Bool = false
    @State private var ispresentedBuy :Bool = false
    @State private var ispresentedSend :Bool = false
    @State private var ispresentedSwap :Bool = false
    @State private var ispresentedBroker :Bool = false
    @State private var ispresentedSupport :Bool = false
    @State private var returnAccountState :ReturnAccountState = ReturnAccountState(account: "", balance: "0")
    
    var body: some View {
        VStack(spacing: 16) {
            AddMenuView(isHome: true)
            
            if(isBroker) {
                ShardView()
            } else {
                VStack(spacing: 5) {
                    Text(String(returnAccountState.balance) + " BKC")
                        .fontWeight(.black)
                        .font(.system(size: getFrame().getHeight(requiredHeight: 48)))
                    Text("$1200.00 USD")
                        .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                }.frame(height: getFrame().getHeight(requiredHeight: 308))
            }
            
            HStack(spacing: 32) {
                Button {
                    ispresentedBuy.toggle()
                } label: {
                    HomeIconView(hasCircle: true, iconName: "plus", text: "Buy")
                }.fullScreenCover(isPresented: $ispresentedBuy, content: {
                    BuyView()
                })
                
                Button {
                    ispresentedSend.toggle()
                } label: {
                    HomeIconView(hasCircle: true, iconName: "send", text: "Send")
                }.fullScreenCover(isPresented: $ispresentedSend, content: {
                    ScannerView()
                })
                
                Button {
                    ispresentedSwap.toggle()
                } label: {
                    HomeIconView(hasCircle: true, iconName: "transaction", text: "Swap")
                }.fullScreenCover(isPresented: $ispresentedSwap, content: {
                    SwapView()
                })
                
                Button {
                    ispresentedBroker.toggle()
                } label: {
                    HomeIconView(hasCircle: true, iconName: "line-chart", text: "Broker")
                }.fullScreenCover(isPresented: $ispresentedBroker, content: {
                    BrokerMenuView()
                })
            }.frame(height: getFrame().getHeight(requiredHeight: 80), alignment: .top)
            
            Button {
                ispresentedSupport.toggle()
            } label: {
                HStack() {
                    Image("question-circle (1)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: getFrame().getWidth(requiredWidth: 14))
                        .opacity(0.5)
                        
                        
                    Text("BrokerFi support")
                        .font(.system(size: getFrame().getHeight(requiredHeight: 14)))
                        
                        
                }.foregroundColor(Color(red: 107/255, green: 114/255, blue: 128/255))
            }.alert("still developing", isPresented: $ispresentedSupport) {
                Button("Cancel", role: .cancel) {}
            }
            
        }
        .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
        .onAppear() {
            self.GetWalletState()
        }
    }
    
    private func GetWalletState() {
        guard let url = URL(string: "https://61843335.r2.cpolar.top/broker-fi/query-p") else {
                print("Invalid URL")
                return
            }
            
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let postData = ["addr": "8888888888"]
        
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
                        let decodedData = try decoder.decode(ReturnAccountState.self, from: data)
                        print("接收到的数据:", decodedData)
                        self.returnAccountState = decodedData
                    }
                } catch {
                    print("请求错误:", error)
                }
            }
            
            task.resume()
    }

}

#Preview {
    HomeView()
}
