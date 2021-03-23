//https://stackoverflow.com/questions/30859203/uibutton-with-single-press-and-long-press-events-swift
@IBOutlet weak var btn: UIButton!

override func viewDidLoad() {

    let tapGesture = UITapGestureRecognizer(target: self, #selector (tap))  //Tap function will call when user tap on button
    let longGesture = UILongPressGestureRecognizer(target: self, #selector(long))  //Long function will call when user long press on button.
    tapGesture.numberOfTapsRequired = 1
    longGesture.minimumPressDuration = 2
    btn.addGestureRecognizer(tapGesture)
    btn.addGestureRecognizer(longGesture)
}

@objc func tap() {

    print("Tap happend")
}

@objc func long() {

    print("Long press")
}
