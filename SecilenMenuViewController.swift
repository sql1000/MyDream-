//
//  SecilenMenuViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 31.03.2023.
//

import UIKit
import FirebaseDatabase


class SecilenMenuViewController: UIViewController {
    // RuyaSembol sinifindan array olusturudk
    var sembollerListesi:[RuyaSembol] = [RuyaSembol]()
    
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        navigationItem.title = ""
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Ana Sayfa",
            style: .done,
            target: nil,
            action: nil
        )
        navigationItem.backBarButtonItem?.tintColor = .systemBlue
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
        
        
        // Sinifizdan Objeler olusturduk.
        let sembol1 = RuyaSembol(sembolResim: "at", sembolisim: "At", sembolAnlami: "Arzuları, dilekleri ve ümit edilerek beklenen şeyleri simgeler.")
        let sembol2 = RuyaSembol(sembolResim: "ordek", sembolisim: "Ordek", sembolAnlami: "Sari")
        let sembol3 = RuyaSembol(sembolResim: "timsah", sembolisim: "Timash", sembolAnlami: "dinazor")
        let sembol4 = RuyaSembol(sembolResim: "kedi", sembolisim: "Kedi", sembolAnlami: "Tatlı olmas")
        let sembol5 = RuyaSembol(sembolResim: "ada", sembolisim: "Ada", sembolAnlami: "Kişinin bilgi içinde olmasına rağmen bunu fark edememesini simgeler.")
        let sembol6 = RuyaSembol(sembolResim: "aile", sembolisim: "Aile", sembolAnlami: "Yakın geçmişteki bilinçaltı kayıtlarını anlatır. Atlalar ve çocukluk dönemi değildir.")
        let sembol7 = RuyaSembol(sembolResim: "ajanda", sembolisim: "Ajanda", sembolAnlami: "Planlı olmayı ve planlı haraket etmeyi simgeler.")
        let sembol8 = RuyaSembol(sembolResim: "akbaba", sembolisim: "Akbaba", sembolAnlami: "Başkalarının zayıflıklarından faydalanarak, kazanç elde etmeyi simgeler.")
        let sembol9 = RuyaSembol(sembolResim: "alısveris", sembolisim: "Alışveriş", sembolAnlami: "Gündelik hayatın olağan akışında her gün tekrarlanan rutin işleri ve diğer insanlarla kurulan ilişkileri simgeler.")
        let sembol10 = RuyaSembol(sembolResim: "alkol", sembolisim: "Alkol", sembolAnlami: "İçki içmek kişinin içinde bulunduğu durumu veya olayı unutarak rahatlamak istediğini simgeler.")
        let sembol11 = RuyaSembol(sembolResim: "altın", sembolisim: "Altın", sembolAnlami: "Maddi aleme hayat vereşn şeyleri simgeler.")
        let sembol12 = RuyaSembol(sembolResim: "anahtar", sembolisim: "Anahtar", sembolAnlami: "Kuvvet ve kolaylığı simgeler. Rüyada anlatılan durum ile ilgili kolaylıkla yapılabilme imkanı ve yolu kişinin kendisine verilmiştir.")
        let sembol13 = RuyaSembol(sembolResim: "astronot", sembolisim: "Astronot", sembolAnlami: "Kişinin manevi arayış içerisinde olduğunu simgeler.")
        let sembol14 = RuyaSembol(sembolResim: "ates", sembolisim: "Ateş", sembolAnlami: "Öfkeyi simgeler. Fakat ateşi ihtiyaçlarımızı karşılamak için de kullanırız. Bundan dolayı rüyanın genel durumu dikkate alınarak yorum yapılması gerekir.")
        let sembol15 = RuyaSembol(sembolResim: "atmaca", sembolisim: "Atmaca", sembolAnlami: "İlişkilerde bir noktaya odaklanmayı ve hızlıca harakete geçmeyi simgeler. Rüyasında 'Atmaca' gören kişinin ilişkilerinde tek bir şeye odaklanması ve hızlıca harakete geçmesi gerekir. ")
        let sembol16 = RuyaSembol(sembolResim: "avukat", sembolisim: "Avukat", sembolAnlami: "Özsavunmayı simgeler. Rüya kişinin kendisini savunması gerektiğini anlatabileceği gibi yanlış savunduğunu da gösterebilir. Bundan dolayı rüyanın genel durumu dikkate alınarak yorum yapılması gerekir.")
        let sembol17 = RuyaSembol(sembolResim: "adliye", sembolisim: "Adliye", sembolAnlami: "Adaleti yani kişinin adil olma durumunu simgeler.")
        let sembol18 = RuyaSembol(sembolResim: "adres", sembolisim: "Adres", sembolAnlami: "Kişinin, hangi istikamet üzere olduğunu veya olmasını gerektiğini simgeler.")
        let sembol19 = RuyaSembol(sembolResim: "ağaç", sembolisim: "Ağaç", sembolAnlami: "Geni simgeler.")
        let sembol20 = RuyaSembol(sembolResim: "ağız", sembolisim: "Ağız", sembolAnlami: "Söylenen veya söylenemeyen sözleri, simgeler. Ağız, kişinin anahtarı gibidir. İster açar, ister kilitler.")
        let sembol21 = RuyaSembol(sembolResim: "ağlamak", sembolisim: "Ağlamak", sembolAnlami: "Şifalanmayı simgeler. Fakat bağıra bağıra ağlamak, isyan içinde olmayı ifade eder.")
        let sembol22 = RuyaSembol(sembolResim: "ağrı", sembolisim: "Ağrı", sembolAnlami: "Rüyada görülen ağrı ve kasılma,direnç göstermeyi simgeler.Vücudun hangi bölgesinde ağrı var ise o bölge ile anlatılmak istenen bir şey olduğuna dikkat çeker.")
        let sembol23 = RuyaSembol(sembolResim: "ahtapot", sembolisim: "Ahtapot", sembolAnlami: "Kendini bu dünyaya ait hissedemeyen kişinin, ait hissedebilmek için duyduğu sarılma ihtiyacını simgeler.")
        let sembol24 = RuyaSembol(sembolResim: "ajan", sembolisim: "Ajan", sembolAnlami: "Bir başka insan hakkında bilgi sahibi olmak için, onu gizlice gözetleyen ve araştıran kişiyi simgeler.")
        let sembol25 = RuyaSembol(sembolResim: "akarsu", sembolisim: "Akarsu", sembolAnlami: "İlham yoluyla edinilen bilgi akışını simgeler. Bilginin kişiye, kaynağından geldiğini ifade eder.")
        let sembol26 = RuyaSembol(sembolResim: "akciğer", sembolisim: "Akciğer", sembolAnlami: "Kişinin, yaşadığı ve bulunduğu ortamı simgeler.")
        let sembol27 = RuyaSembol(sembolResim: "akciğerrahatsızlıkları", sembolisim: "Akciğer Rahatsızlıkları", sembolAnlami: "Akciğer rahatsızlıkları, kişinin yaşadığı veya bulunduğu ortamdan mutlu olmaması ya da bulunduğu ortamdaki kişiler tarafından zulüm görmesi ile ilgilidir.")
        let sembol28 = RuyaSembol(sembolResim: "antikaraba", sembolisim: "Antika Araba", sembolAnlami: "Eski zamanlara ait olan değerli yöntemleri simgeler.")
        let sembol29 = RuyaSembol(sembolResim: "akıl", sembolisim: "Akıl", sembolAnlami: "Kalıp düşünceleri ve önyargıları simgeler.")
        let sembol30 = RuyaSembol(sembolResim: "akraba", sembolisim: "Akraba", sembolAnlami: "Genetik bilgi aktarımlarını ya da bilinçaltı aktarımların niteliğini simgeler. Görülen her akraba kişinin bir aktarımını ifade eder.")
        let sembol31 = RuyaSembol(sembolResim: "akrep", sembolisim: "Akrep", sembolAnlami: "Kişinin, savunma mekanizmasını simgeler.")
        let sembol32 = RuyaSembol(sembolResim: "aksesuar", sembolisim: "Aksesuar", sembolAnlami: "Aksesuar üzerindeki semboller dikkate alınarak yorum yapılması gerekir.")
        let sembol33 = RuyaSembol(sembolResim: "akşam", sembolisim: "Akşam", sembolAnlami: "Akşam namazı vakti, kıyam etmeyi ve uyumayı simgeler. Gece farklı yorumalanır. (Bkz.Gece)")
        let sembol34 = RuyaSembol(sembolResim: "aktar", sembolisim: "Aktar", sembolAnlami: "Kişinin şifa arayışı içerisinde olduğunu simgeler.")
        let sembol35 = RuyaSembol(sembolResim: "alim", sembolisim: "Alim", sembolAnlami: "Bilge insanı simgeler. Rüyada görülen alim kişi, hangi konuda ilim sahibi ise rüyayı gören kişinin o konuda özelliğinin aktif olacağını ifade eder. Rüyayı gören kişi sadaka vermeli ve bu özelliği alıp kabul etmelidir.")
        let sembol36 = RuyaSembol(sembolResim: "alkış", sembolisim: "Alkış", sembolAnlami: "Kişinin takdir edilme ve onaylanma isteğini simgeler.")
        let sembol37 = RuyaSembol(sembolResim: "alüminyum", sembolisim: "Alüminyum", sembolAnlami: "Kendini güçlü gibi gösteren zayıf insanları simgeler. Kişinin sahte güç gösterisi yaptığını ifade eder.")
        let sembol38 = RuyaSembol(sembolResim: "alyans", sembolisim: "Alyans", sembolAnlami: "Ortak olma durumunu simgeler. Bu ortaklık, evlilik, amaca ulaşmak için kurulan sözleşme, bir kişiye duyulan bağlılık ya da bağımlılık olabilir.")
        let sembol39 = RuyaSembol(sembolResim: "anaokulu", sembolisim: "Ana Okulu", sembolAnlami: "Kişinin ilk çocukluk dönemindeyaşadığı çevreyi ve karşılaştığı olayları simgeler.")
        let sembol40 = RuyaSembol(sembolResim: "ankakuş", sembolisim: "Anka Kuşu", sembolAnlami: "Yeniden doğuşu simgeler. Hayatınızda bir şey sizin için önemini yitirmişse onu ankaya çevirin.Fakat anka enerjisi önce yanmayı gerektirdiği için sağlıklı giden bir şeyi ankaya çevirmeyin ve ona anka enerjisi yüklemeyin.")
        let sembol41 = RuyaSembol(sembolResim: "anne", sembolisim: "Anne", sembolAnlami: "Rüyayı gören kadın ise; kişinin anneliğini ve anne ile ilgili bilinçaltı kayıtlarını simgeler. Fakat anne tarafından gelen kayıtları da ifade edebilir. Rüyayı gören erkek ise; anne ile ilgili bilinçaltı kayıtlarını ve eşi ile ilgili yapılanmasını ifade eder. Erkek için eş, sevgili, dişil güç, anne kayıtları ile ilgilidir.")
        let sembol42 = RuyaSembol(sembolResim: "anten", sembolisim: "Anten", sembolAnlami: "Duru işiti ve duru görü ile kurulan iletişimi simgeler. Beş duyu organının yardımı olmadan olayları veya durumları algılayabilmeyi ifade eder.")
        let sembol43 = RuyaSembol(sembolResim: "", sembolisim: "Abiye Elbise", sembolAnlami: "Bir olayın veya durumun mutlu sonuçlanmasından dolayı yapılan kutlamayı simgeler.")
        let sembol44 = RuyaSembol(sembolResim: "", sembolisim: "Ab-ı Hayat", sembolAnlami: "İlimi simgeler..")
        let sembol45 = RuyaSembol(sembolResim: "", sembolisim: "Adak", sembolAnlami: "Bir dileğin gerçekleşmesi için adanan şeyleri simgeler. Fakat bu rüyayı gören kişi, dileğinin gerçekleşmesini beklemeden rüyada adadığı şeyi hemen yerine getirmelidir.")
        let sembol46 = RuyaSembol(sembolResim: "", sembolisim: "Regl(Adet Kanı)", sembolAnlami: "Dişilikle ilgili şeyleri simgeler.")
        let sembol47 = RuyaSembol(sembolResim: "", sembolisim: "Ab-ı Hayat Suyu İçmek", sembolAnlami: "İlim almayı ya da ilim alınacağını simgeler.")
        
        sembollerListesi.append(sembol1)
        sembollerListesi.append(sembol2)
        sembollerListesi.append(sembol3)
        sembollerListesi.append(sembol4)
        sembollerListesi.append(sembol5)
        sembollerListesi.append(sembol6)
        sembollerListesi.append(sembol7)
        sembollerListesi.append(sembol8)
        sembollerListesi.append(sembol9)
        sembollerListesi.append(sembol10)
        sembollerListesi.append(sembol11)
        sembollerListesi.append(sembol12)
        sembollerListesi.append(sembol13)
        sembollerListesi.append(sembol14)
        sembollerListesi.append(sembol15)
        sembollerListesi.append(sembol16)
        sembollerListesi.append(sembol17)
        sembollerListesi.append(sembol18)
        sembollerListesi.append(sembol19)
        sembollerListesi.append(sembol20)
        sembollerListesi.append(sembol21)
        sembollerListesi.append(sembol22)
        sembollerListesi.append(sembol23)
        sembollerListesi.append(sembol24)
        sembollerListesi.append(sembol25)
        sembollerListesi.append(sembol26)
        sembollerListesi.append(sembol27)
        sembollerListesi.append(sembol28)
        sembollerListesi.append(sembol29)
        sembollerListesi.append(sembol30)
        sembollerListesi.append(sembol31)
        sembollerListesi.append(sembol32)
        sembollerListesi.append(sembol33)
        sembollerListesi.append(sembol34)
        sembollerListesi.append(sembol35)
        sembollerListesi.append(sembol36)
        sembollerListesi.append(sembol37)
        sembollerListesi.append(sembol38)
        sembollerListesi.append(sembol39)
        sembollerListesi.append(sembol40)
        sembollerListesi.append(sembol41)
        sembollerListesi.append(sembol42)
        sembollerListesi.append(sembol43)
        sembollerListesi.append(sembol44)
        sembollerListesi.append(sembol45)
        sembollerListesi.append(sembol46)
        sembollerListesi.append(sembol47)


        
        
       // imageView.image = UIImage.gif(asset: "giris1")
        
        
        
    }
    // Veri Gonderirken Hazirlik
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ruya" {
            let destination = segue.destination as! tabbarController
            let destination0 = destination.viewControllers![0] as! SembolAramaViewController
            let destination1 = destination.viewControllers![1] as! RuyaSembollColletionViewViewController
            
            if let veri = sender as? [RuyaSembol] {
                destination0.sembol = veri  
                destination1.sembol = veri
            }
        }
    }
    
  

    
    
    @IBAction func ruyaYorumlamaButton(_ sender: Any) {
        if let button = sender as? UIButton {
            applyButtonEffect(button: button)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.performSegue(withIdentifier: "ruyaKaydet", sender: nil)
        }
        
        
    }
    
    
    // Semboller lisstesini prepare func gondermek!
    @IBAction func ruyaSembolleriButton(_ sender: Any) {
        if let button = sender as? UIButton {
            applyButtonEffect(button: button)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.performSegue(withIdentifier: "ruya", sender: self.sembollerListesi)
        }
        
    }
    
    
    @IBAction func profilButton(_ sender: Any) {
        if let button = sender as? UIButton {
            applyButtonEffect(button: button)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.performSegue(withIdentifier: "profil", sender: nil)
        }
        
    }
    
    
    func applyButtonEffect(button: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            button.alpha = 0.7
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                button.transform = CGAffineTransform.identity
                button.alpha = 1.0
            })
        })
    }
    
}
