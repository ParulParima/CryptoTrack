//
//  CryptoListViewController.swift
//  CryptoTrack
//
//  Created by user229653 on 10/29/22.
//

import UIKit

class CryptoListViewController: UIViewController {
    
    @IBOutlet weak var cryptoListTableView: UITableView!
    
    var viewModel: CryptoListViewModel!
    weak var navigator: CryptoListCoordinator?
    var navigateBackClosure: ((CryptoPriceEntity, CryptoHoldingEntity) -> Void)!
    
    init(viewModel: CryptoListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "CryptoListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchStockData() {
            DispatchQueue.main.async {
                self.cryptoListTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
    
    func setupInterface() {
        self.cryptoListTableView.dataSource = self
        self.cryptoListTableView.delegate = self
        self.cryptoListTableView.showsVerticalScrollIndicator = false
        self.cryptoListTableView.register(CryptoListTableViewCell.nib(), forCellReuseIdentifier: CryptoListTableViewCell.identifier)
    }
}

extension CryptoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cryptoData?.cryptoPrices.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoListTableViewCell.identifier, for: indexPath) as! CryptoListTableViewCell
        cell.setup(cryptoPrice: (viewModel.cryptoData?.cryptoPrices[indexPath.row])!, cryptoAbb: (viewModel.cryptoData?.cryptoHoldings[indexPath.row])!.title)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension CryptoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
