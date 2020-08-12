import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var mainCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavBar()
        self.setupFeedCollectionView()
        self.navigationController?.navigationItem.title = "Home"
        self.setupStoryCollectionView()
    }
    
    func setupStoryCollectionView() {
        self.mainCollectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerStory")
    }
    
    func setupNavBar() {
        self.navigationController?.clear()
        let titleLabel = UILabel()
        titleLabel.text = "Instagram"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.sizeToFit()
        self.navigationController?.navigationBar.topItem?.titleView = titleLabel
        
        let messageButton = UIButton(type: .system)
        messageButton.setImage(UIImage(named: "shareNav")?.withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.frame = CGRect(x: 0, y: 0, width: 20, height: 30)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: messageButton)
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.customView = messageButton
        navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
        
        let cameraBtn = UIButton(type: .system)
        cameraBtn.setImage(UIImage(named: "camera")?.withRenderingMode(.alwaysOriginal), for: .normal)
        cameraBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 30)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cameraBtn)
        let leftBarButtonItem = UIBarButtonItem()
        leftBarButtonItem.customView = cameraBtn
        navigationItem.setLeftBarButtonItems([leftBarButtonItem], animated: true)
    }
    
    func setupFeedCollectionView() {
        self.mainCollectionView.delegate = self
        self.mainCollectionView.dataSource = self
        self.mainCollectionView.register(UINib(nibName: "FeedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "feedCell")
        let mainCollectionViewLayout = UICollectionViewFlowLayout()
        self.mainCollectionView.setCollectionViewLayout(mainCollectionViewLayout, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.mainCollectionView.dequeueReusableCell(withReuseIdentifier: "feedCell", for: indexPath) as? FeedCollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.mainCollectionView.frame.width, height: 400.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                let header = self.mainCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerStory", for: indexPath) as! HeaderCollectionReusableView
                header.backgroundColor = .white
                return header
            default:
                return UICollectionReusableView()
        }
    }
}
