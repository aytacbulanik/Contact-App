//
//  TestViewController.swift
//  Contact App
//
//  Created by Aytaç Bulanık on 23.11.2024.
import UIKit
import AVFoundation

class TestViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Kamera ayarları (bu kısım daha detaylı yapılandırılabilir)
        captureSession = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput = try! AVCaptureDeviceInput(device: videoCaptureDevice)
        captureSession.addInput(videoInput)
        
        // Görüntü çıkışı ve önizleme
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(videoOutput)
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // Bu kısımda alınan görüntü üzerinde barkod taraması yapılır.
        // Örneğin, bir üçüncü parti kütüphane (örn: Vision) kullanılabilir.
        // Tanınan barkodun içeriğiyle ilgili işlemler burada gerçekleştirilir.
    }
}
