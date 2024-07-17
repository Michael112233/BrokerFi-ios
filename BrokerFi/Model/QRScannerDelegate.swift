//
//  QRScannerDelegate.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/21.
//

import SwiftUI
import AVKit

class QRScannerDelegate: NSObject, ObservableObject, AVCaptureMetadataOutputObjectsDelegate {
    public var ans: String = ""
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if let metaObject = metadataObjects.first {
            guard let readableObject = metaObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let scannedCode = readableObject.stringValue else { return }
            print(scannedCode)
            if (String(scannedCode) != "") {
                ans = String(scannedCode)
                print(ans)
                isGot.signal()
                return
            }
        }
    }
}
