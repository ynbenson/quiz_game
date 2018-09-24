import UIKit

class ResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var answers: [Answer] = []
    var totalCorrectAnswer = 0
    var resultMessage = ""
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var resultOverviewLabel: UILabel!
    @IBOutlet weak var resultDetailLabel: UILabel!
    
    func displayResult() {
        // リザルトの点数とメッセージを決める
        for answer in answers {
            if answer.evaluation { totalCorrectAnswer += 1 }
        }
        
        var resultPercentage = Float(totalCorrectAnswer) / Float(answers.count)
        resultPercentage = round(resultPercentage*100)
        
        if resultPercentage == 100.00 {
            resultMessage = "グッジョブです😚👍"
        } else if resultPercentage >= 90.00 {
            resultMessage = "おしい！あと少しです👏"
        } else if resultPercentage >= 80.00 {
            resultMessage = "物知りなんですね📘"
        } else if resultPercentage >= 40.00 {
            resultMessage = "微妙な結果ですね🤔"
        } else {
            resultMessage = "もっとがんばりましょう🤬🤬🤬"
        }
        
        
        // リザルトを反映
        resultOverviewLabel.text = "総合成績: \(resultPercentage)%"
        resultDetailLabel.text = resultMessage
        
        // 上部バーのBackボタンを隠す
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        displayResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = String(answers[indexPath.row].text) + " : " + questions[indexPath.row].text
        if answers[indexPath.row].evaluation {
            cell.backgroundColor = UIColor(red: 170/255, green: 255/255, blue: 170/255, alpha: 1)
        } else {
            cell.backgroundColor = UIColor(red: 255/255, green: 170/255, blue: 170/255, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルをクリックしたらURLをSafariで開くか聞く
        // まず表示するアラートを作成
        let alert : UIAlertController = UIAlertController(title: "safariを起動", message: "アプリを離れてsafariを起動しても良いですか？", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "はい", style: .default, handler: {
        // YesならURLをSafariで開いてあげる
        (action: UIAlertAction!) -> Void in
        let url = URL(string: questions[indexPath.row].url)!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
            }
        }))
        alert.addAction(UIAlertAction(title: "いいえ", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
