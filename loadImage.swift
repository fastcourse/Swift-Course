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
    let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
     imageView.image = UIImage(data: data)
    }
    
    func loadImage2(){
    let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
    let sender_img_path = "https://cdn.cocoacasts.com/cc00ceb0c6bff0d536f25454d50223875d5c79f1/above-the-clouds.jpg"
    imageView.downloadedFrom(link: sender_img_path)  
    }  
        
    func loadImage3(){
    let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
    let image1 = UIImage(named: "photo1")//assets/photo1.jpg
    imageView.image = image1 
    }
        
     func loadImage4(){
    let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        let sender_img_path = "https://cdn.cocoacasts.com/cc00ceb0c6bff0d536f25454d50223875d5c79f1/above-the-clouds.jpg"
        let url = URL(string: sender_img_path)!
           // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                imageView.image  = UIImage(data: data)
        }else{
        imageView.image  = UIImage(named: "photo1")//assets/photo1.jpg as default to avoide nil
            }
         
    }  
              
  //action sheet as alert :load img into alert
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
        let titleFont = [NSAttributedStringKey.font: UIFont(name: "ArialHebrew-Bold", size: 22.0)!]
        //fontnames : https://github.com/lionhylra/iOS-UIFont-Names
        let msgAttrString = NSMutableAttributedString(string: alert_msg, attributes: msgFont)
        let titleAttrString = NSMutableAttributedString(string: title1, attributes: titleFont)
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
                alert.setValue(titleAttrString, forKey: "attributedTitle")
                alert.setValue(msgAttrString, forKey: "attributedMessage")
        
               alert.view.tintColor = UIColor.black
               alert.view.backgroundColor = UIColor.blue
               alert.view.layer.cornerRadius = 40
    } 
        func VC_AS_Alert(){
            //cpc8136
            
        }

//this is normal alert , format msg and title, but without image. at the end we can close alert after afew swconds
func Show_nafida_for_msgs(x: Int){
    let title1 = "Message !"
    let alert_msg = self.my_last_text_msg_private_text
    let alertController = UIAlertController(
        title: title1,
        message: alert_msg,
        preferredStyle: UIAlertControllerStyle.alert
    )

    let cancelAction = UIAlertAction(
        title: "Cancel",
        style: UIAlertActionStyle.destructive) { (action) in
        // ...
    }

    let confirmAction = UIAlertAction(
        title: "OK", style: UIAlertActionStyle.default) { (action) in
        // ...
    }
        
        let msgFont = [NSAttributedStringKey.font: UIFont(name: "Avenir-Roman", size: 22.0)!]//Menlo-Regular,Symbol,Verdana,Courier,Optima-Regular,Avenir-Roman,
        let titleFont = [NSAttributedStringKey.font: UIFont(name: "Arial-BoldMT", size: 22.0)!]//Menlo-Bold,Verdana-Bold,Courier-Bold,Optima-Bold,
        let msgAttrString = NSMutableAttributedString(string: alert_msg, attributes: msgFont)
        let titleAttrString = NSMutableAttributedString(string: title1, attributes: titleFont)


        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
        alertController.setValue(titleAttrString, forKey: "attributedTitle")
        alertController.setValue(msgAttrString, forKey: "attributedMessage")

        alertController.view.tintColor = UIColor.black
        alertController.view.backgroundColor = UIColor.blue
        alertController.view.layer.cornerRadius = 40
        
        // change to desired number of seconds (in this case 10 seconds)
        let when = DispatchTime.now() + 10
        DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
            alertController.dismiss(animated: true, completion: nil)
        }
        
        
    }
        
//this is normal alert wit image
    func Show_nafida_for_msgs(x: Int){
    let title1 = "Message !"
    let alert_msg = self.my_last_text_msg_private_text
    let alertController = UIAlertController(
        title: title1,
        message: alert_msg,
        preferredStyle: UIAlertControllerStyle.alert
    )

    let cancelAction = UIAlertAction(
        title: "Cancel",
        style: UIAlertActionStyle.destructive) { (action) in
        // ...
    }

    let confirmAction = UIAlertAction(
        title: "OK", style: UIAlertActionStyle.default) { (action) in
        // ...
    }
        
        let  imageAction = UIAlertAction(title: "", style: .destructive, handler: { (action) -> Void in
          print("img clicked")
        })
        var image = UIImage(named: "de_48")//just initi
        let sender_img_path = self.contact_us+"siaha/msg_pictures/\(my_last_text_msg_private_img)"
        let url = URL(string: sender_img_path)!
            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                image = UIImage(data: data)

        }
        let left = -alertController.view.frame.size.width / 2 + image!.size.width/2
       // let centeredTopoImage = image?.withAlignmentRectInsets(UIEdgeInsetsMake(0, left, 0, 0)).withRenderingMode(.alwaysOriginal)//top,left, buttom, right
        let centeredTopoImage = image?.withAlignmentRectInsets(UIEdgeInsetsMake(0, 0, 0, 0)).withRenderingMode(.alwaysOriginal)//top,left, buttom, right
        imageAction.setValue(centeredTopoImage, forKey: "image")
        
        let msgFont = [NSAttributedStringKey.font: UIFont(name: "Avenir-Roman", size: 22.0)!]//Menlo-Regular,Symbol,Verdana,Courier,Optima-Regular,Avenir-Roman,
        let titleFont = [NSAttributedStringKey.font: UIFont(name: "Arial-BoldMT", size: 22.0)!]//Menlo-Bold,Verdana-Bold,Courier-Bold,Optima-Bold,
        let msgAttrString = NSMutableAttributedString(string: alert_msg, attributes: msgFont)
        let titleAttrString = NSMutableAttributedString(string: title1, attributes: titleFont)

        alertController.addAction(imageAction)
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        

        present(alertController, animated: true, completion: nil)
        alertController.setValue(titleAttrString, forKey: "attributedTitle")
        alertController.setValue(msgAttrString, forKey: "attributedMessage")

        alertController.view.tintColor = UIColor.black
        alertController.view.backgroundColor = UIColor.blue
        alertController.view.layer.cornerRadius = 40
        
        // change to desired number of seconds (in this case 10 seconds)
        let when = DispatchTime.now() + 10
        DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
            alertController.dismiss(animated: true, completion: nil)
        }
        
        
    }
        
        1- ActionSheet as Alert with image and format title and msg
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
        let titleFont = [NSAttributedStringKey.font: UIFont(name: "ArialHebrew-Bold", size: 22.0)!]
        //fontnames : https://github.com/lionhylra/iOS-UIFont-Names
        let msgAttrString = NSMutableAttributedString(string: alert_msg, attributes: msgFont)
        let titleAttrString = NSMutableAttributedString(string: title1, attributes: titleFont)
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
                alert.setValue(titleAttrString, forKey: "attributedTitle")
                alert.setValue(msgAttrString, forKey: "attributedMessage")
        
               alert.view.tintColor = UIColor.black
               alert.view.backgroundColor = UIColor.blue
               alert.view.layer.cornerRadius = 40
    } 
        
        
        
        
}
