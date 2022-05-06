import Foundation
import UIKit
import PureLayout


class MovieDetailsViewController: UIViewController {
    
    let percentage = "76%"
    let movieName = "Iron man"
    let year = "(2008)"
    let releaseDate = "05/02/2008 (US)"
    let genre = "Action, Science Fiction, Adventure"
    let duration = "2h 6m"
    let summary = "After beeing held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil."
    
    var scrollView: UIScrollView!

    let imageView = UIImageView(image: UIImage(named: "2069492 2"))
    let starButton = UIButton()
    let overviewView = UIView()
    
    
    let labelPercentage = UILabel(frame: CGRect(x: 25, y: 200, width: 70, height: 20))
    let labelUsrScore = UILabel()
    let labelName = UILabel()
    let labelYear = UILabel()
    let labelRelDate = UILabel()
    let labelGenre = UILabel()
    let labelDuration = UILabel()
    
    let labelOverview = UILabel()
    let labelSummary = UILabel()
    
    let castView1 = UIView()
    let labelCastView11 = UILabel()
    let labelCastView12 = UILabel()
    
    let castView2 = UIView()
    let labelCastView21 = UILabel()
    let labelCastView22 = UILabel()
    
    let castView3 = UIView()
    let labelCastView31 = UILabel()
    let labelCastView32 = UILabel()
    
    let castView4 = UIView()
    let labelCastView41 = UILabel()
    let labelCastView42 = UILabel()
    
    let castView5 = UIView()
    let labelCastView51 = UILabel()
    let labelCastView52 = UILabel()
    
    let castView6 = UIView()
    let labelCastView61 = UILabel()
    let labelCastView62 = UILabel()
    
