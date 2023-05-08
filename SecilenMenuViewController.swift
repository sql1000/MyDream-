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
    
    var soruListesi:[SoruCevap] = [SoruCevap]()
    
    
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
        
        
        
        
        
        
        
        let semboller = [
            RuyaSembol(sembolResim: "at", sembolisim: "At", sembolAnlami: "Arzuları, dilekleri ve ümit edilerek beklenen şeyleri simgeler."),
             RuyaSembol(sembolResim: "ordek", sembolisim: "Ordek", sembolAnlami: "Sari"),
             RuyaSembol(sembolResim: "timsah", sembolisim: "Timash", sembolAnlami: "dinazor"),
             RuyaSembol(sembolResim: "kedi", sembolisim: "Kedi", sembolAnlami: "Tatlı olmas"),
             RuyaSembol(sembolResim: "ada", sembolisim: "Ada", sembolAnlami: "Kişinin bilgi içinde olmasına rağmen bunu fark edememesini simgeler."),
             RuyaSembol(sembolResim: "aile", sembolisim: "Aile", sembolAnlami: "Yakın geçmişteki bilinçaltı kayıtlarını anlatır. Atlalar ve çocukluk dönemi değildir."),
             RuyaSembol(sembolResim: "ajanda", sembolisim: "Ajanda", sembolAnlami: "Planlı olmayı ve planlı haraket etmeyi simgeler."),
             RuyaSembol(sembolResim: "akbaba", sembolisim: "Akbaba", sembolAnlami: "Başkalarının zayıflıklarından faydalanarak, kazanç elde etmeyi simgeler."),
             RuyaSembol(sembolResim: "alısveris", sembolisim: "Alışveriş", sembolAnlami: "Gündelik hayatın olağan akışında her gün tekrarlanan rutin işleri ve diğer insanlarla kurulan ilişkileri simgeler."),
             RuyaSembol(sembolResim: "alkol", sembolisim: "Alkol", sembolAnlami: "İçki içmek kişinin içinde bulunduğu durumu veya olayı unutarak rahatlamak istediğini simgeler."),
             RuyaSembol(sembolResim: "altın", sembolisim: "Altın", sembolAnlami: "Maddi aleme hayat vereşn şeyleri simgeler."),
             RuyaSembol(sembolResim: "anahtar", sembolisim: "Anahtar", sembolAnlami: "Kuvvet ve kolaylığı simgeler. Rüyada anlatılan durum ile ilgili kolaylıkla yapılabilme imkanı ve yolu kişinin kendisine verilmiştir."),
             RuyaSembol(sembolResim: "astronot", sembolisim: "Astronot", sembolAnlami: "Kişinin manevi arayış içerisinde olduğunu simgeler."),
             RuyaSembol(sembolResim: "ates", sembolisim: "Ateş", sembolAnlami: "Öfkeyi simgeler. Fakat ateşi ihtiyaçlarımızı karşılamak için de kullanırız. Bundan dolayı rüyanın genel durumu dikkate alınarak yorum yapılması gerekir."),
             RuyaSembol(sembolResim: "atmaca", sembolisim: "Atmaca", sembolAnlami: "İlişkilerde bir noktaya odaklanmayı ve hızlıca harakete geçmeyi simgeler. Rüyasında 'Atmaca' gören kişinin ilişkilerinde tek bir şeye odaklanması ve hızlıca harakete geçmesi gerekir. "),
             RuyaSembol(sembolResim: "avukat", sembolisim: "Avukat", sembolAnlami: "Özsavunmayı simgeler. Rüya kişinin kendisini savunması gerektiğini anlatabileceği gibi yanlış savunduğunu da gösterebilir. Bundan dolayı rüyanın genel durumu dikkate alınarak yorum yapılması gerekir."),
             RuyaSembol(sembolResim: "adliye", sembolisim: "Adliye", sembolAnlami: "Adaleti yani kişinin adil olma durumunu simgeler."),
             RuyaSembol(sembolResim: "adres", sembolisim: "Adres", sembolAnlami: "Kişinin, hangi istikamet üzere olduğunu veya olmasını gerektiğini simgeler."),
             RuyaSembol(sembolResim: "ağaç", sembolisim: "Ağaç", sembolAnlami: "Geni simgeler."),
             RuyaSembol(sembolResim: "ağız", sembolisim: "Ağız", sembolAnlami: "Söylenen veya söylenemeyen sözleri, simgeler. Ağız, kişinin anahtarı gibidir. İster açar, ister kilitler."),
             RuyaSembol(sembolResim: "ağlamak", sembolisim: "Ağlamak", sembolAnlami: "Şifalanmayı simgeler. Fakat bağıra bağıra ağlamak, isyan içinde olmayı ifade eder."),
             RuyaSembol(sembolResim: "ağrı", sembolisim: "Ağrı", sembolAnlami: "Rüyada görülen ağrı ve kasılma,direnç göstermeyi simgeler.Vücudun hangi bölgesinde ağrı var ise o bölge ile anlatılmak istenen bir şey olduğuna dikkat çeker."),
             RuyaSembol(sembolResim: "ahtapot", sembolisim: "Ahtapot", sembolAnlami: "Kendini bu dünyaya ait hissedemeyen kişinin, ait hissedebilmek için duyduğu sarılma ihtiyacını simgeler."),
             RuyaSembol(sembolResim: "ajan", sembolisim: "Ajan", sembolAnlami: "Bir başka insan hakkında bilgi sahibi olmak için, onu gizlice gözetleyen ve araştıran kişiyi simgeler."),
             RuyaSembol(sembolResim: "akarsu", sembolisim: "Akarsu", sembolAnlami: "İlham yoluyla edinilen bilgi akışını simgeler. Bilginin kişiye, kaynağından geldiğini ifade eder."),
             RuyaSembol(sembolResim: "akciğer", sembolisim: "Akciğer", sembolAnlami: "Kişinin, yaşadığı ve bulunduğu ortamı simgeler."),
             RuyaSembol(sembolResim: "akciğerrahatsızlıkları", sembolisim: "Akciğer Rahatsızlıkları", sembolAnlami: "Akciğer rahatsızlıkları, kişinin yaşadığı veya bulunduğu ortamdan mutlu olmaması ya da bulunduğu ortamdaki kişiler tarafından zulüm görmesi ile ilgilidir."),
             RuyaSembol(sembolResim: "antikaraba", sembolisim: "Antika Araba", sembolAnlami: "Eski zamanlara ait olan değerli yöntemleri simgeler."),
             RuyaSembol(sembolResim: "akıl", sembolisim: "Akıl", sembolAnlami: "Kalıp düşünceleri ve önyargıları simgeler."),
             RuyaSembol(sembolResim: "akraba", sembolisim: "Akraba", sembolAnlami: "Genetik bilgi aktarımlarını ya da bilinçaltı aktarımların niteliğini simgeler. Görülen her akraba kişinin bir aktarımını ifade eder."),
             RuyaSembol(sembolResim: "akrep", sembolisim: "Akrep", sembolAnlami: "Kişinin, savunma mekanizmasını simgeler."),
             RuyaSembol(sembolResim: "aksesuar", sembolisim: "Aksesuar", sembolAnlami: "Aksesuar üzerindeki semboller dikkate alınarak yorum yapılması gerekir."),
             RuyaSembol(sembolResim: "akşam", sembolisim: "Akşam", sembolAnlami: "Akşam namazı vakti, kıyam etmeyi ve uyumayı simgeler. Gece farklı yorumalanır. (Bkz.Gece)"),
             RuyaSembol(sembolResim: "aktar", sembolisim: "Aktar", sembolAnlami: "Kişinin şifa arayışı içerisinde olduğunu simgeler."),
             RuyaSembol(sembolResim: "alim", sembolisim: "Alim", sembolAnlami: "Bilge insanı simgeler. Rüyada görülen alim kişi, hangi konuda ilim sahibi ise rüyayı gören kişinin o konuda özelliğinin aktif olacağını ifade eder. Rüyayı gören kişi sadaka vermeli ve bu özelliği alıp kabul etmelidir."),
             RuyaSembol(sembolResim: "alkış", sembolisim: "Alkış", sembolAnlami: "Kişinin takdir edilme ve onaylanma isteğini simgeler."),
             RuyaSembol(sembolResim: "alüminyum", sembolisim: "Alüminyum", sembolAnlami: "Kendini güçlü gibi gösteren zayıf insanları simgeler. Kişinin sahte güç gösterisi yaptığını ifade eder."),
             RuyaSembol(sembolResim: "alyans", sembolisim: "Alyans", sembolAnlami: "Ortak olma durumunu simgeler. Bu ortaklık, evlilik, amaca ulaşmak için kurulan sözleşme, bir kişiye duyulan bağlılık ya da bağımlılık olabilir."),
             RuyaSembol(sembolResim: "anaokulu", sembolisim: "Ana Okulu", sembolAnlami: "Kişinin ilk çocukluk dönemindeyaşadığı çevreyi ve karşılaştığı olayları simgeler."),
             RuyaSembol(sembolResim: "ankakuş", sembolisim: "Anka Kuşu", sembolAnlami: "Yeniden doğuşu simgeler. Hayatınızda bir şey sizin için önemini yitirmişse onu ankaya çevirin.Fakat anka enerjisi önce yanmayı gerektirdiği için sağlıklı giden bir şeyi ankaya çevirmeyin ve ona anka enerjisi yüklemeyin."),
             RuyaSembol(sembolResim: "anne", sembolisim: "Anne", sembolAnlami: "Rüyayı gören kadın ise; kişinin anneliğini ve anne ile ilgili bilinçaltı kayıtlarını simgeler. Fakat anne tarafından gelen kayıtları da ifade edebilir. Rüyayı gören erkek ise; anne ile ilgili bilinçaltı kayıtlarını ve eşi ile ilgili yapılanmasını ifade eder. Erkek için eş, sevgili, dişil güç, anne kayıtları ile ilgilidir."),
             RuyaSembol(sembolResim: "anten", sembolisim: "Anten", sembolAnlami: "Duru işiti ve duru görü ile kurulan iletişimi simgeler. Beş duyu organın,ın yardımı olmadan olayları veya durumları algılayabilmeyi ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Abiye Elbise", sembolAnlami: "Bir olayın veya durumun mutlu sonuçlanmasından dolayı yapılan kutlamayı simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Ab-ı Hayat", sembolAnlami: "İlimi simgeler.."),
             RuyaSembol(sembolResim: "", sembolisim: "Adak", sembolAnlami: "Bir dileğin gerçekleşmesi için adanan şeyleri simgeler. Fakat bu rüyayı gören kişi, dileğinin gerçekleşmesini beklemeden rüyada adadığı şeyi hemen yerine getirmelidir."),
             RuyaSembol(sembolResim: "", sembolisim: "Regl(Adet Kanı)", sembolAnlami: "Dişilikle ilgili şeyleri simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Ab-ı Hayat Suyu İçmek", sembolAnlami: "İlim almayı ya da ilim alınacağını simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "alın", sembolAnlami: "Açık alın, kişinin saklayacağı bir şey olmadığını; kapalı alın ise, kişinin bir şey saklıyor olabileceğini simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Antika Ev(Eski Ev)", sembolAnlami: "Ataları simgeler. Kişinin atalarına gitmesi gerektiğini ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Apartman", sembolAnlami: "Ev insanın kendisini simgeler. Fakat rüyada apartman görülüyorsa bu kollektifi ifade eder. Ayrıca apartman içerisinde görülen evin yükseklik, kişinin frekans yüksekliği hakkında da bilgi verir."),
             RuyaSembol(sembolResim: "", sembolisim: "Apse", sembolAnlami: "Kişinin iyileşme döneminde olduğunu simgeler. İltihap vücudun hangi bölgesinde görülüyorsa, o bölgede yaşanan iyileşmeyi ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Arena", sembolAnlami: "Yüzleşmeyi ve hesaplaşmayı simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Arı", sembolAnlami: "Kişinin yaşadığı duyguları tecrübeye dönüştürmesini simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Arkadaş", sembolAnlami: "Kişinin sosyal yönünü, yani sosyalliğini simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Armut", sembolAnlami: "Olgunlaşmayı ve olgunlaşma sürecinde olmayı simgeler. Bazen de geç olgunlaşmayı ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Arpa", sembolAnlami: "Eril enerji kaynağını simgeler. Gücün ve kuvvetin kaynağını ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Asa", sembolAnlami: "Mucizeleri, çoğunlukla da görülmeyen mucizeleri simgeler. Yani görülmeyen mucizelerin açığa çıkacağını ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Asansör", sembolAnlami: "Kişinin frekansını simgeler. Asansör ile çıkmak frekansın yükseldiğini, inmek ise frekansın düştüğünü ifade eder. Asansör ile bodruma yani mahsene inmek frekans düşüklüğü değil, bilinçaltına inmektir."),
             RuyaSembol(sembolResim: "", sembolisim: "Asker", sembolAnlami: "Güvenlik ve koruyucu güçleri simgeler. Rütbeli asker kişinin yüksek gücünü ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Aslan", sembolAnlami: "Lider ruhu simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Aslan Ağzı Çiçeği", sembolAnlami: "Ruhtan gelenleri söylemeyi simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Asma", sembolAnlami: "Kadını simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Asma Ağacı", sembolAnlami: "Kadını, dişiliği ve üretkenliği simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Asma Yaprağı", sembolAnlami: "Kadına ait ahlaki ve etik değerleri simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Astrolog", sembolAnlami: "Manevi konularda öngörü sahibi olmayı simgeler. Yani üstbilişe sahip olmayı ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Aşık", sembolAnlami: "Bkz. Aşk"),
             RuyaSembol(sembolResim: "", sembolisim: "Aşk", sembolAnlami: "Maneviyatı simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "At Nalı", sembolAnlami: "Şansı simgeler. Kişinin istek ve arzularına kavuşması için karşısına çıkan fırsat ve olanakları ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Ateş Böceği", sembolAnlami: "Anlık sezgileri ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Atlamak", sembolAnlami: "Bir şeyin üzerinden atlamak, kişinin o şeyi kolaylıkla aşabileceğini simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Atölye", sembolAnlami: "Kişinin, yeteneklerini geliştirmesini simgeler. Bir şeyi anlama ve yapabilme gücünü artırmasını ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Avlu", sembolAnlami: "Bkz. Evin Avlusu"),
             RuyaSembol(sembolResim: "", sembolisim: "Avuç", sembolAnlami: "Vermeyi ve almayı simgeler. Fakat avuç içi kişinin imzası gibidir. Kişi kendi eli ile ne yapıyorsa onun yansımalarını kendi hayatında görecektir."),
             RuyaSembol(sembolResim: "", sembolisim: "Ay", sembolAnlami: "Anneyi ve manevi alemi simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Ayak", sembolAnlami: "Kişinin kararlarını simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Ayakkabı", sembolAnlami: "Kişinin, gitmekte olduğu yolda nasıl bir yürüyüş sergilediğini ifade eder. Ayakkabının modeli ve çeşidi önemlidir. Spor ayakkabı mı, abiye ayakkabı mı, eski mi yoksa yeni mi vs. çok yönlü düşünülerek yorum getirilmesi gerekir."),
             RuyaSembol(sembolResim: "", sembolisim: "Ayakkabıcı", sembolAnlami: "Yeni bir yol haritası belirlemeyi simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Ayak Rahatsızlıkları", sembolAnlami: "Ayak rahatsızlıkları, kişinin gideceği veya gitmekte olduğu yolu ve hedefi ile ilgilidir."),
             RuyaSembol(sembolResim: "", sembolisim: "Ayçiçeği", sembolAnlami: "Hayata pozitif bakmayı simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Ayet", sembolAnlami: "Rüyada okunan sure veya ayetin anlamına dikkat edilmesi gerekir. Kişinin oradan alacağı bir pay vardır."),
             RuyaSembol(sembolResim: "", sembolisim: "Ayı", sembolAnlami: "Nezaketsizliği, kabalığı ve saygısızlığı simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Ayin", sembolAnlami: "Kişinin, bir işe başlamadan önce yaptığı psikolojik hazırlığı simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Ayna", sembolAnlami: "Yüzleşmeyi ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Baba", sembolAnlami: "Rüyayı gören erkek ise kişinin babalığını veya babası ile ilgili bilinçaltı kayıtlarını simgeler. Rüyayı gören kadın ise, hem babası ile ilgili bilinçaltı kayıtlarını hem de eşi ile ilgili yapılanmasını simgeler. Kadın için eş, sevgili, eril güç, baba kayıtları ile ilgilidir."),
             RuyaSembol(sembolResim: "", sembolisim: "Babanın Akrabaları", sembolAnlami: "Baba tarafından kişiye aktarılan eril gücü simgeler. Kan ile ilgilidir ve daha çok genetik aktarımları ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Babayiğit", sembolAnlami: "Kişinin güçlü ve koruyucu, kollayıcı olması gerektiğini simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Baca", sembolAnlami: "Soba, kalbi simgelediği için rüyada görülen baca da kişinin içinde bulunduğu durum hakkında bilgi verir."),
             RuyaSembol(sembolResim: "", sembolisim: "Bacaklar", sembolAnlami: "Kökleri simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Badana", sembolAnlami: "Düşüncelerin değişmesini simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Badem", sembolAnlami: "Gözü simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Bağ(Asma Yetiştirilen Yer)", sembolAnlami: "Genelde evliliği simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Bağırmak", sembolAnlami: "Kişinin haykıramadığını ve haykırması gerektiğini simgeler. Kişiyi içinde yaşadığı duygusu ile yüzleştirir. Kişinin yardıma ihtiyacı olduğunu ifade eder. Fakat, ağlarken bağırmak isyan içinde olmayı ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Bağırsak Rahatsızlıkları", sembolAnlami: "Bağırsak rahatsızlıkları, kişinin tutunduğu ve bırakması gerektiği halde bırakamadığı şeyler ile ilgilidir. Bağırsak rahatsızlıklarının temelinde baba ile ilgili sorunlar vardır."),
             RuyaSembol(sembolResim: "", sembolisim: "Bağırsaklar", sembolAnlami: "Kişinin tutunduklarını ve bıraktıklarını simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Bağış Görmek", sembolAnlami: "Bağış yapıldığını görmek, kişinin sadaka vermesi gerektiğini ifade eder. Fakat kişinin kendisini bağış yaparken görmesi, yaptığı iyiliklerin karşısına çıkacağını müjdeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Bağlamak", sembolAnlami: "Rüyada kişinin neyi bağladığına bakılarak yorum yapılması gerekir. Kişinin içinde bulunduğu durum ve yaşadığı olaylar hakkında bilgi verir."),
             RuyaSembol(sembolResim: "", sembolisim: "Bahar", sembolAnlami: "Kişinin hayatında güzel bir dönemin başlayacağını simgeler. Hatta kişinin dileğinin baharda gerçekleşeceğini de ifade edebilir."),
             RuyaSembol(sembolResim: "", sembolisim: "Bahar Çiçekleri", sembolAnlami: "Kişinin hayatında yeni ve güzel duyguların başlayacağını simgeler.Hatta kişinin dileğinin baharda gerçekleşeceğini de ifade edebilir."),
             RuyaSembol(sembolResim: "", sembolisim: "Bahçe", sembolAnlami: "Kişinin aurasını yani enerji alanını simgeler. Rüyada görülen bahçenin büyüklüğü, kişinin aurası hakkında fikir verirken bahçede görülen çiçeklerde kişinin duygu durumu hakkında bilgi verir."),
             RuyaSembol(sembolResim: "", sembolisim: "Bahis", sembolAnlami: "Hırsla hareket etmeyi simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Bahşiş", sembolAnlami: "Teşekkür etmeyi ya da teşekkür beklemeyi simgeler. Kişi rüyada bahşiş veriyorsa teşekkür ediyordur. Fakat kendisini bahşiş beklerken görüyorsa kendisi birilerinden teşekkür bekliyordur."),
             RuyaSembol(sembolResim: "", sembolisim: "Baklava", sembolAnlami: "Kişinin yaptığı iyilikten dolayı ödüllendirilmesini simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Bal", sembolAnlami: "Kişinin duygularını tecrübeye dönüştürmesini simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Balçık", sembolAnlami: "Olgunlaşmamış insanı simgeler. İnsani özelliklerin kaybedilmeye başlandığını da ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Balgam Tükürmek", sembolAnlami: "Kişinin şifalanmasını simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Balık", sembolAnlami: "Sezgileri simgeler. Sezgiler, gerçeğin dolaysız bir biçimde içgüdüsel kavranması olduğu için, kişiye manevi olarak gelecek mesajların öncesinde balık gösterilebilir. Yani ilahi bir kanaldan mesaj aldığına kişinin dikkati çekilir."),
             RuyaSembol(sembolResim: "", sembolisim: "Balık Ağı", sembolAnlami: "Kişinin sezgilerini yakaladığını simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Balıkçı Teknesi", sembolAnlami: "Kişinin sezgilerini önemsemesi, dikkate alması ve sezgilerinin peşine düşmesini simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Balina", sembolAnlami: "Büyük sezgiselliği simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Balkon", sembolAnlami: "Kişinin yakın çevresi ve sosyal çevresi ile olan etkileşimini simgeler. Fakat sosyallikle karıştırılmaması gerekir. Çünkü balkon kişinin sosyal çevresi ile karşılıklı olan etkileşimini temsil eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Balon", sembolAnlami: "Kişinin boş hayallerini simgeler. Balonun rengi önemlidir."),
             RuyaSembol(sembolResim: "", sembolisim: "Balta", sembolAnlami: "Köklü değişiklikleri simgeler. Genetik özellikleri kesmeyi ifade eder. Rüyanın geneli göz önünde bulundurularak kişinin yaptığı, iyi mi yoksa kötü mü diye değerlendirilmesi gerekir."),
             RuyaSembol(sembolResim: "", sembolisim: "Balya Şeklindeki Krumuş Saman", sembolAnlami: "Kenarda duran parayı simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Balyoz", sembolAnlami: "Kişinin kendi hayatında yıktığı, dağıttığı ve bozduğu şeyleri simgeler. Rüyada balyoz ile yıkılan şeyin sembolik değeri, kişinin kendi hayatında neyi yıktığı konusunda fikir verir."),
             RuyaSembol(sembolResim: "", sembolisim: "Banyo", sembolAnlami: "İçsel arınmayı simgeler. Kişinin olumsuz duygu ve düşüncelerinden temizlenmesini ve mecazi anlamda da rahatlamasını ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Baraj", sembolAnlami: "Kişinin topladığı bilgiyi simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Baraka", sembolAnlami: "Kişinin geçici olarak içinde bulunduğu durumu simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Baston", sembolAnlami: "Bkz. Asa"),
             RuyaSembol(sembolResim: "", sembolisim: "Baş", sembolAnlami: "Kimliği simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Baş Ağrısı(Baş ile İlgili Sorunlar)", sembolAnlami: "Kimlikle ilgili sorunlar ve bunalımlar baş rahatsızlıklarına sebep olur."),
             RuyaSembol(sembolResim: "", sembolisim: "Başak", sembolAnlami: "Kişinin görmeye, anlamaya, değişmeye yani farkında olmaya başladığı dönemi simgeler. Bazen de bereketi ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Başbakan", sembolAnlami: "Rüyanın, yaşanılan ülke ile ilgisi olduğunu ifade eder. Eğer rüyayı gören kişinin devlet başkanına karşı farklı duygusu varsa o özellik de göz önünde bulundurularak rüya yorumu yapılması gerekir. Bazen de kişinin hayatının yönetimini temsil eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Başkan", sembolAnlami: "Yönetimi simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Başörtüsü", sembolAnlami: "Kişinin bir yere bağlanmasını, çekilmesini, ait hissetmesini veya dahil olmasını simgeler. Mesela kişinin işe girmesi ve kendisini oraya ait hissetmesi gibi."),
             RuyaSembol(sembolResim: "", sembolisim: "Bataklık", sembolAnlami: "Bkz. Balçık."),
             RuyaSembol(sembolResim: "", sembolisim: "Batarya", sembolAnlami: "Kişinin enerjisini yükseltmeye ihtiyacı olduğunu simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Battaniye", sembolAnlami: "Kişinin özel alanında korunma ihtiyacını simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Bavul", sembolAnlami: "Bir şeye hazırlanmayı simgelerç"),
             RuyaSembol(sembolResim: "", sembolisim: "Baykuş", sembolAnlami: "Sezgisel bilgeliği simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Bebek", sembolAnlami: "Kişi bebeği doğarken veya yeni doğmuş olarak gördüyse, burada bebek yeniden doğuşu ve yeni bir başlangıcı simgeler. Fakat bebek daha büyükse, kişi rüyasında gördüğü bebeğin yaşındayken ne yaşadığına bakması gerekir. Ayrıca bebeğini kaybetmiş kişiler için rüyada görülen bebek, kişinin travması ile alakalı olabilir."),
             RuyaSembol(sembolResim: "", sembolisim: "Bebek Emzirmek", sembolAnlami: "Kendi bebekliğini beslemeyi simgeler. Şifalanma rüyasıdır. Bundan dolayı teşekkür etmek ve şifanın tamamlanmasına niyet ediyorum demek uygun olur."),
             RuyaSembol(sembolResim: "", sembolisim: "Bebek Eşyaları", sembolAnlami: "Yeni bebek kıyafeti ve eşyaları görmek, bebeği müjdeler. Fakat eski bebek eşyaları görmek, kişinin kendi bebeklik dönemini ifade eder."),
             RuyaSembol(sembolResim: "", sembolisim: "Beddua", sembolAnlami: "Kişinin beddua etmesi veya başkasını beddua ederken görmesi fark etmez. Kişi yaptığı kötü şeyleri gözden geçirmeli ve hemen tövbe etmelidir. Sadaka vermesi uygun olur."),
             RuyaSembol(sembolResim: "", sembolisim: "Beden", sembolAnlami: "Toprağı simgeler."),
             RuyaSembol(sembolResim: "", sembolisim: "Bedevi", sembolAnlami: "Yalnız insanı veya yolunu bulmaya çalışan insanı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bekçi", sembolAnlami: "Kişinin güvenli ve emniyetli olan konfor alanını simgeler. Kişinin hayata karışmak yerine kendini iyi hissettiği bu alanda, bir şeylerin başını bekleyerek kalmasını ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Bel", sembolAnlami: "Dengeyi simgeler. Kişinin yaşamında kurduğu dengeyi, ölçüyü ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Bel", sembolAnlami: "Bel, vücudun denge merkezidir. Bilinçaltı sırtta yük algıladığı zaman, denge merkezi kayma yaşayabilir. Bundan dolayı bel rahatsızlıklarında, kişinin hayatında denge bulamadığı her yere bakılması gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Bela", sembolAnlami: "Rüyayı gören kişinin hemen sadaka vermesi ve bu durumdan kolayca çıkmak için dua etmesi uygun olur."),
            RuyaSembol(sembolResim: "", sembolisim: "Belediye", sembolAnlami: "Yaşanılan bölgeyi ilgilendiren şeyleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Belediye Başkanı", sembolAnlami: "Rüyanın, yaşanılan belde ile ilgisi olduğunu ifade eder. Eğer rüyayı gören kişinin belediye başkanına karşı farklı duygusu varsa o özellik de göz önünde bulundurularak rüya yorumu yapılması gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Berber", sembolAnlami: "Kişinin hislerini değiştirmek istemesini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Berjer Koltuk", sembolAnlami: "En değerlimizi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Besmeler Okumak", sembolAnlami: "Kişinin bir işe temiz niyetlerle başlaması gerektiğini ve işin sonucunun hayra çıkacağını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Beşik", sembolAnlami: "Bkz. Bebek"),
            RuyaSembol(sembolResim: "", sembolisim: "Beyaz", sembolAnlami: "Saflığı, temizliği, huzuru, arınmayı ve iyiliği simgeler. Bazen de teslimiyeti, hiçliği ve akışta kalmayı ifade eder. Beyazın yansıtıcı özelliği olduğu için yansıtmayı da ifade eder. Kişinin verdiği şeyler kişiye yansır. Bundan dolayı daha çok vermeye odaklıdır."),
            RuyaSembol(sembolResim: "", sembolisim: "Beyaz Tüyler", sembolAnlami: "Melekleri ve ruhani varlıkları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bıçak", sembolAnlami: "Gücün ve kuvvetin simgesidir."),
            RuyaSembol(sembolResim: "", sembolisim: "Bıyık", sembolAnlami: "Yakınında olup biteni hissetmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bilek", sembolAnlami: "Kişinin beceri ve yeteneklerini simgeler. Ayrıca gücünü de ifade Rüya: Yorum: eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Bilekler", sembolAnlami: "Kişinin becerilerini, yeteneklerini ve kıvraklığını simgeler. Ayrıca gücünü de ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Bilet", sembolAnlami: "Hak kazanmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bilezik", sembolAnlami: "Meslek ve yetenekleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bilgisayar", sembolAnlami: "Zihin ve bilinçaltını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bilgisayar Oyunu Oynamak", sembolAnlami: "Kişinin gerçekleri fark ettiğini ve hayatı bir oyun gibi gördüğünü simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bilinçaltı", sembolAnlami: "Kişi hakkındaki bilgilerin kayıt edildiği, arşivlendiği yeri ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Bindallı", sembolAnlami: "Bir ortaklığın arefesinde olmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bir İnsanı Olduğundan Yaşlı Göremk", sembolAnlami: "Kişi rüyasında birini olduğundan yaşlı görürse, onun en önemli özelliğinin kendisinde aktif olacağını anlayabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Birinin Seni Öldürmeye Çalışması", sembolAnlami: "Kişi birileri tarafından kendisinin öldürülmeye çalışıldığını görüyorsa kendisini değiştirmek isteyen insanlar vardır."),
            RuyaSembol(sembolResim: "", sembolisim: "Bisiklet", sembolAnlami: "Kişinin kendi çabalarıyla hedefine ulaşmaya çalıştığını, bazen de dengeyi simgeler. Çocuk bisikleti görmek, çocukluk hayallerini ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Bitki", sembolAnlami: "Şifayı simgeler. Yeşil, dikensiz ve zehirsizse şifayı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Boğa", sembolAnlami: "Zenginliğin ve bolluğun kaynağını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Boğaz", sembolAnlami: "Kişinin iletişimini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Boğulmak", sembolAnlami: "Kişinin yaşadığı yerden veya bulunduğu ortamdan duyduğu rahatsızlığı simgeler. Ortamdan ya da ortamdaki insanlardan kaynaklı kişi kendini nefes alamıyormuş gibi hisseder."),
            RuyaSembol(sembolResim: "", sembolisim: "Bohça", sembolAnlami: "Bohçayı veren kişinin özelliğine göre rüyayı görenin hazırlık yapması gerektiğini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bol Giyinmek", sembolAnlami: "Olmadığı gibi davranmayı ve görünmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Boncuk", sembolAnlami: "Kişinin küçük şeylerle ilgilendiğini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Borç", sembolAnlami: "Eksik yapılan ya da yapılmayan işler olduğunu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bordo", sembolAnlami: "Kalıcılığı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Boynuz", sembolAnlami: "Gücü ve krallığı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Boyun", sembolAnlami: "Kişinin karar verememesi ya da doğru tercih yapamaması, kişide boyun fıtığı, boyun tutulması gibi rahatsızlıklara sebep olabilir. Eğer kişi kararsızsa kararını vermelidir. Karar verdiği halde boyun rahatsızlığı yaşıyorsa, o zaman yanlış karar vermiş olabilir. Kişinin verdiği kararı tekrar düşünmesi gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Böbrek", sembolAnlami: "Aileye dışarıdan gelen kişiyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Böbrek Rahatsızlıkları", sembolAnlami: "Böbrek rahatsızlıkları, özellikle çekirdek aile ile ilgilidir. Bazen de amca, hala gibi baba tarafından kan bağı olan akrabalar ile ilgili olabilir. (Çünkü böbrek kanı temizler ve kana karışan yabancı bir şey olduğunda da, kanı temizlemek için böbrek çok çalışır.)"),
            RuyaSembol(sembolResim: "", sembolisim: "Böcek", sembolAnlami: "Değersizlik duygusunu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Broş", sembolAnlami: "Kişinin kimliğini, ailesini, nereden geldiğini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Buğday", sembolAnlami: "Bolluğu, bereketi ve dişil enerjiyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bukalemun", sembolAnlami: "Kişinin duruş sergileyememesini ve bulunduğu duruma, ortama uyum sağlamaya çalışmasını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bulanık Su", sembolAnlami: "Kirli bilgi veya yanlış bir durum içinde olmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bulsşık", sembolAnlami: "Rızka hile karışmasını ya da bedel ödenmesi gereken bir durum olduğunu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Bulmaca Çözmek", sembolAnlami: "Kişinin çözmesi gereken şeyler olduğunu simgeler. Karışık görünen bir olaya, daha geniş bir bakış açısıyla bakarsa olayı çözebileceğini ifade ediyor."),
            RuyaSembol(sembolResim: "", sembolisim: "Bulut", sembolAnlami: "Kollektifi yani ortak bilinci simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Burun", sembolAnlami: "Kibiri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Burun Rahatsızlıkları", sembolAnlami: "Kibir ve ego ile ilgili sorunlar, burun rahatsızlıklarına sebep olabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Buzdolabı", sembolAnlami: "Evin bereketini, bolluğunu simgeler"),
            RuyaSembol(sembolResim: "", sembolisim: "Bülbül", sembolAnlami: "Güzel ve akıcı konuşmayı simgeler. Kişinin konuşma konusunda yetenekli olduğunu ve konuşurken diğer insanları etkilediğini ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Büyü", sembolAnlami: "Kişinin hayatına müdahale olduğunu ya da başkalarına müdahale ettiğini simgeler. Bu müdahalenin kişiyi zor duruma sokacağını ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Büyük Anne", sembolAnlami: "Ataları,atalardangelengenetikve karmik aktarımları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Büyük Baba", sembolAnlami: "Ataları,atalardangelengenetikve karmik aktarımları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cadde", sembolAnlami: "Kişinin hangi istikamet üzere olduğunu veya olması gerektiğini simgeler. Hayat yolunda sergilediği veya sergilemesi gereken davranış, tutum ve gidiş biçimini ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Cadı", sembolAnlami: "Kişinin kötü amaçlarla kullandığı fakat dönüştürürse kendisine fayda sağlayacağı güçlerinin olduğunu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cam", sembolAnlami: "Rüyada görülen cama dair herşey kişinin bakış açısını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cam Güzeli Çiçeği", sembolAnlami: "Onay alma, onaylanma ve onaylamayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cambaz", sembolAnlami: "Çeşitli laf oyunları ile karşısındakini kandıran, aldatan ve sinsilik yaparak amacına ulaşmaya çalışan, kurnaz insanları simgeler. Bu tür kişiler, kendisinin yaptığı işi zor göstererek ya da uçuk anlamlar yükleyerek o işi başkasının gözünde abartır."),
            RuyaSembol(sembolResim: "", sembolisim: "Cami", sembolAnlami: "Kişinin manevi evini yani maneviyatını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Canavar", sembolAnlami: "Kişinin zihninde büyüttüğü kötü düşünceleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cankurtaran", sembolAnlami: "Kişinin kendini güvenli alana alması ve güvende hissettiği alandan çıkmak istememesini simgeler. Fakat kişi kendisini mutsuz, huzursuz hissetmesine ya da yaşamından hoşnut olmamasına rağmen içinde bulunduğu durumu, ilişkiyi sürdürmeye çalışabilir. Rüyanın genel durumuna göz önünde bulundurularak yorum yapılması gerekir. Çünkü bazen güvenli alandan çıkınca o kişi için hayat başlayabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Casus", sembolAnlami: "Başkalarının hayat enerjisini düşüren insanları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Ceket", sembolAnlami: "ş hayatını ve ciddiyeti simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cemaat", sembolAnlami: "Yardımlaşmayı simgeler. Kişilerin yardımlaşarak gücünün artmasını ve kuvvetlenmesini ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Cemre", sembolAnlami: "Aşkı, canlanmayı ve uyanmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cenaze Ortamı", sembolAnlami: "Bitiş ve yeniden başlangıcı simgeler. Her bitiş yeni başlangıçlara açılan kapıdır. Hayattaki dönüm noktalarını ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Cennet", sembolAnlami: "Kişinin iyi tutum ve davranışlarının karşılığında kendisine verilen ödülü simgeler. Başarısı karşısında kendisine verilen mükafatı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Cephane", sembolAnlami: "Kişinin sahip olduğu gücü ifade eder. Ne kadar silahı varsa o kadar güçlü demektir."),
            RuyaSembol(sembolResim: "", sembolisim: "Cerahat", sembolAnlami: "Kötü hal ve hareketleri simgeler. Cerahatin (irin) görüldüğü yer ve yoğunluğu önemlidir. Rüya yorumu yapılırken buna dikkat edilmesi gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Cetvel", sembolAnlami: "Ölçülü hareket etmeyi simgeler. Kişinin ince hesaplar yaparak hareket ettiğini ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Cevher", sembolAnlami: "Kişinin kendi özünde olan ve fark edemediği yeteneğini simgeler. Bazen de şerrin içindeki hayrı görebilmeyi ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Ceviz", sembolAnlami: "Akıl ve zekayı simgeler.  Akledebilmeyi ve düşünmeyi ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Ceviz Ağacı", sembolAnlami: "Zeka ve akıl genini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cevşen", sembolAnlami: "Dua yapmayı simgeler. Korunma duasını da ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Ceylan", sembolAnlami: "Başkalarının iyiliğini isteyen ve onları düşünen, iyi kalpli kimseyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cezaevi", sembolAnlami: "Kişinin olumsuz düşünce kalıplarından çıkamamasını simgeler. Zihinsel kalıpları kıramamayı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Cezve", sembolAnlami: "Yeni arkadaşlıkların başlayacağını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cımbız", sembolAnlami: "Küçük şeyleri kolayca görebilmeyi ve fark edebilmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cila", sembolAnlami: "Son rötuşları simgeler. Bir şeyin bitimine yakın olduğunu ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Cilt", sembolAnlami: "Dış dünyayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cin", sembolAnlami: "Kişinin rüyayı gördüğü dönemde negatif şeylere maruz kaldığını ya da kalabileceğini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cinayet", sembolAnlami: "Kişinin kendisinde olan bir hali sonlandırmasını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cinsel İlişki", sembolAnlami: "Cinsel ilişkiye girildiği görülen kişinin en önemli özelliğini almayı simgeler. Ensest ilişki ise farklı yorumlanır. Mesela babası ile ilişkiye girdiğini gören kişi, eşini ebeveyni gibi görüyor veya ona öyle davranıyor olabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Cinsel ve Kök Çakra Rahatsızlıkları", sembolAnlami: "Cinsel ve kök çakra rahatsızlıkları, genelde atalarla, köklerle ve çocuklarla yaşanan sorunlarla ilgilidir.Atalar, köklenememekle ilgilidir."),
            RuyaSembol(sembolResim: "", sembolisim: "Cübbe", sembolAnlami: "İtibar ve saygınlığı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Cüce", sembolAnlami: "Kişinin küçülttüğü şeyleri simgeler"),
            RuyaSembol(sembolResim: "", sembolisim: "Cüzdan", sembolAnlami: "Maddesel değerleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çadır", sembolAnlami: "Bkz. Baraka"),
            RuyaSembol(sembolResim: "", sembolisim: "Çakal", sembolAnlami: "Sinsi planları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çakıl Taşı", sembolAnlami: "Yapı taşını simgeler. Bir yapı ortaya koymak için gereken malzemenin kişide olduğunu ifade eder"),
            RuyaSembol(sembolResim: "", sembolisim: "Çalgı Çalmak", sembolAnlami: "Kişinin yaptıklarının ruhu ile ne kadar uyumlu olduğunu simgeler. Kişinin kendi ruh titreşimini, kendi frekansını aramasını ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Çalı", sembolAnlami: "Beden sağlığı ile ilgili dikkat edilmesi gereken durumları simgeler. Bazen de kişiyi hasta eden diğer insanları ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Çalışma Koltuğu", sembolAnlami: "Mevkiyi, makamı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çam Ağacı", sembolAnlami: "Her zaman diri ve uyanık olmayı, sevgiyi, üçüncü gözü ve genetik aktarımı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çam Kozalağı", sembolAnlami: "Üçüncü gözü simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çamaçır Asmak", sembolAnlami: "Kendini yenilemeyi, simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çamur", sembolAnlami: "Düşük frekansı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çan", sembolAnlami: "Haberi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çanak", sembolAnlami: "Kısmet ve rızkı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çanta", sembolAnlami: "Taşınan yükleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çapa Yapmak", sembolAnlami: "Derinlere inmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çardak", sembolAnlami: "Kız çocuğunun ailesinden gizli olarak yaptığı görüşmeleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çark", sembolAnlami: "Belirli zaman aralıkları ve döngüleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çarşaf", sembolAnlami: "Başkalarının duymaması ve öğrenmemesi gereken, gizli şeyleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çarşı", sembolAnlami: "Bkz.Alışveriş"),
            RuyaSembol(sembolResim: "", sembolisim: "Çay", sembolAnlami: "Keyifli ve huzurlu olmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çayır", sembolAnlami: "Şifayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çek", sembolAnlami: "Kişiye itibar eden ve güven duyan yerler olduğunu, simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çekiç", sembolAnlami: "Sabitlemeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çekirge", sembolAnlami: "İstilayı simgeler. Bir şeyi haklı veya haksız şekilde zorla ele geçirmeyi ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Çekmece", sembolAnlami: "Bilinçaltıkayıtlarınıvesaklıkalmış şeyleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çekyat", sembolAnlami: "En yakın arkadaşları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çelik", sembolAnlami: "Dayanışma ile oluşan büyük gücü simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çelme", sembolAnlami: "Kişinin başarısını ve enerjisini düşürmek için yapılan kasıtlı müdahaleleri simgeler"),
            RuyaSembol(sembolResim: "", sembolisim: "Çengelli İğne", sembolAnlami: "Negatif varlıklarla ilgili şeyleri, simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çerçeve", sembolAnlami: "Değer verilen anıları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çeşme", sembolAnlami: "Bilgiyi tutan şeyi ve bilgi akışını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çeyiz", sembolAnlami: "Anne ve anne tarafından gelen donanımları simgeler. Aynı zamanda bireysel yapılan hazırlığı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Çıkmaz Sokak", sembolAnlami: "Israrla aynı hataları yapmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çınar Ağacı", sembolAnlami: "nsana güç veren geni ve güçlü insanı simgeler. Bazen babayı ve baba atalarının genini bazen de devleti ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Çıplak", sembolAnlami: "Olduğu gibi görünmeyi ya da korunmasız kalmayı simgeler. Rüyadaki his ve duygulara göre yorum yapılması gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Çiçek", sembolAnlami: "Kişinin duygusunu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çiçeksiz Çiçekler", sembolAnlami: "Kişinin dileğini, simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çiftçi", sembolAnlami: "Kişinin kendisi için ne yaptığını ve bedenini nasıl kullandığını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çiğ", sembolAnlami: "Olmamış anlamını simgeler. Herşeyin çiği olmamış anlamını ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Çiğ Et", sembolAnlami: "Gıybetisimgeler.Fakatkemikliçiğ et, adağı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Çikolata", sembolAnlami: "Çocukluk döneminde yaşanan  mutlulukları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çil", sembolAnlami: "Özel insanı simgeler. Atalardan  gelen veya nadir bir özelliğe sahip olduğunu ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Çilek", sembolAnlami: "Hayattan tat ve zevk almayı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Çilingir", sembolAnlami: "Güzel ve etkili konuşmayı simgeler. "),
            RuyaSembol(sembolResim: "", sembolisim: "Çimen", sembolAnlami: "Bkz.Çayır"),
            RuyaSembol(sembolResim: "", sembolisim: "Çingene", sembolAnlami: "Akışta yaşamayı simgeler. Olayların kendi içinde gelişmesine izin vermeyi ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Çivi", sembolAnlami: "Sabit düşünceyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çizme", sembolAnlami: "Zor şartları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çoban", sembolAnlami: "Maddi kaynakları yöneten kimseyi simgeler. Bir başkasının maddi kaynaklarını para karşılığında ya da menfaati doğrultusunda yöneten kişiyi de ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Çocuk", sembolAnlami: "Çocukluk dönemi bilinçaltı kayıtlarını simgeler. Rüyada görülen her çocuk, rüyayı gören kişinin çocukluk dönemini ifade eder ve çocuğun yaşı, kişinin o yaştaki bilinçaltı kaydı ile ilgilidir."),
            RuyaSembol(sembolResim: "", sembolisim: "Çocuk Odası", sembolAnlami: "Çocukluk dönemi travmalarını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çocukluk Tramvaları", sembolAnlami: "Bilinçaltı kodlarını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çorap", sembolAnlami: "Kişinin kararlarından dolayı yaşadığı soğukluğu, sevgisizliği simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çorba", sembolAnlami: "Aile sevgisini ve sıcaklığını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çöl", sembolAnlami: "Yalnızlığı, kimsesizliği ve yalnız hissetmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çöp", sembolAnlami: "Geçmişte gözden geçirilmesi gereken şeyler olduğunu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çöpçü", sembolAnlami: "Geçmişe dönüp alınması gereken şeyler olduğunu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çörek", sembolAnlami: "Anne sıcaklığını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çörek Otu", sembolAnlami: "Şifalanmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çukur", sembolAnlami: "Frekansın aniden düşebileceğini, biraz duraklamak gerektigini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Çuval", sembolAnlami: "Bkz.Çanta"),
            RuyaSembol(sembolResim: "", sembolisim: "D Vitaminin", sembolAnlami: "Baba sevgisi ile ilgilidir. Babasız olan ve baba sevgisini alamayan çocuklarda hem rüyada hem de gerçek hayatta d vitamini eksikliği olduğu görülür. (Çünkü güneş babayı temsil eder.)"),
            RuyaSembol(sembolResim: "", sembolisim: "Dadı", sembolAnlami: "Çocukluk travmalarından iyileşmeyi ve yardım almayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dağ", sembolAnlami: "Maddi hayatta yükselmiş insanı simgeler. Dağ ne kadar yüksekse o kadar yükselmiştir. Fakat tepe atalarımızda yükselmiş kişiyi ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Dağ Yolu", sembolAnlami: "Zor ama yükselmeye giden yolu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dağın Mağarası", sembolAnlami: "Anne rahmini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dağın Tepesi", sembolAnlami: "3. gözü simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dağınıklık", sembolAnlami: "Kişinin hayatında yaşadığı şuanki durumu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Daire Şekli", sembolAnlami: "Alemi kapsamayı veya bir alem oluşturmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Daktilo", sembolAnlami: "Kayda alınması gerekenleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dam", sembolAnlami: "Bkz. Evin Çatısı"),
            RuyaSembol(sembolResim: "", sembolisim: "Damar", sembolAnlami: "Kanı, aileyi ve babayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Damat", sembolAnlami: "Kişinin, o yaştaki erili üstlenmiş halini yani eril halini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Damatlık", sembolAnlami: "Kişinin o anki arzusu ne ise, ona kavuşacağını simgeler. İş, sevgili, para, makam vs."),
            RuyaSembol(sembolResim: "", sembolisim: "Dans Etmek", sembolAnlami: "Ruh ve beden bütünlüğünü simgeler. İki kişinin dans etmesi de biriyle bir alan yaratmayı, hazırlığı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Dantel", sembolAnlami: "Anne ve babamızın, belirli bir amaç için özenle bizi hazırladıkları şeyleri simgeler. Yıllarca piyano kursuna göndermek gibi."),
            RuyaSembol(sembolResim: "", sembolisim: "Dar Giyinmek", sembolAnlami: "Rahat hareket edememeyi simgeler. Kişinin aşamadığı bazı şeyler olduğunu ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Davetiye", sembolAnlami: "Çağrıyı simgeler. Rüyada davetiye ne ile ilgili ise kişi ona çağrılıyor, davet ediliyordur."),
            RuyaSembol(sembolResim: "", sembolisim: "Dayak", sembolAnlami: "Yardım görmeyi ve yardım etmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Deccal", sembolAnlami: "Kişinin kendi içindeki kötülüğe hizmet eden durumunu ve halini simgeler. Bu durum içinde olan kişi bunu kabul etmeyip, bir bahane sunabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Dede", sembolAnlami: "Yaşlı fakat sakallı ve özellikle de beyaz sakallı ise manevi yardımcıları simgeler. Hızır (a.s.) veya diğer Allah dostlarını ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Dedektif", sembolAnlami: "Bazı şeylerin irdelenmesi gerektiğini simgeler. Bir sorunun bütün durumlarını, bütün yönlerini araştırıp birer birer incelenmesi gerektiğini ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Define", sembolAnlami: "Kişinin atalarından gelen, maddi ve manevi en parlak özelliğini simgeler. Bazen de mirası ifade edebilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Defne", sembolAnlami: "Taçlandırmayı simgeler. Bir kişiyi, bir olayı, bir durumu başarılı bularak değerlendirmeyi ifade eder"),
            RuyaSembol(sembolResim: "", sembolisim: "Defter", sembolAnlami: "Dünya hayatı boyunca kişinin yaptığı iyi ve kötü bütün işleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Değirmen", sembolAnlami: "Bilgiyi kazanca dönüştürmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dehliz", sembolAnlami: "Hazineyi, değerli olan şeyleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Deli", sembolAnlami: "Aklını kullanmamayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Delik", sembolAnlami: "Açık açmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Demir", sembolAnlami: "Gücü ve kuvveti simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Deniz", sembolAnlami: "Sınırsız bilgi kaynağını simgeler. Kollektif bilgidir. Kollektif bilgi olduğu için de kirli veya temiz bilgiyi içerebilir. Hem de deniz tuzlu olabileceği için, tuzun zehir ve şifa anlamı vardır. Bundan dolayı rüyasında deniz gören kişinin şifa niyetiyle sadaka vermesi uygun olur. Bazen de deniz, devleti ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Deniz Feneri", sembolAnlami: "Yardım almayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Deprem", sembolAnlami: "Silkelenip kendine gelmeyi simgeler. Silkelenme sonrası herşeyin daha sağlam olacağına işaret eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Deri", sembolAnlami: "Bkz. Cilt"),
            RuyaSembol(sembolResim: "", sembolisim: "Dernek", sembolAnlami: "Kişinin sadaka ve zekat gibi konularda daha verici olması gerektiğini simgeler. Bazen yardım konularında başı çekmesi gerektiğini ya da vesile olması gerektiğini ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Ders Çalışmak", sembolAnlami: "Yakın zaman da hayat sınavı olacağını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Derviş", sembolAnlami: "Maddesel değerlerden yani dünyalık işlerden bir süre uzaklaşmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dev", sembolAnlami: "Kişinin devleştiği yanını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Deve", sembolAnlami: "Ticareti simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Devekuşu", sembolAnlami: "Birşeylerden kaçmayı ve saklanmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Diken", sembolAnlami: "çinde bulunulan zor yada zor gibi görünen bir durumdan sonra güzel bir sonuç elde etmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dikenli Ot", sembolAnlami: "Kişinin, derdinin dermanı olmadığı ya da derdini kendisinin şifalalandırması gerektiği düşüncesini, simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dikiş Dikmek", sembolAnlami: "Yeni bir hal oluşturmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dil", sembolAnlami: "Konuşmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dilekçe", sembolAnlami: "Talepkar olmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dilenci", sembolAnlami: "Sadaka verilmesi gerektiğini ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Dinozor", sembolAnlami: "Yeniliklere açık olmamayı ve eskiye bağlı hareket etmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Diploma", sembolAnlami: "Hayat sınavında başarılı olduğunu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Direk", sembolAnlami: "Sağlamlığı simgeler. O şeyin değerli olduğunu ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Direksiyon", sembolAnlami: "Hayatın kontrolünü simgeler. Hayatınızın kontrolü kimin elinde onu ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Dirsek", sembolAnlami: "Bir şeyden güç almayı ve ona güvenmeyi simgeler. Desteği ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Diş", sembolAnlami: "Kardeşleri, ev halkını ve aile üyelerini simgeler. Üst diş, yakın aile üyelerini; alt diş, ara sıra görüşülen aile üyelerini ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Diz", sembolAnlami: "Direnci simgeler. Bazen direnç göstermeyi bazen de saygı duymayı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Dizler", sembolAnlami: "Diz rahatsızlıkları, kişinin direnç gösterdikleri ya da göstermedikleri ile ilgilidir. Kişi direnç göstermez ve saygı duyar. Bazen de kişinin mecazi olarak diz çökmesi ya da kuvvet alıp kalkması ile ilgilidir."),
            RuyaSembol(sembolResim: "", sembolisim: "Doğal Taş", sembolAnlami: "Taşın anlamına göre yorumlanır."),
            RuyaSembol(sembolResim: "", sembolisim: "Doğum Günü", sembolAnlami: "Kişinin yeni keşfettiği potansiyelini Rüya: simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Doğum Haritası", sembolAnlami: "Yeni bir başlangıcın yakın olduğunu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Doğum Yapmak", sembolAnlami: "Yeni bir başlangıç yapmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Doktor", sembolAnlami: "Şifacılığı simgeler. Görülen doktorun branşı şifa hakkında fikir verir."),
            RuyaSembol(sembolResim: "", sembolisim: "Dolandırıcı", sembolAnlami: "Kişinin kendini aldattığı ve akıllıca davranmadığı durumları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dolap", sembolAnlami: "Kişinin hallerindeki zenginliği simgeler. Her bir elbise kişinin içinde bulunduğu bir hali ve diğer insanlara karşı takındığı bir yönünü ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Dolunay", sembolAnlami: "Anneliğin tam olarak yapılabildiği durumları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Domuz", sembolAnlami: "Haramı simgeler. Maddi, manevi haksız ve ahlaksız kazancı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Dosya", sembolAnlami: "Eski hesapları ya da kapanmamış eski hesapları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dövmek", sembolAnlami: "Bkz. Dayak"),
            RuyaSembol(sembolResim: "", sembolisim: "Drone", sembolAnlami: "Kişinin, başkaları tarafından gizlice gözetlendiğini, simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dua", sembolAnlami: "Manevi talepleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Duman", sembolAnlami: "Düşünceli olma halini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Durak", sembolAnlami: "Kişinin hayatta nefes aldığı ya da beklemeye geçtiği dönemleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dut", sembolAnlami: "Daha az ve öz konuşmayı, ya da konuşulması gerektiğini, simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Duvar", sembolAnlami: "Düşünce kalıplarını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Düğüm", sembolAnlami: "Kişinin kendisini veya başkasını zora soktuğu durumları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Düğün", sembolAnlami: "Evlilik, ortaklık ve sevindirici gelişmeleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dükkan", sembolAnlami: "Direk maddi kazançları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dünya", sembolAnlami: "Madde alemi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dünya Dışı", sembolAnlami: "Madde dışı alemi ve diğer alemleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Dürbün", sembolAnlami: "İleriyi görebilmeyi ve öngörüyü simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Düşmek", sembolAnlami: "Bir işi başaramamayı, yapamamayı ve frekansın düşmesini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Ebe", sembolAnlami: "Aile dışı kurulan yakın ilişkileri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Ehliyet", sembolAnlami: "Hayatının sorumluluğunu alabilecek beceriye sahip olmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Ejderha", sembolAnlami: "Kişinin içindeki gücünü simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Ekin", sembolAnlami: "Emeği simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Ekmek", sembolAnlami: "Rızkı simgeler. Babadan gelen rızkı da simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "El", sembolAnlami: "Şifayı simgeler. Bazen de kişinin aldıklarını ve verdiklerini ifade eder. Bazen de bir işi yapmaya başlamayı temsil eder."),
            RuyaSembol(sembolResim: "", sembolisim: "El İçi (Avuç İçi)", sembolAnlami: "Şifayı simgeler. Avuç içi kişinin imzası gibidir. Kişi kendi eli ile ne yapıyorsa onun yansımalarını kendi hayatında görecektir. Helale dikkat ederek yaşayan insanın eli şifalıdır. Çünkü elin içerisinde bakteriler vardır ve kişinin yaşam tarzı o bakterileri etkiler. Bundan dolayı bazı kişilerin elinden çıkan yemekler, dikilen kıyafetler vs. diğer insanlara hayırlı ve iyi gelirken bazılarının ki iyi gelmez."),
            RuyaSembol(sembolResim: "", sembolisim: "El Öpmek", sembolAnlami: "Rıza almayı simgeler. O kişinin onayını ve müsadesini almayı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "El Sıkışmak", sembolAnlami: "Anlaşmayı ve uzlaşmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Elbise", sembolAnlami: "Kişinin o an içinde bulunduğu ve diğer insanlara karşı takındığı durumu, hali simgeler. Her elbise kişinin bir halini ve yönünü anlatır. Kıyafetin rengi de için de bulunduğu duygu durumu hakkında bilgi verir. Dikkat! Eski elbise, kendini yenileyemediğini anlatır. Yırtık ise kişinin kendini gözden geçirmesi gerekir. Fakat o anda yırtıldıysa kişi o anda yaptığı işi sorgulamalı. Ama yaşlı bir insanı eski veya yırtık kıyafetler içerisinde görmek kişinin halleri değildir. Bu kişi mübarek bir zat olabilir ya da kişinin ataları olabilir. Ayrıca bazen yırtık pırtık kıyafet içindeki hazineyi keşfedememeyi de anlatabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Elçi", sembolAnlami: "Aracıyı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Elma", sembolAnlami: "Yeni hayat formunu simgeler. Isırılmış elma, yasaklanan yaşam formunu ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Elma Ağacı", sembolAnlami: "Yeni yaşam genini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Elma Çiçeği", sembolAnlami: "Frekansı ve enerji değişimini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Elmas", sembolAnlami: "Kişinin en yüksek idrak noktasında olduğu hali simgeler. Bu kişi,ne yaparsa yapsın çevresindeki insanlar tarafından her zaman kabul görür."),
            RuyaSembol(sembolResim: "", sembolisim: "Emzirme", sembolAnlami: "Beslemeyi simgeler. Beslenen bir düşünceyi veya durumu ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Engelli", sembolAnlami: "Kişinin engellediği ve kullanamadığı yönünü simgeler. Rüyada kişi engeli nerede görüyorsa kendisinde kullanamadığı yönü orasıdır."),
            RuyaSembol(sembolResim: "", sembolisim: "Enstürman Çalmak", sembolAnlami: "Bkz. Çalgı Çalmak"),
            RuyaSembol(sembolResim: "", sembolisim: "Erkek (Eril-Oğlan)", sembolAnlami: "Gücü simgeler. Rüyada görülen Rüya: her erkek için geçerlidir."),
            RuyaSembol(sembolResim: "", sembolisim: "Eski Ev", sembolAnlami: "Ata evini veya yenilenmeyi simgeler. Kişi halen oturduğu evi eski görüyorsa kendisini yenilemesi gerekir. Fakat hiç tanımadığı eski bir eve veya köy evine gittiğini görüyorsa; ata evine gitmiş demektir."),
            RuyaSembol(sembolResim: "", sembolisim: "Eski Sevgili", sembolAnlami: "O ilişkide neler yaşandığına bakılması gerekiyor."),
            RuyaSembol(sembolResim: "", sembolisim: "Eski Şeyler", sembolAnlami: "Kişi eski olarak neyi görüyorsa onun sembol değerine göre yorum yapması gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Eskici", sembolAnlami: "Kişi eskiciye neyi verdiğini görüyorsa onun sembol değerine göre yorum yapması gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Esnemek", sembolAnlami: "Çözülmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Eş", sembolAnlami: "Kadın için eşi, eril halini; erkek için eşi, dişil halini simgeler. Kadının eşi, babası ile ilgili bilinçaltı kayıtlarını ve kişinin gücünü ifade eder. Erkeğin eşi, annesi ile ilgili bilinçaltı kayıtlarını ve kişinin üretkenliğini temsil eder. Eğer olumsuz olan bilinçaltı kayıtları şifalanırsa kişi rüyasında eşini başka biri olarak hem de daha iyi bir surette görebilir. Kişide gerçekleşen iyileşme normal hayatta eşine de yansır. Bundan dolayı eş ile ilgili problemlerde önce ebeveynle ilgili hangi olumsuz bilinçaltı kaydı var ise rüyada sorulmalı ve şifalandırma çalışması yapılmalıdır."),
            RuyaSembol(sembolResim: "", sembolisim: "Eşek", sembolAnlami: "Fedakarlığı simgeler. Bilinçli olarak başkalarına ait sorumlulukları almayı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Eşik", sembolAnlami: "Ani geçiş yerini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Eşinin Ailesi", sembolAnlami: "Kişinin kendi ailesi gibi değerlendirilir. Fakat burada kişinin gücü önemlidir."),
            RuyaSembol(sembolResim: "", sembolisim: "Eşkiya", sembolAnlami: "Zorbalığı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Eşortman", sembolAnlami: "Kişinin rahat davrandığını ya da rahat olunması gerektiğini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Eşya", sembolAnlami: "Kullanım amacına göre değerlendirilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Et", sembolAnlami: "Bkz.Çiğ Et"),
            RuyaSembol(sembolResim: "", sembolisim: "Etiket", sembolAnlami: "Sosyal statüyü simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Ev", sembolAnlami: "İnsanın kendisini simgeler. Birçok ev görmek kollektifi ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Antresi", sembolAnlami: "Arada kalmayı ve karar verememeyi simgeler. Geçiş yerlerini de ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Avlusu", sembolAnlami: "Kişinin aurasının kapalı olduğunu ifade eder. Diğer insanlarla iletişimi zayıftır."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Bahçesi", sembolAnlami: "Aurayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Balkonu", sembolAnlami: "Sosyallikteki etkileşimi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Banyosu", sembolAnlami: "Arınmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Bodrumu (Mahsen)", sembolAnlami: "Arınmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Boş Odaları", sembolAnlami: "Kullanılmayan potansiyelleri simgeler. Rüyada yeni fark edilen boş odalar, kişinin farkında olmadığı potansiyelleri olduğunu ifade eder. Mesela kişi iyi bir aşçıdır fakat bu yeteneğini daha keşfetmemiş olabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Camları", sembolAnlami: "Bakış açılarını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Çatısı", sembolAnlami: "Çatının en üstüne çıkmak, akılcı işler yapmamayı, kontrolsüzlüğü simgeler. Mantık sınırlarının dışına çıkmayı ifade eder. Bazen de anneyi, koruyuculuğu ve güveni temsil eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Çocuk Odası", sembolAnlami: "Kişinin çocukluk kayıtlarını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Dağınık Olması", sembolAnlami: "Hayatını düzene sokamadığını düşünmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Ebeveyn Odası", sembolAnlami: "Ata kayıtlarını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin İçine Girmek", sembolAnlami: "Kabul etmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Kapısı", sembolAnlami: "Güvenliği simgeler. Bazen de başka bir boyuta geçmeyi ifade eder. Mesela kişi fakirken zengin olabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Kileri", sembolAnlami: "Birikimleri ve kazanımları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Kolunu", sembolAnlami: "Babayı ya da kişiyi ayakta tutan Rüya: şeyleri, simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Misafir Odası (Salon)", sembolAnlami: "Yakın sosyal ilişkileri ve sosyalliği simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Mutfağı", sembolAnlami: "Çalışma ve rızık alanını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Müstakil Olması", sembolAnlami: "Şahsına münhasır, kendine özgü insanları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Şömine (Evin Sobası)", sembolAnlami: "Kişinin kalbini simgeler"),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Tahtadan Olması", sembolAnlami: "Kişinin genetik kodlarını ve aktarımlarını ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Terası", sembolAnlami: "Frekans yüksekliğini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Tuvaleti", sembolAnlami: "Kişinin tutunduğu veya bıraktığı şeyleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Yanması", sembolAnlami: "Bkz.Evin Yıkılması."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Yatak Odası", sembolAnlami: "Kişinin özel alanını ve kök çakrayı simgeler. Vicdani duyguları, iç hesaplaşmaları da ifade eder.Eğer yastık ile beraber görülürse iç hesaplaşmalara, gizli düşüncelere bakılmalı. Yorgan ile beraber görülürse kişinin özel hayatındaki savunmasızlığına, yalnızlık duygusuna bakılmalı, çarşaf veya yatak ile beraber görülürse kök çakra ile ilgili konulara bakılmalıdır."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Yıkılması", sembolAnlami: "Köklü değişimi simgeler. Bu rüyayı gören kişi değişimin hayırlı, kolay ve hızlı olması için sadaka verip dua etmelidir."),
            RuyaSembol(sembolResim: "", sembolisim: "Evin Yüksekliği", sembolAnlami: "Frekans yüksekliğini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evlenmek", sembolAnlami: "Ortaklığı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evliya", sembolAnlami: "Allah dostlarını, ruhani varlıkları ve ruhsal rehberleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Evrak", sembolAnlami: "Kayda geçirilmesi gereken şeyler olduğunu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Ezan Sesi Duymak", sembolAnlami: "Maneviyata çağrı yapmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Fabrika", sembolAnlami: "Kişinin üretkenliğini ve üretim kapasitesini simgeler. Mesela bir öğretmen fabrika görse o fabrikadan mezun olmuş çocuklar çıkar."),
            RuyaSembol(sembolResim: "", sembolisim: "Fal", sembolAnlami: "Ehil olmayan kişilerden öngörü almayı simgeler. Arada kalınan ve karar verilemeyen dönemleri ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Falaka", sembolAnlami: "Yardım almayı simgeler. Hayatta atılan adımlarda destek görmeyi ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Falcı", sembolAnlami: "Bkz.Fal"),
            RuyaSembol(sembolResim: "", sembolisim: "Fare", sembolAnlami: "Kaygıları ve kuşkuyu simgeler. Kişiyi kemiren negatif düşünceleri ve vesveseleri ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Fare Deliği", sembolAnlami: "Hayatta yaratılan açıkları simgeler. Mesela kötü bir insana yüz vermek,fare deliği açmayı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Farklı Rüyalarda Hep Aynı Yeri Görmek", sembolAnlami: "Kişi farklı rüyalarında hep aynı yeri görüyorsa orada takılıp kaldığı bir şeyler vardır."),
            RuyaSembol(sembolResim: "", sembolisim: "Fatura", sembolAnlami: "Ödenmesi gereken bedeller olduğunu simgeler. Kişinin yaptıkları ya da yapacakları ile ilgili olabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Felçli Birini Görmke", sembolAnlami: "Hareket edememeyi simgeler. Felçli olarak kim görülüyorsa onun özelliğine dikkat edilmesi gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Fener", sembolAnlami: "Yol gösterici şeyleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Fındık", sembolAnlami: "Kendine güveni simgeler. Burunu Rüya: temsil eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Fırtına", sembolAnlami: "Başkalarından kaynaklı yada herkesi etkileyen, çok müdahale edilemeyen dönemleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Fidan", sembolAnlami: "Çocukluk ve gençlik dönemini Rüya: simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Fil", sembolAnlami: "Yeniliklere açık olmamayı ve eskiye bağlı hareket etmeyi, unutamamayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Fotoğraf", sembolAnlami: "Kişinin yaşadığı şeylerde hangi anları önemli kıldığını simgeler. Kişi neyin resmini çektiğini görüyorsa ona dikkat etmesi gerekir. Çünkü yaşadığı o ana önem veriyordur. Fotoğrafçı ise kişinin hangi bakış açısıyla o anı kayda aldığını anlatır. Fotoğrafçı olarak görülen kişinin özelliğine dikkat edilmesi gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Fotoğrafçı", sembolAnlami: "Bkz. Fotoğraf"),
            RuyaSembol(sembolResim: "", sembolisim: "Fujya Renk", sembolAnlami: "Kırmızı ve pembe karışımı olduğu Rüya: için kök çakra ile ilgili hayalleri Yorum: simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gaflete Düşmek", sembolAnlami: "Yanlışa düşmeyi simgeler. Kişinin Rüya: fark edemediği, göremediği şeyler Yorum: olduğunu ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Galibiyet", sembolAnlami: "Bir olayın veya durumun mutlu sonuçlanmasını simgeler. Kişinin nede galip geldiği dikkate alınarak yorum yapılmalıdır."),
            RuyaSembol(sembolResim: "", sembolisim: "Gam", sembolAnlami: "Kişinin gam ve kederli halinden kurtulmasını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gamze", sembolAnlami: "Kişinin pozitif olduğu zaman ortaya çıkacağı özellikleri olduğunu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Ganimet", sembolAnlami: "Hiç ummadık yerden gelen ve maddi değeri olan şeyleri simgeler. Para, mal veya mülkü ifade eder. Fakat beklentin olmadan sana geldiği için bu şeylerin bir kısmının dağıtılması uygun olur. Mesela şans oyunlarından gelen paralar gibi."),
            RuyaSembol(sembolResim: "", sembolisim: "Gar (Tren Garı)", sembolAnlami: "Geçmiş ile bağlantıyı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Garah", sembolAnlami: "Kullandığın yöntemi sağlama almayı simgeler. Araba ne kadar çoksa garajda, kişinin o kadar yöntemi vardır. A, B planı gibi."),
            RuyaSembol(sembolResim: "", sembolisim: "Gardiyan", sembolAnlami: "Kişinin olumsuz düşünce kalıplarını destekleyen insanları simgeler. Bazen kişilerin korkularını da ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Gardrop", sembolAnlami: "Bkz.Dolap"),
            RuyaSembol(sembolResim: "", sembolisim: "Garnizon", sembolAnlami: "Koruyucu güçleri (kişinin aklı, aldığı dua, manevi rehberler vs.) simgeler. Kişinin güçlü bir koruma altında olduğunu ifade eder. Fakat ordunun kimlerden oluştuğu önemlidir. Kişi kötü şeylerden koruma bekliyor ya da onlara hizmet ediyor olabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Garson", sembolAnlami: "Kişinin beslendiği şeye hizmet eden insanları simgeler. Mesela kişinin arkadaşının bilgisinden faydalanması ve arkadaşının ona hizmet etmesi gibi."),
            RuyaSembol(sembolResim: "", sembolisim: "Gasp Edilmek", sembolAnlami: "Başkasının hakkına girmeyi simgeler. Neyin gasp edildiğine dikkat edilmesi gerekir. Bu rüyayı gören kişi kendini sorgulamalı ve hak sahibine hakkını vermelidir.Ayrıca sadaka vermesi de uygundur."),
            RuyaSembol(sembolResim: "", sembolisim: "Gayret Etmek", sembolAnlami: "Gayret edilmesi gerektiğini simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gazete", sembolAnlami: "Kişinin hayatında haber değeri taşıyan önemli olayları simgeler. Özellikle tarih varsa bu tarih birebir doğru çıkabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Gazino", sembolAnlami: "Dünyanın gösteriş ve şatafatına dalmayı simgeler. Rüyayı gören kişinerede eğlenceye ve dünyanın şatafatlı haline kapıldım diye kendisini sorgulaması gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Gebelik", sembolAnlami: "Kişinin değişim sürecine girdiğini ve bunu fark etmesi gerektiğini simgeler. Yeniden doğuşu ifade eder. Kişi kaç aylık hamile ise değişim o kadar zaman önce başlamıştır. Fakat kişi farkında değildir. Doğuma ne kadar zamanı kaldı ise o kadar süre sonra hayatında yeni bir başlangıç olacaktır."),
            RuyaSembol(sembolResim: "", sembolisim: "Gece", sembolAnlami: "Hüznü ve karamsarlığı simgeler. Ayrıca kişinin uyanış arefesinde olduğunu da ifade eder. Gecenin ortasında ise kişinin maneviyatına yönelmesi ve dua etmesi gerekir. Gecenin en zifiri karanlığında ise, kişinin aydınlığa çıkması yakındır. Gece ama ufuktaki çizgi görünüyor ise, yeni bir dönem kişi için başlıyor demektir."),
            RuyaSembol(sembolResim: "", sembolisim: "Geçit", sembolAnlami: "Hedefe giden ve yolu kısaltan yöntemlerin olduğunu simgeler. Kişi aklını kullanmalı ve daha gözü açık olmalıdır."),
            RuyaSembol(sembolResim: "", sembolisim: "Gelin Çiçeği", sembolAnlami: "Kısmetin açılmasını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gelinlik", sembolAnlami: "Arzu edilen şeye kavuşmayı simgeler. Gelinliği kim giyiyorsa o kişinin arzusuna bakılmalıdır. Rüyayı gören kişi için o arzu gerçekleşecektir."),
            RuyaSembol(sembolResim: "", sembolisim: "Gemi", sembolAnlami: "Muhafaza edilmeyi, güvende olmayı ve korunarak gitmeyi simgeler. Bazen gizlenen ilimleri de ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Geminin Sirenini Duymak", sembolAnlami: "Maneviyata çağrı yapmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "General", sembolAnlami: "Toplumu yöneterek yön vermeyi ve saygınlık, itibar kazanmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gergedan", sembolAnlami: "Soydan gelen gücü ve eril gücü simgeler. Siyasi bir güç, cinsel bir güç ya da kişinin genlerinde taşıdığı bir güç gibi olabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Geyik", sembolAnlami: "Kişiye güç verecek hediyeleri simgeler. Bu Allah'tan gelen hediyelerde olabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Gezegen", sembolAnlami: "Kişinin özelliklerinden bahseder. Her gezegen kişinin farklı bir yanını ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Girdaba Kendini Bırakmak", sembolAnlami: "Teslim olmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gişe", sembolAnlami: "Hak kazanmak için uğraşmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gizlenmek", sembolAnlami: "Kişinin gizlemeye çalıştığı halini simgeler. Kimi gizlenmiş görüyorsa, kendindeki o hali diğer insanlardan gizlemeye çalışıyordur."),
            RuyaSembol(sembolResim: "", sembolisim: "Gonca", sembolAnlami: "Duyguların canlanmasını simgeler. Kişi hangi çiçeğin tomurcuğunu görüyorsa o duygusunun canlanacağını anlayabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Göbek", sembolAnlami: "Manevi bağ ile kurulan ilişkileri simgeler. Gönülden bağlı olan herkesi ifade eder. Özellikle kişinin çocuklarını da temsil eder. Bu rüyayı gören kişinin belki de bağlı olmaması gerekiyordur."),
            RuyaSembol(sembolResim: "", sembolisim: "Göç Etmek", sembolAnlami: "Köklü değişimi simgeler. Gerçek hayatta kişinin büyük değişiklikler yaşayacağına işaret eder. Göç edilen yere bakılarak yorum yapılması gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Göğe Çıkmak", sembolAnlami: "Maneviyatta yükselmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Göğüs", sembolAnlami: "Bir şeyi beslemeyi ve yeniden bir oluşumu simgeler. Kişinin kendisini yeniden büyütmesini ifade eder. Fakat iki göğsün arası kişinin inancını temsil eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Gök Gürültüsü", sembolAnlami: "Toplumsal olayları simgeler. Topluluk için geçici ama zor bir dönemi ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Gökdelen", sembolAnlami: "Gökdelenin içinde görülen ev frekansı simgeler. Evin bulunduğu kat dikkate alınarak kişinin frekansı hakkında değerlendirme yapılır. Ayrıca ev, gökdelenin en yukarı katında ise kişinin yükseleceğini ifade eder. Fakat gökdeleni karşıdan görmek kişinin birilerini örnek alarak yükselmesi gerektiğini anlatır."),
            RuyaSembol(sembolResim: "", sembolisim: "Gökkuşağı", sembolAnlami: "Cinsiyeti simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gökyüzü", sembolAnlami: "İlimi, mertebeyi ve yüksek frekansı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Göl", sembolAnlami: "Sırları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gölge", sembolAnlami: "Kişinin karanlık yanlarını simgeler. Kişinin tamamen negatif, bilinmeyen veya bastırmaya çalıştığı negatif yanları ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Gölge", sembolAnlami: "Kişinin gölge yanlarını simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gömlek", sembolAnlami: "Bkz.Ceket"),
            RuyaSembol(sembolResim: "", sembolisim: "Gömmek", sembolAnlami: "Kişinin kurtulmak istediği ve bir daha görmek istemediği şeyleri simgeler. Kişi bir şeyi gömdüğünü görüyorsa ona gömdüğü şey ile ilgili kazı yapılması gerekir. Çünkü kendisi gömdüğü şeyi unutmuştur ama bu bedenindedir ve onunla hareket ediyordur. Bundan dolayı o kişi ile konuşulmalıdır. Mesela rüyada kıskanç birini gömdüğünü gören kişi kıskançtır ama bunu zihin seviyesinde kabul etmez. O yüzden bu kişiye sen bu hareketi neden yaptın diyerek, o kıskanç halini ortaya çıkarmak gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Görünmez Olduğunu Görmek", sembolAnlami: "Olaylardan ve durumlardan sezgisel olarak haberdar olmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gösteriş", sembolAnlami: "Başkalarını etkilemek, kendini beğendirmek ya da böbürlenmek amacıyla yapılan şeyleri, simgeler. Yapılan şeyin gösteriş için yapıldığını ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Göz", sembolAnlami: "Mecazi anlamda görmek istemeyi veya görmek istememeyi simgeler. Ayrıca nazar gibi görülemeyen enerjileri de ifade eder. Mesela kötü bir göz görmek, kötü bir etki olduğunu, kişinin bunu fark etmediğini ve görmesi gerektiğini anlatır."),
            RuyaSembol(sembolResim: "", sembolisim: "Göz Kalemi", sembolAnlami: "Özellikle görülmesi gereken şeyler olduğunu simgeler. Sürme çekiliyorsa o şeyin altı çiziliyor demektir."),
            RuyaSembol(sembolResim: "", sembolisim: "Göz Kırpmak", sembolAnlami: "Kişinin gördüğü ama fark etmediği şeyleri simgeler. Bazı şeylerin farkında olunması gerektiğini, orada önemli şeyler olduğunu ve dikkat edilmesi gerektiğini ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Gözlem Evi", sembolAnlami: "Uzak ve yakın her türlü tehlikelerden emin olmayı veya olamamayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gözler", sembolAnlami: "Kişinin mecazi olarak görmek istemediği ya da göremediği şeyler, göz rahatsızlıklarına sebep olabilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Gözlük", sembolAnlami: "Daha iyi görmeyi simgeler. Kişinin yakınındaki çevresine ve şeylere olan anlık bakış açısını ifade eder. Geniş bakış açısı değildir. Kişi rüyasında gözlüğü bırakıyorsa onu almaya niyet etmelidir."),
            RuyaSembol(sembolResim: "", sembolisim: "Gözyaşı", sembolAnlami: "Şifalanmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gri", sembolAnlami: "Belirsizliği, dengeyi, uyumlanmayı, esnekliği, arafı ve geçiş dönemlerini simgeler. Dengeyi veya dengesizliği, uyumlanmayı veya uyumsuzlanmayı yani her iki gücü de bünyesinde barındırdığı için gri, geçiş dönemlerini ifade eder. Grinin yanındaki diğer renklere veya durumlar dikkate alınarak rüyanın yorumlanması gerekir."),
            RuyaSembol(sembolResim: "", sembolisim: "Gurbet", sembolAnlami: "Kendisini anlamayan insanların arasında olmayı, anlaşılamamayı ve yalnız hissetmeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gusül Abdesti", sembolAnlami: "Arınmayı ve kurtulmayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gül", sembolAnlami: "En yüksek frekanslı duyguyu simgeler. Manevi olarak kişinin en yüksek duyguya ulaşmasını, saf aşkı ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Gümüş", sembolAnlami: "Manevi aleme hayat veren ilimleri simgeler. Şifacıdır. Anneyi de ifade edebilir."),
            RuyaSembol(sembolResim: "", sembolisim: "Gümüş Para", sembolAnlami: "Manevi bedel ödemeyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Güneş", sembolAnlami: "Madde aleme hayat veren şeyleri Rüya: ve babayı simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Güney", sembolAnlami: "Kişinin hangi yönden geldiğini Rüya: simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Gürültü", sembolAnlami: "Kişinin zihnindeki kargaşayı simgeler. Zihin günlük hayatın kargaşası ile öyle meşguldür ki, kişi iç sesini duyamıyordur."),
            RuyaSembol(sembolResim: "", sembolisim: "Güvercin", sembolAnlami: "İlişkilerdeki sadakati simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Hacca Gitmek", sembolAnlami: "Kalbe yolculuğu simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Hacı", sembolAnlami: "Maneviyatını tamamlamış kişiyi simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Hademe", sembolAnlami: "Hayatta kişiye hizmet eden diğer insanları simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Hakem", sembolAnlami: "Oyunu kuralına göre oynamayı simgeler. Kişinin kendi halini kurallara göre şekillendirmesini ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Hakim", sembolAnlami: "Adaletli karar vermeyi simgeler. Her şeyi hakkı ile bilmeyi ve hakkı ile karar vermeyi ifade eder."),
            RuyaSembol(sembolResim: "", sembolisim: "Halat", sembolAnlami: "Kişinin tutunmaya çalıştığı şeyleri simgeler."),
            RuyaSembol(sembolResim: "", sembolisim: "Halı", sembolAnlami: "Etnik kökeni, anane, gelenek ve göreneği simgeler."),
            

            

            

        ]
        

        sembollerListesi += semboller

        // sembol ekleme işlemi burada bitiyor.
        

        
        
        
        
        let soru1 = SoruCevap(soruID: 1, soruIsim: "Eski Uygarlıklarda Rüya Ne Anlama Geliyordu?", soruCevap: "bosver")
        let soru2 = SoruCevap(soruID: 1, soruIsim: "Neden Rüya Görürüz?", soruCevap: "ben nerden bileyim aminakoiym")
        let soru3 = SoruCevap(soruID: 1, soruIsim: "Uyumadan Önce Beynine Komut Ver.", soruCevap: "Anlamaz")
        let soru4 = SoruCevap(soruID: 1, soruIsim: "Rüya Çeşitleri.", soruCevap: "15 KM")
        let soru5 = SoruCevap(soruID: 1, soruIsim: "Rüyanın Şifrelerini Çözmek?", soruCevap: "M1 AIR")
        let soru6 = SoruCevap(soruID: 1, soruIsim: "Rüya Çeşitleri.", soruCevap: "15 KM")
        let soru7 = SoruCevap(soruID: 1, soruIsim: "Rüya Çeşitleri.", soruCevap: "15 KM")
        let soru8 = SoruCevap(soruID: 1, soruIsim: "Rüya Çeşitleri.", soruCevap: "15 KM")
        let soru9 = SoruCevap(soruID: 1, soruIsim: "Rüya Çeşitleri.", soruCevap: "15 KM")
        let soru10 = SoruCevap(soruID: 1, soruIsim: "Rüya Çeşitleri.", soruCevap: "15 KM")
        let soru11 = SoruCevap(soruID: 1, soruIsim: "Rüya Çeşitleri.", soruCevap: "15 KM")
        let soru12 = SoruCevap(soruID: 1, soruIsim: "Rüya Çeşitleri.", soruCevap: "15 KM")

        
        soruListesi.append(soru1)
        soruListesi.append(soru2)
        soruListesi.append(soru3)
        soruListesi.append(soru4)
        soruListesi.append(soru5)
        soruListesi.append(soru6)
        soruListesi.append(soru7)
        soruListesi.append(soru8)
        soruListesi.append(soru9)
        soruListesi.append(soru10)
        soruListesi.append(soru11)
        soruListesi.append(soru12)

        
        
        
        // Sinifizdan Objeler olusturduk.
        
        
     





        
        
        
        



        
        
       // imageView.image = UIImage.gif(asset: "giris1")
        
        
        
    }
    // Veri Gonderirken Hazirlik  chatgpt ile düzeltildi
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ruya" {
            let destination = segue.destination as! tabbarController
            let destination0 = destination.viewControllers![0] as! SembolAramaViewController
            let destination1 = destination.viewControllers![1] as! SSSViewController
            //let destination1 = destination.viewControllers![1] as! RuyaSembollColletionViewViewController
            if let (semboller, sorular) = sender as? ([RuyaSembol], [SoruCevap]) {
                destination0.sembol = semboller
                destination1.soruCevapArray = sorular
            }/*
            if let veri = sender as? [RuyaSembol] {
                destination0.sembol = veri
                destination1.sembol = veri
            }*/
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
    
    
    // Semboller lisstesini prepare func gondermek! chatgpt ile düzeltildi
    @IBAction func ruyaSembolleriButton(_ sender: Any) {
        if let button = sender as? UIButton {
            applyButtonEffect(button: button)
        }
        
        let senderData = (sembollerListesi, soruListesi)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.performSegue(withIdentifier: "ruya", sender: senderData)
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
