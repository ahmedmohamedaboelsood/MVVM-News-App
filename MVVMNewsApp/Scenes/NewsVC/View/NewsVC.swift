//
//  NewsVC.swift
//  MVVMNewsApp
//
//  Created by 2B on 29/10/2023.
//

import UIKit

class NewsVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var newsTableView: UITableView!
    
    //MARK: - Variables
    
    var articlesViewModel : ArticleListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Methods
    
    private func setupUI(){
        setupNavigationController()
        setupNewsTableview()
        webServices()
    }
    
    private func setupNavigationController(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesBackButton = true
        title = "Good News"
    }
    
    private func setupNewsTableview(){
        newsTableView.register(UINib(nibName: ArticleTableViewCell.ID, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.ID)
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    private func webServices(){
        WebServices.shared.getNews(url: URL(string:newsApi)!) {
            [weak self] data in
            guard let self = self  else {return}
            switch data{
            case .success(let data):
                if let data = data {
                    self.articlesViewModel = ArticleListViewModel(articlesList: data)
                    DispatchQueue.main.async{
                        self.newsTableView.reloadData()
                    }
                }else{
                    print("Error")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension NewsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesViewModel == nil ? 0 : articlesViewModel.numberOfSections(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.ID) as? ArticleTableViewCell else {
            fatalError("Cannot found cell")
        }
        let article = articlesViewModel.articleAtIndex(indexPath.row)
        cell.setupCell(article)
        return cell
    }
    
    
}