    let labelTEST = UILabel()
    
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        addConstraints()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        scrollView.contentSize = view.bounds.size
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let bounds = UIScreen.main.bounds
        imageView.frame.size = CGSize(width: bounds.width, height: bounds.height)
//        scrollView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 0)
    }

    private func buildViews() {
        
        view.backgroundColor = UIColor(red: 10/255, green: 70/255, blue: 110/255, alpha: 1.0)
        
        scrollView = UIScrollView()
        scrollView.backgroundColor = .yellow
        scrollView.autoSetDimension(.width, toSize: screenSize.width)
        scrollView.autoSetDimension(.height, toSize: screenSize.height)
        scrollView.contentSize = CGSize(width: screenSize.width, height: 1500)
        
        
//        imageView.contentMode = .scaleAspectFill
        
        
//        imageView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height * 0.5)
        imageView.autoSetDimension(.width, toSize: screenSize.width)
        imageView.autoSetDimension(.height, toSize: screenSize.height * 0.5)
        
        overviewView.autoSetDimension(.width, toSize: screenSize.width)
        overviewView.autoSetDimension(.height, toSize: screenSize.height * 0.5)
        
        
        
        labelPercentage.text = percentage
        labelPercentage.textColor = .white
        labelPercentage.textAlignment = .center
        labelPercentage.font = UIFont.boldSystemFont(ofSize: 23)
//        labelPercentage.backgroundColor = .brown
        
        labelUsrScore.text = "User Score"
        labelUsrScore.textColor = .white
//        labelUsrScore.backgroundColor = .blue
        
        labelName.text = movieName
        labelName.textColor = .white
        labelName.font = UIFont(name:"HelveticaNeue-Bold", size: 27)
        
        labelYear.text = year
        labelYear.textColor = .white
        labelYear.font = UIFont.systemFont(ofSize: 30)
        labelYear.textAlignment = .center
        
        labelRelDate.text = releaseDate
        labelRelDate.textColor = .white
        labelRelDate.font = UIFont.systemFont(ofSize: 15)
        
        labelGenre.text = genre
        labelGenre.textColor = .white
        labelGenre.font = UIFont.systemFont(ofSize: 15)
        
        labelDuration.text = duration
        labelDuration.textColor = .white
        labelDuration.font = UIFont.boldSystemFont(ofSize: 15)
        
        starButton.isEnabled = true
        starButton.frame.size = CGSize(width: 35, height: 35)
        
        starButton.setBackgroundImage(UIImage(named: "star.circle"), for: .normal)
        starButton.setBackgroundImage(UIImage(named: "star.circle.fill"), for: .selected)
        starButton.setBackgroundImage(UIImage(named: "star.circle.fill"), for: .highlighted)
        
//        starButton.addAction(.init{ _ in
//            print("Button tapped")
//        }, for: .touchUpInside)
        starButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        
        print("proba")
//        starButton.backgroundColor = .darkGray
            
//        starButton.isSelected = true
        
        
        
        
        
        imageView.addSubview(labelPercentage)
        imageView.addSubview(labelUsrScore)
        imageView.addSubview(labelName)
        imageView.addSubview(labelYear)
        imageView.addSubview(labelRelDate)
        imageView.addSubview(labelGenre)
        imageView.addSubview(labelDuration)
        imageView.addSubview(starButton)
        
        
        overviewView.backgroundColor = .white
        
        labelOverview.text = "Overview"
        labelOverview.font = UIFont.systemFont(ofSize: 24, weight: .black)
        labelOverview.textColor = UIColor(red: 12/255, green: 3/255, blue: 69/255, alpha: 1.0)
        
        labelSummary.text = summary
        labelSummary.numberOfLines = 0
        
        let castViewHeight = 75.0
        
        castView1.autoSetDimension(.width, toSize: screenSize.width * 0.2333)
        castView1.autoSetDimension(.height, toSize: castViewHeight)
//        castView1.backgroundColor = .systemYellow
        
        labelCastView11.text = "Don Heck"
        labelCastView12.text = "Characters"
        labelCastView11.font = UIFont.boldSystemFont(ofSize: 17)
        
        castView1.addSubview(labelCastView11)
        castView1.addSubview(labelCastView12)
        
        
        castView2.autoSetDimension(.width, toSize: screenSize.width * 0.2333)
        castView2.autoSetDimension(.height, toSize: castViewHeight)
//        castView2.backgroundColor = .systemYellow
        
        labelCastView21.text = "Jack Kirby"
        labelCastView22.text = "Characters"
        labelCastView21.font = UIFont.boldSystemFont(ofSize: 17)
        
        castView2.addSubview(labelCastView21)
        castView2.addSubview(labelCastView22)
        
        
        castView3.autoSetDimension(.width, toSize: screenSize.width * 0.2333)
        castView3.autoSetDimension(.height, toSize: castViewHeight)
//        castView3.backgroundColor = .systemYellow
    
        labelCastView31.text = "Jon Favreau"
        labelCastView32.text = "Director"
        labelCastView31.font = UIFont.boldSystemFont(ofSize: 17)
    
        castView3.addSubview(labelCastView31)
        castView3.addSubview(labelCastView32)
        
        
        castView4.autoSetDimension(.width, toSize: screenSize.width * 0.2333)
        castView4.autoSetDimension(.height, toSize: castViewHeight)
//        castView4.backgroundColor = .systemYellow
    
        labelCastView41.text = "Don Heck"
        labelCastView42.text = "Screenplay"
        labelCastView41.font = UIFont.boldSystemFont(ofSize: 17)
    
        castView4.addSubview(labelCastView41)
        castView4.addSubview(labelCastView42)
        
        
        castView5.autoSetDimension(.width, toSize: screenSize.width * 0.2333)
        castView5.autoSetDimension(.height, toSize: castViewHeight)
//        castView5.backgroundColor = .systemYellow
    
        labelCastView51.text = "Jack Marcum"
        labelCastView52.text = "Screenplay"
        labelCastView51.font = UIFont.boldSystemFont(ofSize: 17)
    
        castView5.addSubview(labelCastView51)
        castView5.addSubview(labelCastView52)
        
        
        castView6.autoSetDimension(.width, toSize: screenSize.width * 0.2333)
        castView6.autoSetDimension(.height, toSize: castViewHeight)
//        castView6.backgroundColor = .systemYellow
    
        labelCastView61.text = "Matt Holloway"
        labelCastView62.text = "Screenplay"
        labelCastView61.font = UIFont.boldSystemFont(ofSize: 17)
    
        castView6.addSubview(labelCastView61)
        castView6.addSubview(labelCastView62)
        
        
        
        
        
        
        
        
        labelTEST.text = "TEST LABEL"
        labelTEST.font = UIFont.systemFont(ofSize: 24, weight: .black)
        
        
        
        
        overviewView.addSubview(labelOverview)
        overviewView.addSubview(labelSummary)
        
        overviewView.addSubview(castView1)
        overviewView.addSubview(castView2)
        overviewView.addSubview(castView3)
        overviewView.addSubview(castView4)
        overviewView.addSubview(castView5)
        overviewView.addSubview(castView6)
        
        overviewView.addSubview(labelTEST)
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(overviewView)
        
        view.addSubview(scrollView)
    }
    
    private func addConstraints() {
        
        scrollView.autoPinEdge(toSuperviewSafeArea: .top, withInset: 0)
        scrollView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 0)
        
//        IMAGEVIEW
        
        imageView.autoPinEdge(toSuperviewSafeArea: .top, withInset: 0)
        
        labelUsrScore.autoPinEdge(.leading, to: .trailing, of: labelPercentage, withOffset: 0)
        labelUsrScore.autoPinEdge(toSuperviewEdge: .top, withInset: 200)
        
        labelName.autoPinEdge(.leading, to: .leading, of: imageView, withOffset: 20)
        labelName.autoPinEdge(.top, to: .bottom, of: labelPercentage, withOffset: 20)
        
        labelYear.autoPinEdge(.leading, to: .trailing, of: labelName, withOffset: 5)
        labelYear.autoPinEdge(.top, to: .top, of: labelName)
        
        labelName.autoMatch(.height, to: .height, of: labelYear)
        
        labelRelDate.autoPinEdge(.top, to: .bottom, of: labelName, withOffset: 20)
        labelRelDate.autoPinEdge(.leading, to: .leading, of: labelName)
        
        labelGenre.autoPinEdge(.top, to: .bottom, of: labelRelDate, withOffset: 5)
        labelGenre.autoPinEdge(.leading, to: .leading, of: labelName)
        
        labelDuration.autoPinEdge(.leading, to: .trailing, of: labelGenre, withOffset: 10)
        labelDuration.autoPinEdge(.top, to: .bottom, of: labelRelDate, withOffset: 5)
        
        starButton.autoPinEdge(.leading, to: .leading, of: labelName)
        starButton.autoPinEdge(.top, to: .bottom, of: labelGenre, withOffset: 20)
        starButton.autoSetDimensions(to: CGSize(width: 35, height: 35))
        
        
        
