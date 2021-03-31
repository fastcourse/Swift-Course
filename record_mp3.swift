record mp3 in swift4
import UIKit
import AVFoundation
import Alamofire
import MBProgressHUD
import Darwin

class ViewController: UIViewController {

    var audioSession = AVAudioSession.sharedInstance()
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    
    var fileName: String!
    
    var recordedUrl: URL!
    var compressedUrl: URL!

    let audioSettings: [String : Any] = [
        AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
        AVSampleRateKey: 16000,
        AVNumberOfChannelsKey: 1,
        AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue,
        AVLinearPCMBitDepthKey:0
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try audioSession.setActive(true)
            audioSession.requestRecordPermission { (permission) in
                
            }
        }catch{
            print("error audio session.")
        }
    }

    @IBAction func onPressedRecord(_ sender: Any) {
        print("Pressed Record button")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd_HHmmss"

        let date = Date()
        let dateStr = dateFormatter.string(from: date)
        
        let randomNumber = arc4random()/10000
        
        fileName = "\(dateStr)_\(randomNumber)"
        let recordedName = "\(fileName).m4a"
        let compressedName = "\(fileName).mp4"

        recordedUrl = getDirectory().appendingPathComponent(recordedName)
        compressedUrl = getDirectory().appendingPathComponent(compressedName)

        if audioRecorder == nil {
            do {
                audioRecorder = try AVAudioRecorder(url: recordedUrl, settings: audioSettings)
                audioRecorder.record()
            }catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func onReleasedRecord(_ sender: Any) {
        print("Released Record button")
        audioRecorder.stop()
        audioRecorder = nil
        
        convertUsingExportSession()
    }
    
    @IBAction func onPressedPlay(_ sender: Any) {
        if recordedUrl == nil {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: compressedUrl)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func onPressedPlayFromServer(_ sender: Any) {
        let serverUrl = URL.init(string: "http://00213.eu/test/msg_audios/1") // means: 1.mp3
        URLSession.shared.dataTask(with: serverUrl!) { (data, res, error) in
            do {
                self.audioPlayer = try AVAudioPlayer(data: data!)
                self.audioPlayer.prepareToPlay()
                self.audioPlayer.play()
            }catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    @IBAction func onPressedSend(_ sender: Any) {
        if recordedUrl == nil {
            return
        }
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Please Wait"

        let uploadUrl = "http://00213.eu/test/upload_audio.php?audio=1"
        Alamofire.upload(multipartFormData: { (formData) in
            //formData.append(self.compressedUrl, withName: "uploaded_file", fileName: "\(self.fileName).mp3", mimeType: "audio/mpeg")
            formData.append(self.compressedUrl, withName: "uploaded_file", fileName: "\(self.fileName jQuery111304703075527042504_1523237614291 "").mp3", mimeType: "audio/mpeg")
        }, to: uploadUrl) { (result) in
            switch result {
            case .success(let upload, _, _):
                upload.responseString{ (response) in
                    hud.hide(animated: true)
                    print(response)
                }
            case .failure(let encodingError):
                hud.hide(animated: true)
                print(encodingError)
            }
        }
    }
    
    func getDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func convertUsingExportSession() {
        
        let asset = AVAsset.init(url: recordedUrl)
        
        let exportSession = AVAssetExportSession.init(asset: asset, presetName: AVAssetExportPresetHighestQuality)
        
        // remove file if already exits
        let fileManager = FileManager.default
        do{
            try fileManager.removeItem(at: compressedUrl)
            
        }catch{
            print("can't")
        }
        
        
        exportSession?.outputFileType = AVFileType.mp4
        
        exportSession?.outputURL = compressedUrl
        
        exportSession?.metadata = asset.metadata
        
        exportSession?.exportAsynchronously(completionHandler: {
            if (exportSession?.status == .completed)
            {
                print("AV export succeeded.")
                
                // outputUrl to post Audio on server
                do {
                    let fileAttr = try FileManager.default.attributesOfItem(atPath: self.recordedUrl.path)
                    let fileMp3Attr = try FileManager.default.attributesOfItem(atPath: self.compressedUrl.path)
                    print(fileAttr[FileAttributeKey.size] jQuery11130020141898505329547_1523237749121 0)
                    print(fileMp3Attr[FileAttributeKey.size] jQuery111306132785572119929_1523238351028 0)
                } catch  let error{
                    print(error.localizedDescription)
                }

            }
            else if (exportSession?.status == .cancelled)
            {
                print("AV export cancelled.")
            }
            else
            {
                print ("Error is \(String(describing: exportSession?.error))")
                
            }
        })
    }
}
