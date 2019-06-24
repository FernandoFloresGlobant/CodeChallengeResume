//
//  GLBResumeHomeViewController.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando Flores Gutierrez on 6/20/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

let kHomeCellNibName = "GLBResumeHomeTableViewCell"
let kHomeTableViewAId = "homeTableViewAId"
let kHomeTitle = "My Resume"
let kErrorMessage = "Error Message"
let kErrorTitle = "Error Title"
let kErrorOk = "Ok"

class GLBResumeHomeViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView?

    var sections = [GLBResumeHomeSection]()
    private var provider = GLBResumeSectionsProvider()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.title = NSLocalizedString(kHomeTitle, comment: "")

        provider.viewController = self
        
        tableView?.estimatedRowHeight = 50
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.register(UINib(nibName: kHomeCellNibName, bundle: nil), forCellReuseIdentifier: kHomeCellNibName)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.accessibilityIdentifier = kHomeTableViewAId
        
        GLBResumeAPIClient().request(endpoint: .info, httpMethod: .GET) { result in
            
            self.provider.handleResponse(response: result)
        }
    }

    func showErrorMessage(message: String)
    {
        let title = NSLocalizedString(kErrorTitle, comment: "")
        let ok = NSLocalizedString(kErrorOk, comment: "")
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: ok, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension GLBResumeHomeViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kHomeCellNibName, for: indexPath) as? GLBResumeHomeTableViewCell else { return UITableViewCell() }
        
        if let type = SectionType(rawValue: indexPath.row)
        {
            let name = provider.nameForSectionWith(type: type, homeSections: sections)
            cell.configureCellWith(text: name)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let type = SectionType(rawValue: indexPath.row)
        {
            provider.prepareDetailForSectionWith(type: type, homeSections: sections)
        }
    }
}
