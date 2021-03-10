//
//  QRHelper.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import UIKit
import CoreImage.CIFilterBuiltins

struct QRHelper {
    let color: UIColor
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    /// Функция для создания qr-кода по заданной строке
    /// - Parameter string: Строка с данными для qr-кода
    /// - Returns: UIImage - qr-код
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
    
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg).maskWithColor(color: color) ?? UIImage(systemName: "xmark.circle") ?? UIImage()
            }
        }
    
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