//        OVERVIEW
        
        overviewView.autoPinEdge(.top, to: .bottom, of: imageView)
        overviewView.autoPinEdge(.leading, to: .leading, of: scrollView)
        
        labelOverview.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 23)
        labelOverview.autoPinEdge(.top, to: .top, of: overviewView, withOffset: 25)
        
        labelSummary.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        labelSummary.autoPinEdge(.top, to: .bottom, of: labelOverview, withOffset: 15)
        labelSummary.autoSetDimension(.width, toSize: screenSize.width - 2*25)
        
        castView1.autoPinEdge(toSuperviewSafeArea: .leading, withInset: screenSize.width * 0.05)
        castView1.autoPinEdge(.top, to: .bottom, of: labelSummary, withOffset: 30)
        
        labelCastView11.autoPinEdge(.top, to: .top, of: castView1)
        labelCastView12.autoPinEdge(.leading, to: .leading, of: castView1)
        labelCastView12.autoPinEdge(.top, to: .bottom, of: labelCastView11, withOffset: 10)
        labelCastView12.autoPinEdge(.leading, to: .leading, of: castView1)
        
        castView2.autoPinEdge(.leading, to: .trailing, of: castView1, withOffset: screenSize.width * 0.07)
        castView2.autoPinEdge(.top, to: .bottom, of: labelSummary, withOffset: 30)
        
        labelCastView21.autoPinEdge(.top, to: .top, of: castView2)
        labelCastView22.autoPinEdge(.leading, to: .leading, of: castView2)
        labelCastView22.autoPinEdge(.top, to: .bottom, of: labelCastView21, withOffset: 10)
        labelCastView22.autoPinEdge(.leading, to: .leading, of: castView2)
        
        castView3.autoPinEdge(.leading, to: .trailing, of: castView2, withOffset: screenSize.width * 0.07)
        castView3.autoPinEdge(.top, to: .bottom, of: labelSummary, withOffset: 30)
        
        labelCastView31.autoPinEdge(.top, to: .top, of: castView3)
        labelCastView32.autoPinEdge(.leading, to: .leading, of: castView3)
        labelCastView32.autoPinEdge(.top, to: .bottom, of: labelCastView31, withOffset: 10)
        labelCastView32.autoPinEdge(.leading, to: .leading, of: castView3)
        
        castView4.autoPinEdge(toSuperviewSafeArea: .leading, withInset: screenSize.width * 0.05)
        castView4.autoPinEdge(.top, to: .bottom, of: castView1, withOffset: 20)
        
        labelCastView41.autoPinEdge(.top, to: .top, of: castView4)
        labelCastView42.autoPinEdge(.leading, to: .leading, of: castView4)
        labelCastView42.autoPinEdge(.top, to: .bottom, of: labelCastView41, withOffset: 10)
        labelCastView42.autoPinEdge(.leading, to: .leading, of: castView4)
        
        castView5.autoPinEdge(.leading, to: .trailing, of: castView4, withOffset: screenSize.width * 0.07)
        castView5.autoPinEdge(.top, to: .bottom, of: castView1, withOffset: 20)
        
        labelCastView51.autoPinEdge(.top, to: .top, of: castView5)
        labelCastView52.autoPinEdge(.leading, to: .leading, of: castView5)
        labelCastView52.autoPinEdge(.top, to: .bottom, of: labelCastView51, withOffset: 10)
        labelCastView52.autoPinEdge(.leading, to: .leading, of: castView5)
        
        castView6.autoPinEdge(.leading, to: .trailing, of: castView5, withOffset: screenSize.width * 0.07)
        castView6.autoPinEdge(.top, to: .bottom, of: castView1, withOffset: 20)
        
        labelCastView61.autoPinEdge(.top, to: .top, of: castView6)
        labelCastView62.autoPinEdge(.leading, to: .leading, of: castView6)
        labelCastView62.autoPinEdge(.top, to: .bottom, of: labelCastView61, withOffset: 10)
        labelCastView62.autoPinEdge(.leading, to: .leading, of: castView6)
        
        
        labelTEST.autoPinEdge(.top, to: .bottom, of: labelSummary, withOffset: 1000)
        labelTEST.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        
    }
    
    @objc func didButtonClick() {
            print("funkcija")
//            if(starButton.isSelected){
//                starButton.isSelected = false;
//                print("KLIK")
//            }
//            else {
//                starButton.isSelected = true;
//                print("KLIK 2")
//            }
        overviewView.backgroundColor = .blue
    }
    
}



//  PITANJA
// scrollView?, jel treba content view?
// button ne radi
// pametniji nacin castViewa?
// frame == size?
