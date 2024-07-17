//
//  ScannerView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/21.
//

import SwiftUI
import AVKit

struct ScannerView: View {
    // QR Code Scanner Properties
    @State private var session: AVCaptureSession = .init()
    // QR Code Scanner AV Output
    @State private var qrOutput: AVCaptureMetadataOutput = .init()
    // camera permission
    @State private var cameraPermission: Permission = .idle
    // error message
    @State private var errorMessage: String = ""
    @State private var showError: Bool = false
    @State private var canNavi: Bool = false
    @Environment(\.openURL) private var openURL
    @StateObject private var qrDelegate = QRScannerDelegate()
        
    var body: some View {
        VStack(spacing: 8) {
            AddMenuView()
            Text("Place the QR code inside the area")
                .font(.title3)
                .foregroundStyle(.black.opacity(0.8))
                .padding(.top, 20)
            Text("Scanning will start automatically")
                .font(.callout)
                .foregroundColor(.gray)
            Spacer(minLength: 0)
            
            // Scanner
            GeometryReader {
                let size = $0.size
                
                ZStack {
                    CameraView(frameSize: CGSize(width: size.width, height: size.width), session: $session)
                        
                    ForEach(0...4, id: \.self) { index in
                        let angle = Double(index) * 90
                        RoundedRectangle(cornerRadius: 2, style: .circular)
                            .trim(from: 0.61, to: 0.64)
                            .stroke(.black, style: StrokeStyle(lineWidth: 5))
                            .rotationEffect(.init(degrees: angle))
                    }
                }
                // Square Shape
                .frame(width: size.width, height: size.width)
                // make it center
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            }
            
            Spacer(minLength: 15)
            
            Button {
                // print(1)
            } label: {
                Image(systemName: "qrcode.viewfinder")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
            
            Spacer(minLength: 45)
        }
        
        // check camera permission, when the view is visible
        .onAppear(perform: checkCameraPermission)
        .alert(errorMessage, isPresented: $showError) {
            // show setting's button, if permission is denied
            if(cameraPermission == .denied) {
                Button("Setting") {
                    let settingString = UIApplication.openSettingsURLString
                    if let settingURL = URL(string: settingString) {
                        // opening app's setting, using openURL SwiftUI API
                        openURL(settingURL)
                    }
                }
                
                Button("Cancel", role: .cancel) {
                }
                
            }
        }
        
        .fullScreenCover(isPresented: $canNavi, content: {
            SendView(from: qrDelegate.ans)
        })
    }
    
    // check camera permission
    func checkCameraPermission() {
        Task {
            switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                cameraPermission = .approved
                setUpCamera()
            case .notDetermined:
                // Requesting Camera Access
                if await AVCaptureDevice.requestAccess(for: .video) {
                    // Permission Granted
                    cameraPermission = .approved
                } else {
                    // Permission Denied
                    cameraPermission = .denied
                    // Presenting Error Message
                    presentError(message: "Please provide access to camera for scanning codes")
                }
            case .denied, .restricted:
                cameraPermission = .denied
                presentError(message: "Please provide access to camera for scanning codes")
            default: break
            }
        }
    }
    
    func presentError(message: String) {
        errorMessage = message
        showError.toggle()
    }
    
    func setUpCamera() {
        do {
            guard let device = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back).devices.first else {
                presentError(message: "UNKNOWN DEVICE ERROR")
                return
            }
            
            let input = try AVCaptureDeviceInput(device: device)
            
            guard session.canAddInput(input), session.canAddOutput(qrOutput) else {
                presentError(message: "UNKNOWN INPUT/OUTPUT ERROR")
                return
            }
            
            session.beginConfiguration()
            session.addInput(input)
            session.addOutput(qrOutput)
            
            qrOutput.metadataObjectTypes = [.qr]
            
            qrOutput.setMetadataObjectsDelegate(qrDelegate, queue: .main)
            session.commitConfiguration()
            
            DispatchQueue.global(qos: .background).async() {
                session.startRunning()
            }
            
            DispatchQueue.global(qos: .background).async() {
                isGot.wait()
                session.stopRunning()
                print(2)
                canNavi = true
            }
            
        } catch {
            presentError(message: error.localizedDescription)
        }
    }
}

#Preview {
    ScannerView()
}
