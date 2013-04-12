GoruLab_Fourier
===============
### *Gülcan ÖZER - Melike SARAÇ - Özlem OKUMUŞ*

## Deforme Nesnelerin Fourier Tanımlayıcıları Üzerinden Otomatik Yürüyüş Analizi
<p>      Bu yazının amacı, insan yürümesinin uzay-zamansal hareketinin elde edilmesi ve sınıflandırılmasında Fourier tanımlayıcılarının kullanımını araştırmaktır.</p> Fourier tanımlayıcıları iki-boyutlu şeklin sınırlarını gösteren bir yöntem olarak oluşturulmuştur. Fourier tanımlayıcılarının önemli bir avantajı, Fourier alanında bir şekli temsil ederken, kolayca kendi frekans bileşenlerine erişebilir olmasıdır. Fourier tanımlayıcı değerleri, şekli tanımlayan resme, frekans domaininde fourier transformasyonunun yapılması sonucu üretilir. Düşük frekanslı tanımlayıcılar şekle ait genel bilgileri içerirken yüksek frekanslı tanımlayıcılar daha ince detayları tanımlamaktadır. Böylece fourier tanımlayıcılarının düşük frekanslı  bileşenleri orijinal nesneyi daha kaba bir şekilde tanımlarlar.
 <p>     İnsan yürüyüşü göz önüne alındığında periyodik bir deformasyon sergiler. Periyodik deformasyon şekiller dizisini, bir yürüyüş döngüsü(bir periyot) gibi ele alabiliriz. Bu görüntü dizisi içindeki şekil sınırının deformasyonu, iki boyutlu ayrık Fourier serisi ile temsil edilebilir. Bu serinin Fourier katsayıları, yürüyüş döngüsünün bütününü karakterize eder. Bu katsayılar,  Fourier dönüşümünün ayrılabilirlik özelliğini kullanarak, iki ayrı, tek boyutlu kompleks Fourier dönüşümleri ile hesaplanabilir. </p>
 <p>  Bir yürüyüş dizisinden öznitelik türetmek için sırayla her bir görüntü öncelikle ön işleme tabi tutulur. Her bir yürüyüşün özniteliğini çıkarmak için kullanılan sürece genel bakış şöyledir:
<p> Öncelikle arka plan çıkarılır (renk anahtarı ile).Her görüntü, bir siluet üretmek için eşiklenir. Her bir görüntüde kompleks sınır sinyali üretmek için sınırlardaki her bir nesne izlenerek dış kontur çıkarılır. Bunun ötesinde, doğrusal enterpolasyon, her bir kare için düzenli örneklenmiş veri noktaları eşit sayıda(256) ayıklanarak yapılır. Gerçek bir yürüyüş özniteliğini üretmek için karmaşık sınır sinyallerinin uzay-zamansal fourier tanımlayıcıları, denklemin eşdeğerini, bir trigonometrik denklem kullanarak hesaplar ve elde edilen büyüklük spektrumu yürüyüş özniteliği olarak kullanılır. Sınıflandırma açısından bu yürüyüş imzalarını kullanmak için tanımlanmış her bir nesnedeki tanımlayıcı sayısını azaltmak gerekir. Bu, iki nedenden dolayı gereklidir: Birincisi, sınıflandırma için sadece yararlı olacak tanımlayıcıları çıkarmak, ikincisi ise özellik alanının boyutunu azaltmak - uygun sınıflandırma hızını sağlamaktır. Yukarıda belirtildiği gibi, bu durumda özellik seçiminin temel amacı, Correct Classification Rate (CCR) için nesneler içi varyansı azaltmak ve nesneler arası varyansı artırmaktır. Bunu sağlamak için sınıf kovaryanslarına  göre sınıflar arası ayrımı  ölçmekde  metrik  Bhattacharyya mesafesinin  bir varyasyonu  kullanılır. Bu yeni tekniğin tanıma yeteneklerini test etmek için, uzay-zamansal Fourier tanımlayıcıları Southampton Üniversitesi'nde Large Gait Database’den ndaki her bir nesne için hesaplanmıştır. Bu veritabanı 115 nesne ve 1062 dizisinden oluşur. Sınıflandırma, K-en yakın komşu sınıflandırıcı ve leave-one-out kuralı ile çapraz doğrulama kullanılarak yapılır. 
  <p>  Bu nedenle, insan yürüyüşü ile ilişkili tam, kompakt(yoğun) ve uzay-zamansal hareketi ele geçiren bir görüntü dizisinden bir Fourier tanımlayıcıyı ayıklamak için yeni bir teknik kullanıldı.
  <p> İnsan yürüyüşünün temel hareketi, Fourier tanımlayıcılarının nispeten düşük bir kısmında yakalanır ve böyle bir mesafeden nesnelerin tanımlanması için gerekli olan çok düşük çözünürlüklü görüntü dizilerinden, doğru Fourier tanımlayıcılarının çıkarılmasına izin verilir. Bir ikincil teknik ise, kayıp zamansal verilerinin yeniden yapılanmasında hangi yardımcıların olacağını ortaya koyar ve eksik verilerin makul bir miktarını içeren dizilerden hesaplanabilir olanlarına doğru Fourier tanımlayıcılar için olanak sağlar. % 85 üzerindeki tanıma oranı, bu yeni tekniğin otomatik yürüyüş tanımada ümit vaat ettiğini gösteren Southampton Large Gait Database’den elde edilmiştir.










