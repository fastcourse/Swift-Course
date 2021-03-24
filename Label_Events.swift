
// 1   we can with a trick create label OnClick :
@IBOutlet weak var labelSendTo: UILabel!
override func viewDidLoad() {
        super.viewDidLoad()
//label receiver un click
        let tap = UITapGestureRecognizer(target: self, action: #selector(yourVC.labelReceiverClick))
        labelSendTo.isUserInteractionEnabled = true
        labelSendTo.addGestureRecognizer(tap)
}
    @objc func labelReceiverClick(sender:UITapGestureRecognizer) {
       // view.endEditing(true)
      print("label tapped")
        //BtnSelectContact.sendActions(for: .touchUpInside)
    }


///////////////////////////////////////////////////////////////////
// 2- :
