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
    
    
    
}
