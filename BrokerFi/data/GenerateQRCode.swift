//
//  GenerateQRCode.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/23.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

func generateQRCode(string: String) -> UIImage {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    filter.message = Data(string.utf8)
    
    let scale: CGFloat = 4.0
    let transform = CGAffineTransform(scaleX: scale, y: scale)
    
    if let outputImage = filter.outputImage?.samplingNearest().transformed(by: transform) {
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        }
    }

    return UIImage(systemName: "xmark.circle") ?? UIImage()
}

func saveImage(image: UIImage) {
    let saver = ImageSaver()
    saver.writeToPhotoAlbum(image: image)
}

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}
