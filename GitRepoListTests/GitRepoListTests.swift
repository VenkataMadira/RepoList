//
//  GitRepoListTests.swift
//  GitRepoListTests
//
//  Created by Venkat Madira on 12/11/2019.
//  Copyright © 2019 Venkat Madira. All rights reserved.
//

import XCTest
@testable import GitRepoList

class GitRepoListTests: XCTestCase {
    var GitRepoTableVC: GitRepoListTableViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.GitRepoTableVC = storyboard.instantiateViewController(withIdentifier: "GitRepoListTableViewController") as? GitRepoListTableViewController
        self.GitRepoTableVC.loadView()
        self.GitRepoTableVC.viewDidLoad()
    
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasATableView() {
        XCTAssertNotNil(GitRepoTableVC.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(GitRepoTableVC.tableView.delegate)
    }
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(GitRepoTableVC.conforms(to: UITableViewDelegate.self))
        
    }
    func testTableViewHasDataSource() {
        XCTAssertNotNil(GitRepoTableVC.tableView.dataSource)
    }
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(GitRepoTableVC.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(GitRepoTableVC.responds(to: #selector(GitRepoTableVC.numberOfSections(in:))))
        //for below test case need some sample data
        //XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView.numberOfRows(inSection:))))
        //XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView.cellForRow(at:))))
    }
    func testTableViewCellHasReuseIdentifier() {
        let cell = GitRepoTableVC.tableView(GitRepoTableVC.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? TableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "Cell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
