import UIKit

class QuestionViewController: UIViewController {

    var questionIndex: Int = 0
    var answers: [Answer] = []
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!

    @IBAction func TFButtonTapped(_ sender: UIButton) {
        let currentAnswer = Character((sender.titleLabel?.text)!)
        let currentEvaluation = (currentAnswer == questions[questionIndex].answer)
        answers.append(
            Answer(text: currentAnswer, evaluation: currentEvaluation)
        )
        nextQuestion()
    }
    
    func updateQuestion() {
        // 問題文をアップデート
        problemLabel.text = questions[questionIndex].text
        
        // プログレスバーを更新
        let currentProgress = Float(questionIndex)/Float(questions.count)
        progressView.setProgress(currentProgress, animated: true)
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateQuestion()
        } else {
            performSegue(withIdentifier: "ToResult", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToResult" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.answers = self.answers
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
