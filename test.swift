
URLSession.shared.dataTask(with: serverUrl!) { [self] (data, res, error) in
                do {
                    self.myMediaPlayer1 = try AVAudioPlayer(data: data!)
                    self.myMediaPlayer1.prepareToPlay()
                    self.myMediaPlayer1.delegate = self
                    self.SetSessionPlayerOn()
                    self.loading_img.isHidden = true    // not work til audio finish playing  
                    self.myMediaPlayer1.play()
                }catch let error {
                    print("error!!!!!!!!!!")
                }
            }.resume()
