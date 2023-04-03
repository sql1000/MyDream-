import UIKit

class YorumlamaViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func generateText(_ sender: Any) {
        guard let inputText = inputTextField.text else { return }
        generateTextFromInput(inputText)
    }
    
    func generateTextFromInput(_ inputText: String) {
        func generateTextFromInput(_ inputText: String) {
            let headers = [
                "Content-Type": "application/json",
                "Authorization": "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"
            ]
            
            let parameters = [
                "prompt": inputText,
                "temperature": 0.7,
                "max_tokens": 100,
            ] as [String : Any]
            
            guard let postData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                print("Hata: Veri dönüştürme hatası")
                return
            }
            
            let request = NSMutableURLRequest(url: NSURL(string: "https://api.openai.com/v1/engines/davinci-codex/completions")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = postData as Data
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error!)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse!)
                    if let result = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any],
                       let choices = result["choices"] as? [[String: Any]],
                       let text = choices[0]["text"] as? String {
                        DispatchQueue.main.async {
                            self.outputLabel.text = text
                        }
                    }
                }
            })
            
            dataTask.resume()
        }
    }
    
}

