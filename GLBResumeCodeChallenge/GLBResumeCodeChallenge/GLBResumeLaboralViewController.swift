//
//  GLBResumeLaboralViewController.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando Flores Gutierrez on 6/20/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

let kLaboralCellNibName = "GLBResumeLaboralTableViewCell"
let kLaboralTableViewAId = "laboralTableViewAId"
let kLaboralTitle = "Laboral History"

class GLBResumeLaboralViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView?

    var jobs = [GLBResumeHomeSection.GLBResumeJob]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = NSLocalizedString(kLaboralTitle, comment: "")

        tableView?.estimatedRowHeight = 200
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.register(UINib(nibName: kLaboralCellNibName, bundle: nil), forCellReuseIdentifier: kLaboralCellNibName)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.accessibilityIdentifier = kLaboralTableViewAId
    }
}

extension GLBResumeLaboralViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return jobs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kLaboralCellNibName, for: indexPath) as? GLBResumeLaboralTableViewCell else { return UITableViewCell() }

        let job = jobs[indexPath.row]

        cell.configureCellWith(job: job)

        return cell
    }
}
