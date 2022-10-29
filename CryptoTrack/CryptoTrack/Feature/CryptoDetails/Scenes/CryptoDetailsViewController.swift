//
//  CryptoDetailsViewController.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/30/22.
//

import UIKit
import SDWebImageSVGCoder

class CryptoDetailsViewController: UIViewController {

    @IBOutlet weak var cryptoLogo: UIImageView!
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var cryptoPriceInt: UILabel!
    @IBOutlet weak var cryptoPriceDecimal: UILabel!
    @IBOutlet weak var holdingView: UIView!
    @IBOutlet weak var cryptosAvaialble: UILabel!
    @IBOutlet weak var balanceInToken: UILabel!
    @IBOutlet weak var balanceInUSD: UILabel!
    @IBOutlet weak var cryptoImage: UIImageView!
   
    
    var viewModel: CryptoDetailsViewModel!

    
    
    init(viewModel: CryptoDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "CryptoDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
    
    func setupInterface() {
        self.cryptoName.text = viewModel.cryptoPrice.title
        let price = viewModel.cryptoPrice.currentPriceInUSD
        if price.contains(".") {
            self.cryptoPriceInt.text = "$" + price.components(separatedBy: ".")[0]
            self.cryptoPriceDecimal.text = "." + price.components(separatedBy: ".")[1]
        }
        else {
            self.cryptoPriceInt.text = "$" + price
            self.cryptoPriceDecimal.text = ".00"
        }
        
        self.cryptosAvaialble.text = "Availiabe \(viewModel.cryptoHolding.title)"
        self.balanceInToken.text = "\(viewModel.cryptoHolding.currentBalanceInToken) \(viewModel.cryptoHolding.title)"
        self.balanceInUSD.text = "$\(viewModel.cryptoHolding.currentBalanceInUSD)"
        
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        
        guard let url = URL(string:  viewModel.cryptoPrice.logo) else { return }
        
        if viewModel.cryptoHolding.title == "BTC" {
            self.cryptoImage.image = UIImage(named: "bitcoin")
            self.cryptoLogo.image = UIImage(named: "bitcoin")
        }
        else {
            self.cryptoImage.sd_setImage(with: url)
            self.cryptoLogo.sd_setImage(with: url)
        }
        
        self.cryptoImage.layer.cornerRadius = self.cryptoImage.frame.height/2
        self.cryptoImage.layer.masksToBounds = true
        
        self.cryptoLogo.layer.cornerRadius = self.cryptoLogo.frame.height/2
        self.cryptoLogo.layer.masksToBounds = true
        
        
        self.holdingView.layer.cornerRadius = 4
        self.holdingView.layer.borderWidth = 0.4
        self.holdingView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        

            
    }
    
    @IBAction func backButtonTapped(sender: Any) {
        self.dismiss(animated: false)
    }

}
