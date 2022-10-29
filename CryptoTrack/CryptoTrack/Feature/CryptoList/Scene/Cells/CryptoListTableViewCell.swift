//
//  CryptoListTableViewCell.swift
//  CryptoTrack
//
//  Created by user229653 on 10/29/22.
//

import UIKit
import SDWebImageSVGCoder

class CryptoListTableViewCell: UITableViewCell {

    @IBOutlet weak var cryptoLogo: UIImageView!
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var cryptoValue: UILabel!
    @IBOutlet weak var cryptoVariation: UILabel!
    @IBOutlet weak var cryptoCode: UILabel!
    
    static let identifier = "CryptoListTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        self.layer.borderWidth = 0.4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    static func nib() -> UINib {
        return UINib(nibName: "CryptoListTableViewCell", bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setup(cryptoPrice: CryptoPriceEntity, cryptoAbb: String) {

        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        
        self.cryptoName.text = cryptoPrice.title
        self.cryptoCode.text = cryptoAbb
        
        self.cryptoValue.text = "$" + cryptoPrice.currentPriceInUSD
        guard let url = URL(string:  cryptoPrice.logo) else { return }
        
        if cryptoAbb == "BTC" {
            self.cryptoLogo.image = UIImage(named: "bitcoin")
        }
        else {
            self.cryptoLogo.sd_setImage(with: url)
        }
        self.cryptoLogo.layer.cornerRadius = self.cryptoLogo.frame.height/2
        self.cryptoLogo.layer.masksToBounds = true
        
        self.cryptoVariation.text = "20"
        
    }
    
    
}
