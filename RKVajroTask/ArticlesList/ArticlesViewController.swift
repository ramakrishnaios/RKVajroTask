//
//  ArticalsViewController.swift
//  RKVajroTask
//
//  Created by ramakrishna utti on 30/06/20.
//  Copyright © 2020 ramakrishnautti. All rights reserved.
//

import UIKit
import SDWebImage
class ArticlesViewController: UIViewController {
    @IBOutlet weak var tblArticlesList: UITableView!
    var atricals : ArticlesList?
    override func viewDidLoad(){
        super.viewDidLoad()
        self.configurTable()
        self.getArticlesData()
    }
    func configurTable(){
        self.tblArticlesList.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        self.tblArticlesList.separatorStyle = .none
        self.tblArticlesList.backgroundView?.backgroundColor = UIColor.white
        self.tblArticlesList.backgroundColor = UIColor.white
        self.tblArticlesList.rowHeight = UITableView.automaticDimension
        self.tblArticlesList.dataSource = self
        self.tblArticlesList.delegate = self
    }
    func getArticlesData(){
        ViewModel.getArticles{ [unowned self] (result, error) in
            if let response = result, error == nil{
                self.atricals = response
                DispatchQueue.main.async {
                    self.tblArticlesList.reloadData()
                    self.refreshUI()
                }
            }
            else{
                print(error?.localizedDescription ?? "")
            }
        }
}
    func refreshUI(){
        DispatchQueue.main.async {
            self.tblArticlesList.reloadData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.tblArticlesList.reloadData()
            }
        }
    }
    
}
extension ArticlesViewController: UITableViewDataSource , UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.atricals?.articles?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        cell.selectionStyle = .none
        cell.containerView.layer.cornerRadius = 7
        cell.containerView.clipsToBounds = true
        cell.imgArticle.layer.cornerRadius = 7
        cell.imgArticle.clipsToBounds = true
        let  article = self.atricals?.articles![indexPath.row]
        if let title = article?.title {
            cell.lblTitle.text = title
        }
//        if let imageWidth = article?.image?.width {
//            cell.imgArticle.imageSize?.width = CGFloat(imageWidth)
//        }
//        if let imageHeight = article?.image?.height {
//            cell.imgArticle.imageSize?.height = CGFloat(imageHeight)
//        }
        if let summary_html = article?.summary_html{
            if summary_html != ""{
                cell.constDescriptionHeight.constant = 10
            cell.lblDescription.numberOfLines = 2
            cell.lblDescription.sizeToFit()
            cell.lblDescription.text = summary_html
            }
            else {
                cell.constDescriptionHeight.constant = 0
                cell.lblDescription.text = summary_html
            }
        }
        if let  imgSCR = article?.image?.src{
        cell.imgArticle.sd_setImage(with: URL(string: imgSCR), placeholderImage: UIImage(named: "placeholder"))
            DispatchQueue.main.async {
            cell.imgArticle.layoutSubviews()
            cell.imgArticle.layoutIfNeeded()
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            let webVC = self.storyboard?.instantiateViewController(identifier: "ArticleWebViewController") as! ArticleWebViewController
            let article = self.atricals?.articles?[indexPath.row]
            if let htmlBody = article?.body_html{
            webVC.htmlString = htmlBody
            }
            let navVC = UINavigationController.init(rootViewController: webVC)
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: true, completion: nil)
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

