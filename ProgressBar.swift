
////////    1 : default one : but this can not be canceled    /////////////

let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
hud.label.text = "Sending . . ."
// to hide it
hud.isHidden = true



////////    2 : cancelabe Progressbar by click on it.     ///////////////
var hud = MBProgressHUD()
// to show it :
showHUD(withCancel: "Sending . . .")
// to hide it :
hud.isHidden = true


    func showHUD(withCancel aMessage: String?) {
        hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = aMessage
        hud.detailsLabel.text = "Stop"
      //click event on it to hide it or to try again :
        hud.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideHudNow))) 
    }
    
    @objc func hideHudNow() {
        hud.isHidden = true
    }
