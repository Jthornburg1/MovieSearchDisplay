//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var goButton: UIButton!
    
    var searchViewModel = SearchViewModel()
    
    private struct Constants {
        static let title = "Movie Search"
        static let cellId = "SearchViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.title
        configureTableView()
        searchBar.delegate = self
        goButton.isEnabled = false
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
    }
    
    @IBAction func didTapGo(_ sender: Any) {
        searchBar.resignFirstResponder()
        fetchMovies(with: searchBar.text)
    }
    
    private func fetchMovies(with searchterm: String?) {
        guard let searchterm = searchterm else { return }
        searchViewModel.query(term: searchterm) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId) as? MovieSearchCell else {
            return UITableViewCell()
        }
        let movieViewModel = MovieCellViewModel(movie: searchViewModel.movies[indexPath.row])
        cell.configureFor(movieViewModel)
        return cell
    }
    
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        fetchMovies(with: searchBar.text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        goButton.isEnabled = searchBar.text != ""
    }
    
}
