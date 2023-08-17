//
//  HomeViewController.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import UIKit
import Network

class HomeViewController: UIViewController {
    
    var moviesTableView: UITableView = UITableView()
    private let nibCell = "MovieTableViewCell"
    private let cellId = "CellId"
    
    private var isLoading = false
    
    private let presenter: HomePresenterProtocol?
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
           
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    var listMovies: [MovieModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
        setupConstraints()
        callWebService()
    }
    

    private func setupConstraints() {
        
    }
    
    private func setupTableView() {
        view.backgroundColor = .white
        
        self.view.addSubview(moviesTableView)
        moviesTableView.translatesAutoresizingMaskIntoConstraints = false
        moviesTableView.fillSuperview()
        self.moviesTableView.backgroundColor = .white
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        let nib = UINib(nibName: nibCell, bundle: nil)
        moviesTableView.register(nib, forCellReuseIdentifier: cellId)
//        moviesTableView.separatorStyle = .none
        
    }
    
    private func setupView() {
        view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
        
        title = "Rimac Movies"
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func callWebService() {
        presenter?.startGetMovies()
    }
    
    private func loadMoreData() {
        if !self.isLoading {
            self.isLoading = true
            presenter?.loadMoreData()
            
        }
            
        
    }

}

// MARK: - Table view data source
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MovieTableViewCell else{
            return UITableViewCell()
        }
        let data = listMovies?[indexPath.row]
        cell.data = data
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offSetY + scrollView.frame.size.height > contentHeight) && !isLoading  {
            loadMoreData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        guard let item = listMovies?[indexPath.row] else { return }
        presenter?.moveToDetailView(data: item)
    }
    
}


extension HomeViewController: HomeViewProtocol {
    
    func reloadMoviesTable(withMovies data: [MovieModel]?) {
        self.listMovies = data
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
    
    
    func saveMovie(movie: MovieModel) {
        
    }
    
    
    func reloadMoreMovies(withMovies data: [MovieModel]?) {
        self.isLoading = false
        self.listMovies?.append(contentsOf: data!)
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
    
}

extension HomeViewController: NetworkCheckerProtocol {
    
    func statusDidChange(status: NWPath.Status) {
        if status == .satisfied {
            print("Connected")
        } else  if status == .unsatisfied {
            print("Not Connected")
        }
    }
    
    
}
