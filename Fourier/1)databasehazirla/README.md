Dosyalara daha kolay erişmek için datastore tasarla,

	etiket{frmID, cekimID, personID} = actID
	fg_fnms{frmID, cekimID, personID} -> 'fg01_01_001.jpg'
	vf_fnms{frmID, cekimID, personID} -> 'im01_01_001.bmp'

Kayıt yeri: `../_db/datastore.mat`

#  İncele - Düzenle
# Önhazırlık

[SDHA2010] veritabanı kullanılacak. **Nasıl** temin edileceğine dair ayrıntı
[SDHA2010]'nın sayfasından erişilebilir.

Bu dizin altında ilgili veritabanıyla **arayüz** sağlanacak. Matlab ile kolay
işlenebilir forma dönüştürülecek.

IN:
	- `_db/sdha2010/` veritabanını alır

OUT:
	- `_db/bbox/` klasöründe resimleri toplar
	- `_db/data.mat` üretir

## Nasıl

Burada `Video_Frames` klasörü altında renkli resimler
`im<actID>_<seqID>_<frmID>.bmp` ve bunların arkaplan çıkarılmış halleri
`Foreground_Masks` klasörü altında `fg<actID>_<seqID>_<frmID>.jpg` formundadır.

### data.mat

Burada istenenleri gerçekleyeceğimiz işlev: `data_store.m` olarak belirlendi.

Önerilen yaklaşım dosya isimlerindeki ortak alanı (`<actID>_<seqID>_<frmID>`)
tutan `fnms` isminde bir hücrede tutulur,

	fnms{personID, cekimID, frmID}

burada

- `personID`: 1-6 arasında değer alır

- `cekimID`: 1-2 değerlerini alır

- `frmID`: duruma göre değişiklik gösterir

örnek olarak `im01_01_001.png` için `fnms{1,1,1}` değeri `01_01_001` olmalıdır.

Diğer taraftan eylem bilgilerini (etiketlerini) tutmak için de `fnms` ile aynı
boyutlu `etiket` hücresi kullanılacak,

	etiket{personID, cekimID, frmID}

Ayrıntılar [SDHA2010]'dan bakılmak kaydıyla `9` farklı eylemin olduğunu
hatırlatmak isterim. Örnek olarak `im01_01_001.png` için `etiket{1,1,1}` değeri
`01` olmalıdır.

Bu iki hücre `data.mat` olarak kaydedilir.

Bu ortak dosya isminden tam dosya ismine/yola geçmek için iki adet yardımcı
işlev tasarlanacaktır.

	function ffnm = fnm4video(personID, cekimID, frmID)
	%
	% Usage:
	% 	ffnm = fnm4video(1,1,1); % ffnm = 'Video_Frames/im01_01_001.png'

	function ffnm = fnm4foreground(personID, cekimID, frmID)
	%
	% Usage:
	% 	ffnm = fnm4foreground(1,1,1); % ffnm = 'Foreground_Masks/im01_01_001.jpg'

### bbox

Veritabanı tarafından sağlanan `bbox.mat` yardımıyla resimler kırpılıp, `bbox/`
klasörü altına alınır, aynı dizin yapısı ve isimlendirmesiyle.

`bbox.mat` ile yüklenen dosyada `bbox` değişkeni geliyor ve üç alana sahip:
`attribute`, `actionMap`, `data`.

> nurettins: DIPimage'in bbox işleviyle çakışıyor,
>
> 1. `bbox.mat` yüklenip, içerisinde gelen `bbox` değişkeni `bbx` olarak tekrar
> kaydedilebilir (bir kereliğine)
> 2. içte müdahele edilebilir. `>> t = load('bbox.mat')` ile çakışma önlenir.
>
> ben ikincisini tercih ediyorum.

	>> bbox.actionMap
	1: pointing 2: standing 3: digging 4: walking 5: carrying 6: running 7:
	wave1 8: wave2 9: jumping

	>> bbox.attribute
	1: actID 2: seqID 3: frameID 4: ul_corner_x 5: ul_corner_y 6: width_x 7:
	width_y

	>> bbox.data
	5178x7 double dizidir

Bu amaçla `bbox_crop` yardımcı işlevi hazırlanacaktır.

	function bbox_crop(dbnm, bbox, dbnm_bbox, dbg)
	%function bbox_crop(dbnm, bbox, dbnm_bbox, dbg)
	%
	% IN:
	% 	dbnm: sdha2010 db ismi
	% 	bbox: bounding box yapisi (db tarafindan saglanan)
	% OUT:
	% 	dbnm_bbox: kirpilmis resim db'si

## Ayrıntı

Her bir kişi için, farklı çekimlerde, eyleme göre de değişerek farklı sayıda
frame oluyor. Bu yüzden belki dizi

	fnms[personID, cekimID, frmID]

yerine hücre

	fnms{personID, cekimID, frmID}

kullanmak gerekebilir.

Örnek Matlab çalışması,

	>> fnms{1,1,1} = '01_01_001'
	>> fnms{1,1,2} = '01_01_002'
	>> fnms{1,2,1} = '01_02_001'
	>> fnms{1,2,2} = '01_02_002'
	>> fnms{1,2,3} = '01_02_003'

dolayısıyla düşünmeye gerek yok, dizi değil hücre kullanılacak.

<!-- kaynaklar -->

[SDHA2010]: 			https://github.com/19/asid/wiki/sdha2010
