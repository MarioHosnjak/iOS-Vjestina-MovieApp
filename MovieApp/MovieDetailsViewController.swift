import Foundation
import UIKit
import PureLayout

class ViewController: UIViewController {

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
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        addConstraints()
        
    }

    private func buildViews() {
        
        view.backgroundColor = UIColor(red: 10/255, green: 70/255, blue: 110/255, alpha: 1.0)
        
        
//        imageView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height * 0.5)
        imageView.autoSetDimension(.width, toSize: screenSize.width)
        imageView.autoSetDimension(.height, toSize: screenSize.height * 0.5)
        
        overviewView.autoSetDimension(.width, toSize: screenSize.width)
        overviewView.autoSetDimension(.height, toSize: screenSize.height * 0.5)
        
        
        
        labelPercentage.text = "76%"
        labelPercentage.textColor = .white
        labelPercentage.textAlignment = .center
        labelPercentage.font = UIFont.boldSystemFont(ofSize: 23)
//        labelPercentage.backgroundColor = .brown
        
        labelUsrScore.text = "User Score"
        labelUsrScore.textColor = .white
//        labelUsrScore.backgroundColor = .blue
        
        labelName.text = "Iron man"
        labelName.textColor = .white
        labelName.font = UIFont(name:"HelveticaNeue-Bold", size: 27)
        
        labelYear.text = "(2008)"
        labelYear.textColor = .white
        labelYear.font = UIFont.systemFont(ofSize: 30)
        labelYear.textAlignment = .center
        
        labelRelDate.text = "05/02/2008 (US)"
        labelRelDate.textColor = .white
        labelRelDate.font = UIFont.systemFont(ofSize: 15)
        
        labelGenre.text = "Action, Science Fiction, Adventure"
        labelGenre.textColor = .white
        labelGenre.font = UIFont.systemFont(ofSize: 15)
        
        labelDuration.text = "2h 6m"
        labelDuration.textColor = .white
        labelDuration.font = UIFont.boldSystemFont(ofSize: 15)
        
        starButton.isEnabled = true
        starButton.frame.size = CGSize(width: 35, height: 35)
        
        starButton.setBackgroundImage(UIImage(named: "star.circle"), for: .normal)
        starButton.setBackgroundImage(UIImage(named: "star.circle.fill"), for: .selected)
        starButton.setBackgroundImage(UIImage(named: "star.circle.fill"), for: .highlighted)
        
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
        
        labelSummary.text = "After beeing held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil."
        labelSummary.numberOfLines = 0
        
        
        
        
        
        
        
        overviewView.addSubview(labelOverview)
        overviewView.addSubview(labelSummary)
        
        view.addSubview(imageView)
        view.addSubview(overviewView)
    }
    
    private func addConstraints() {
        
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
        overviewView.autoPinEdge(.leading, to: .leading, of: view)
        
        labelOverview.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 23)
        labelOverview.autoPinEdge(.top, to: .top, of: overviewView, withOffset: 25)
        
        labelSummary.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        labelSummary.autoPinEdge(.top, to: .bottom, of: labelOverview, withOffset: 15)
        labelSummary.autoSetDimension(.width, toSize: screenSize.width - 2*25)
        
        
    }
    
    @objc func didButtonClick() {
            print("funkcija")
    //        if(starButton.isSelected){
    //            starButton.isSelected = false;
    //            print("KLIK")
    //        }
    //        if(starButton.isSelected == false){
    //            starButton.isSelected = true;
    //            print("KLIK 2")
    //        }
        overviewView.backgroundColor = .blue
    }
    
}
