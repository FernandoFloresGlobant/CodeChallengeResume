//
//  GLBResumeScholarViewController.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando Flores Gutierrez on 6/20/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

let kSchoolCellNibName = "GLBResumeScholarTableViewCell"
let kSchoolTableViewAId = "schoolTableViewAId"
let kSchoolTitle = "Academic History"

class GLBResumeScholarViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView?

    var schools = [GLBResumeHomeSection.GLBResumeSchool]()

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.title = NSLocalizedString(kSchoolTitle, comment: "")
        
        tableView?.estimatedRowHeight = 200
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.register(UINib(nibName: kSchoolCellNibName, bundle: nil), forCellReuseIdentifier: kSchoolCellNibName)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.accessibilityIdentifier = kSchoolTableViewAId
    }
}

extension GLBResumeScholarViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kSchoolCellNibName, for: indexPath) as? GLBResumeScholarTableViewCell else { return UITableViewCell() }
        
        let school = schools[indexPath.row]
        
        cell.configureCellWith(school: school)
      
        return cell
    }
}
