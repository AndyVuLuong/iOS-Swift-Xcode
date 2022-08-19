//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Andy Luong on 8/18/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //@IBOutlet weak var myImageViewer: UIImageView!
    
    //Adds box
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill //fixes ratio
        imageView.backgroundColor = .white
        return imageView
    }()
    
    //Adds button
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal) //normal state
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    
    //Main Function
    override func viewDidLoad() {
        //Default
        super.viewDidLoad()
        
        //Random Background Color
        view.backgroundColor = colors.randomElement()
        
        /*
        //Encoding
        let image = UIImage(named: "Cat.jpeg")
        let imageData = image!.jpegData(compressionQuality: 0.8)! as NSData
        //Saved Image
        UserDefaults.standard.set(imageData, forKey: "savedImage")
        //Decode
         */
        
        /*
        let data2 = UserDefaults.standard.object(forKey: "savedImage") as! NSData
        myImageViewer.image = UIImage(data: data2 as Data)
        */
        
        //Adds box
        view.addSubview(imageView)
        
        //imageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        imageView.frame = CGRect(x: 0, y: 450, width: view.frame.size.width, height: 100)

        //imageView.center = view.center
        
        //Adds button
        view.addSubview(button)
    
        //Adds random image in box when app starts
        getRandomPhoto()
        
        //Press button to generate random image
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    //Changes photo and background color when tapped
    @objc func didTapButton() {
        getRandomPhoto()
        //view.backgroundColor = colors.randomElement()
        let randomRed:CGFloat = CGFloat(arc4random_uniform(256))
        let randomGreen:CGFloat = CGFloat(arc4random_uniform(256))
        let randomBlue:CGFloat = CGFloat(arc4random_uniform(256))
        let myColor =  UIColor(red: randomRed/255, green: randomGreen/255, blue: randomBlue/255, alpha: 1.0)
        view.backgroundColor = myColor
    }
    
    //List of random colors
    let colors: [UIColor] = [
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemBlue,
        .systemPurple
    ]
    
    /*Experiment on generating the numbers of the img files
    let imageGenerator: String = {
        let firstInt = Int.random(in: 0..<2)
        var secondInt = Int.random(in: 3..<10)
        if (secondInt == 3) {
            secondInt = 0;
        }
        let thirdInt = Int.random(in: 0..<10)
        let name = "\"IMG_8" + String(firstInt) + String(secondInt) + String(thirdInt) + "\""
        return name
    }()
    
    let photos: [UIImage] = [
        UIImage(named: imageGenerator)
    ]
    */
    
    //List of random photos
    let photos: [UIImage] = [
        UIImage(named: "IMG_8083")!, UIImage(named: "IMG_8084")!,UIImage(named: "IMG_8085")!,UIImage(named: "IMG_8087")!,UIImage(named: "IMG_8088")!,UIImage(named: "IMG_8089")!,UIImage(named: "IMG_8090")!,UIImage(named: "IMG_8091")!,UIImage(named: "IMG_8092")!,UIImage(named: "IMG_8093")!,UIImage(named: "IMG_8094")!,UIImage(named: "IMG_8095")!,UIImage(named: "IMG_8096")!,UIImage(named: "IMG_8097")!,UIImage(named: "IMG_8098")!,UIImage(named: "IMG_8099")!,UIImage(named: "IMG_8100")!,UIImage(named: "IMG_8101")!,UIImage(named: "IMG_8102")!,UIImage(named: "IMG_8103")!,UIImage(named: "IMG_8104")!,UIImage(named: "IMG_8105")!,UIImage(named: "IMG_8106")!,UIImage(named: "IMG_8107")!,UIImage(named: "IMG_8108")!,UIImage(named: "IMG_8109")!,UIImage(named: "IMG_8110")!,UIImage(named: "IMG_8111")!,UIImage(named: "IMG_8112")!,UIImage(named: "IMG_8113")!,UIImage(named: "IMG_8114")!,UIImage(named: "IMG_8115")!,UIImage(named: "IMG_8116")!,UIImage(named: "IMG_8117")!,UIImage(named: "IMG_8118")!,UIImage(named: "IMG_8119")!,UIImage(named: "IMG_8120")!,UIImage(named: "IMG_8121")!,UIImage(named: "IMG_8122")!,UIImage(named: "IMG_8123")!,UIImage(named: "IMG_8124")!,UIImage(named: "IMG_8125")!,UIImage(named: "IMG_8126")!,UIImage(named: "IMG_8127")!,UIImage(named: "IMG_8128")!,UIImage(named: "IMG_8129")!,UIImage(named: "IMG_8130")!,UIImage(named: "IMG_8131")!,UIImage(named: "IMG_8132")!,UIImage(named: "IMG_8133")!,UIImage(named: "IMG_8134")!,UIImage(named: "IMG_8135")!,UIImage(named: "IMG_8136")!,UIImage(named: "IMG_8137")!,UIImage(named: "IMG_8138")!,UIImage(named: "IMG_8139")!,UIImage(named: "IMG_8140")!,UIImage(named: "IMG_8141")!,UIImage(named: "IMG_8142")!,UIImage(named: "IMG_8143")!,UIImage(named: "IMG_8144")!,UIImage(named: "IMG_8145")!
    ]
    
    //Allows button to be separate from home button
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60, height: 55)
        //Thickens button borders
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
    
    }

    //Adds random image in box
    func getRandomPhoto() {
        /*
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
        */
        imageView.image = photos.randomElement()
    }
}

