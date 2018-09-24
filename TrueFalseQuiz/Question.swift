import Foundation

struct Question {
    var text: String
    var answer: Character
    var url: String
}

var questions: [Question] = [
    Question(text: "カレーが日本に登場した頃のレシピには、エビや鶏肉の他、カエルも具にするよう記載されていた",
             answer: "⭕",
             url: "http://kerokero-info.com/2015/12/03/post-137/"),

    Question(text: "美味しいみかんは皮と実が離れている",
             answer: "❌",
             url: "http://kerokero-info.com/2016/02/13/post-691/"),
    
    Question(text: "ピーマンとパプリカの違いは「重さ」である",
             answer: "❌",
             url: "http://kerokero-info.com/2016/10/09/post-2383/"),

    Question(text: "そばは音を立てて食べることでカロリー摂取を抑えることができる",
             answer: "❌",
             url: "http://kerokero-info.com/2016/11/16/post-2571/"),

    Question(text: "パフェとサンデーの違いは「入れる容器」である",
             answer: "❌",
             url: "http://kerokero-info.com/2016/11/16/post-2571/"),
    ]
