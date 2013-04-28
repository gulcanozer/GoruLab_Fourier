## Deforme Nesnelerin Fourier Tanımlayıcıları Üzerinden Otomatik Yürüyüş Analizi Raporu
<p> *Proje Üyeleri* : *Gülcan ÖZER - Melike SARAÇ - Özlem OKUMUŞ*
<p> *Projemizin konusu* : Deforme Nesnelerin Fourier Tanımlayıcıları Üzerinden Otomatik Yürüyüşünü analiz etmektir.
<p> *Projemizin amacı* : İnsan yürümesinin uzay-zamansal hareketinin elde edilmesi ve sınıflandırılmasından Fourier tanımlayıcılarının kullanımını araştırmaktır. 
<p> Projemize başlarken Deforme Nesnelerin Fourier Tanımlayıcıları Üzerinden Otomatik Yürüyüş Analiz makalesi çevrisi yapılarak okundu ve gerekli yöntem belirlendi. 
<p> Bir yürüyüş dizisinden öznitelik türetmek için sırayla her bir görüntü öncelikle ön işleme tabi tutulur. Her bir yürüyüşün özniteliğinin çıkarımının aşamaları şu şekildedir:
* Öncelikle arka plan çıkarılır.
* Her bir görüntüde sınır nesneler için dış kontur çıkarılır. 
* Görüntülerin 2 boyutlu hızlı fourier dönüşümleri alınır.
* Fourier dönüşümleri alınan görüntülerin DC bileşenleri görüntünün merkezine taşınır ve görüntünün kendisiyle örnekleme oluşturmak için nokta çarpımı yapılır.
* En son olarak oluşturduğumuz fonksiyonla görüntülerimiz ölçeklenerek nesnelerimiz görüntülenir.

<p> Bu algoritmaya göre oluşturduğumuz kodu örnek bir görüntü için çalıştırdığımızda elde ettiğimiz çıktı şu şekildedir :

![](http://k1304.hizliresim.com/18/w/mkbhg.png)
