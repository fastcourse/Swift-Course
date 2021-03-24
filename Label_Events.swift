
// 1   we can with a trick create label OnClick :

override func viewDidLoad() {
        super.viewDidLoad()
//label receiver un click
        let tap = UITapGestureRecognizer(target: self, action: #selector(yourVC.labelReceiverClick))
        labelReceiverUn.isUserInteractionEnabled = true
        labelReceiverUn.addGestureRecognizer(tap)
}
    @objc func labelReceiverClick(sender:UITapGestureRecognizer) {
       // view.endEditing(true)
      print("label tapped")
        //BtnSelectContact.sendActions(for: .touchUpInside)
    }


///////////////////////////////////////////////////////////////////
// 2- :
