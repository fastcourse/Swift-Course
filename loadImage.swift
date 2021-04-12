//1 : https://cocoacasts.com/fm-3-download-an-image-from-a-url-in-swift
override func viewDidLoad() {
    super.viewDidLoad()   
  //  loadImage1()
    loadImage2()
    }
    
    func loadImage1(){
    // Create URL
    let url = URL(string: "https://cdn.cocoacasts.com/cc00ceb0c6bff0d536f25454d50223875d5c79f1/above-the-clouds.jpg")!
    // Fetch Image Data
    if let data = try? Data(contentsOf: url) {
    // Create Image and Update Image View
     imageView.image = UIImage(data: data)
    }
    
    func loadImage2(){
    let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
    let sender_img_path = "https://cdn.cocoacasts.com/cc00ceb0c6bff0d536f25454d50223875d5c79f1/above-the-clouds.jpg"
    imageView.downloadedFrom(link: sender_img_path)  
    }   
        
        
        
  //load img into alert
    func Show_nafida_for_msgs(x: Int){
        let title1 = "Message!"
        let alert_msg = "text text text text text text text text text text text text text text text " +
        "text text text text text text text text text text text text text text text text text text1 "
        let alert = UIAlertController(title: title1, message: alert_msg, preferredStyle: .actionSheet)

        let imageAction = UIAlertAction(title: "", style: .default, handler: nil)
        var image = UIImage(named: "Zurich")
        let sender_img_path = self.contact_us+"siaha/msg_pictures/\(my_last_text_msg_private_img)"

        let url = URL(string: sender_img_path)!

            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                image = UIImage(data: data)

        }
        
        let msgFont = [NSAttributedStringKey.font: UIFont(name: "Avenir-Roman", size: 22.0)!]
       // let titleFont = [NSAttributedStringKey.font: UIFont(name: "ArialHebrew-Bold", size: 22.0)!]
        let msgAttrString = NSMutableAttributedString(string: title1, attributes: msgFont)
        let titleAttrString = NSMutableAttributedString(string: alert_msg, attributes: msgFont)

        let alertViewPadding: CGFloat = 65.0 //Adjust this as per your need
                let left = -alert.view.frame.size.width / 2 + image!.size.width/2 + 20
               // let left = alert.view.frame.size.width/2 - image!.size.width/2
                let centeredTopoImage = image?.withAlignmentRectInsets(UIEdgeInsetsMake(0, left, 0, 0)).withRenderingMode(.alwaysOriginal)
                imageAction.setValue(centeredTopoImage, forKey: "image")


                let  deleteButton = UIAlertAction(title: "Unfollow", style: .destructive, handler: { (action) -> Void in
                    print("Delete button tapped")

                })

                let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
                    print("Cancel button tapped")

                })

                alert.addAction(imageAction)
                alert.addAction(deleteButton)
                alert.addAction(cancelButton)
                self.present(alert, animated: true, completion: nil)
                alert.setValue(titleAttrString, forKey: "attributedMessage")
                alert.setValue(msgAttrString, forKey: "attributedMessage")
    }

          
        
}
