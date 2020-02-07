//
//  GamesTableViewController.swift
//  TestSearch
//
//  Created by Mario Azevedo on 03/02/2020.
//  Copyright © 2020 AppWeleuc Inc. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire
import SwiftyJSON

enum selectedScope: Int {
    case All = 0
    case appstore = 1
    case socialmedia = 2
    case jailbreak = 3
    case games = 4
    
    
}



class GamesTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    var arr_category_id = [String]()
    var arr_category_name = [String]()
    var arr_category_image = [String]()
    
    var arr_category_screen1 = [String]()
    var arr_category_screen2 = [String]()
    var arr_category_screen3 = [String]()
    
    var arr_category_url = [String]()
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .white
        self.searchBarSetup()
        
        self.tableView.reloadData()
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
               
        self.navigationController?.navigationBar.tintColor = UIColor.white
               
        UIView.animate(withDuration: 0.1, animations: {
        self.navigationController?.navigationBar.alpha = 1
            }, completion: nil)
        
         
        
        

       let myUrl2 = "https://appweleux.com/api001.json"
        
        Alamofire.request(myUrl2, method: .get).responseJSON { (myresponse) in
            
            switch myresponse.result{
                
            case .success:
                print(myresponse.result)
                
                let myresult = try? JSON(data: myresponse.data!)
               // print(myresult)
                
                
                let resultArray = myresult!["category"]
                
                self.arr_category_id.removeAll()
                self.arr_category_name.removeAll()
                
                
                for i in resultArray.arrayValue {
                    
                    let cat_id = i["cat_id"].stringValue
                    self.arr_category_id.append(cat_id)
                    
                    let category_name = i["category_name"].stringValue
                    self.arr_category_name.append(category_name)
                    
                    let category_image = i["category_image"].stringValue
                    self.arr_category_image.append(category_image)
                    
                    let category_screen1 = i["category_screen1"].stringValue
                    self.arr_category_screen1.append(category_screen1)
                    
                    let category_screen2 = i["category_screen2"].stringValue
                    self.arr_category_screen2.append(category_screen2)
                    
                    let category_screen3 = i["category_screen3"].stringValue
                    self.arr_category_screen3.append(category_screen3)
                    
                    let category_url = i["category_url"].stringValue
                    self.arr_category_url.append(category_url)
                    
                }
                
                self.tableView.reloadData()
                break
                
                
            case .failure:
                
                print(myresponse.error!)
                
                break
            }
            
        }
        
        
    }
    
    

    func searchBarSetup() {
        let searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:70))
        searchBar.showsScopeBar = false
        searchBar.placeholder = "Search any app "
        searchBar.scopeButtonTitles = ["All","AppStore","Social Media ","Jailbreak ","Games"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.white
        searchBar.tintColor = UIColor.black
        searchBar.backgroundColor = UIColor.white
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.tableView.tableHeaderView = searchBar
    }
    
    // MARK: - search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            return // nao sei como fazer
        }else {
            filterTableView(ind: searchBar.selectedScopeButtonIndex, text: searchText)
        }
        
        self.tableView.reloadData()
    }
    
    func filterTableView(ind:Int,text:String) {
        switch ind {
        
       // nao sei como fazer
       
        default:
            print("no type")
        }
    }
    
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_category_id.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        
       
        
      //  cell.nameLbl.text = model.imageName
        
      //  cell.imgView.image = UIImage(named: model.imageName)
        
        print("INDEX PATH: \(indexPath.row)")
       
        cell.imgView?.sd_setImage(with: URL(string: arr_category_image[indexPath.row]))
        cell.imgView.layer.cornerRadius = view.frame.height / 2
        cell.imgView.clipsToBounds = true
        cell.imgView.layer.cornerRadius = 10.0
        
        cell.ImgSigned?.sd_setImage(with: URL(string: "https://api.appweleux.com/AppWeleux/App/Sections/Signed"))
        
        cell.screen1?.sd_setImage(with: URL(string: arr_category_screen1[indexPath.row]))
        cell.screen1.clipsToBounds = true
        cell.screen1.layer.cornerRadius = 6.0
        cell.screen1.contentMode = .scaleAspectFill
        
        cell.screen2?.sd_setImage(with: URL(string: arr_category_screen2[indexPath.row]))
        cell.screen2.clipsToBounds = true
        cell.screen2.layer.cornerRadius = 6.0
        cell.screen2.contentMode = .scaleAspectFill
        
        cell.screen3?.sd_setImage(with: URL(string: arr_category_screen3[indexPath.row]))
        cell.screen3.clipsToBounds = true
        cell.screen3.layer.cornerRadius = 6.0
        cell.screen3.contentMode = .scaleAspectFill
        
        cell.nameApp.text = arr_category_name[indexPath.row]
        cell.section.text = NSLocalizedString("Games", comment: "")
        
        cell.GetLabel.tag = indexPath.row
        cell.GetLabel.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)
        
        
        
        
        return cell
    }
    
    
    @objc
    func rowButtonWasTapped(sender:UIButton){
        
         UIApplication.shared.open(URL(string: "\(self.arr_category_url[sender.tag])")! as URL, options: [:], completionHandler: nil)
       
    }

           
}



 

