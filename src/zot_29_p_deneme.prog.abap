*&---------------------------------------------------------------------*
*& Report zot_29_p_deneme
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_deneme.

"sayıları tek çift olarak ekrana yazan program
*DATA gv_sayi TYPE i.
*DO 101 TIMES.
*  IF gv_sayi MOD 2 EQ 0.
*    WRITE:/ 'Çift Sayı', gv_sayi.
*  ELSE.
*    WRITE:/ 'Tek Sayı', gv_sayi.
*  ENDIF.
*  gv_sayi = gv_sayi + 1.
*ENDDO.

"MOD - İF
*DATA: gv_index TYPE i.
*gv_index = 0.
*DO 10 TIMES.
*  gv_index = gv_index + 1.
*  IF gv_index MOD 2 EQ 0.
*    WRITE:/ '2''ye tam bölünen sayılar', gv_index.
*  ENDIF.
*ENDDO.
*ULINE.
*gv_index = 0.
*DO 10 TIMES.
*  gv_index = gv_index + 1.
*  IF gv_index MOD 3 EQ 0.
*    WRITE:/ '3''e tam bölünen sayılar', gv_index.
*  ENDIF.
*ENDDO.

*TABLES: zot_29_t_ogrenci.

"değişken tanımalama data elementi baz alarak.
*DATA: gv_ogr_id    TYPE zot_29_e_ogrenci_id,
*      gv_ogr_ad    TYPE zot_29_e_ogrenci_ad,
*      gv_ogr_soyad TYPE zot_29_e_ogrenci_soyad,
*      gv_ders_id   TYPE zot_29_e_ders_id,
*      gv_puan      TYPE zot_29_e_puan.

"structure ve internal table tanımlama
*DATA: gs_ogrenci TYPE zot_29_t_ogrenci,
*      gt_ogrenci TYPE TABLE OF zot_29_t_ogrenci.

*SELECT * FROM zot_29_t_ogrenci
*  INTO TABLE gt_ogrenci
*    WHERE ogr_ad EQ 'Seda'.
*
*SELECT SINGLE * FROM  zot_29_t_ogrenci
*  INTO gs_ogrenci.
*
*SELECT SINGLE ogr_id from zot_29_t_ogrenci
*  into gv_ogr_id.

*UPDATE zot_29_t_ogrenci SET ogr_ad = 'Zeynep'
*  WHERE ogr_id = 1.
*
*WRITE: 'Çalıştı'.


*gs_ogrenci-ogr_id    = 2.
*gs_ogrenci-ogr_ad    = 'Chippy'.
*gs_ogrenci-ogr_soyad = 'Pap'.
*gs_ogrenci-ders_id   = 3.
*gs_ogrenci-puan      = 75.
*INSERT zot_29_t_ogrenci FROM gs_ogrenci.
*WRITE: 'Çalıştı'.


*DELETE FROM zot_29_t_ogrenci WHERE ogr_id = 1.
*WRITE: 'Çalıştı'.


*gs_ogrenci-ogr_id    = 3.
*gs_ogrenci-ogr_ad    = 'Aslı'.
*gs_ogrenci-ogr_soyad = 'Yok'.
*gs_ogrenci-ders_id   = 3.
*gs_ogrenci-puan      = 55.
*MODIFY zot_29_t_ogrenci FROM gs_ogrenci.
*WRITE 'eklendi'.



*PARAMETERS p_sayi TYPE int4.
*START-OF-SELECTION.
*  WRITE:/  'Girilen Sayı ' , p_sayi.
*  IF p_sayi > 0 AND p_sayi < 25.
*    WRITE:/  'Girilen sayı 0-25 arasındadır.'.
*  ELSEIF p_sayi > 25 AND p_sayi < 50.
*    WRITE:/  'Girilen sayı 50-75 arasındadır.'.
*  ELSEIF  p_sayi > 50 AND p_sayi < 75.
*    WRITE:/  'Girilen sayı 50-75 arasındadır.'.
*  ELSEIF p_sayi > 75 AND p_sayi < 100.
*    WRITE:/  'Girilen sayı 75-100 arasındadır.'.
*  ELSEIF p_sayi > 100.
*    WRITE:/  'Girilen sayı 100''den büyüktür.'.
*  ENDIF.



*PARAMETERS p_sayi TYPE i.
*START-OF-SELECTION.
*  IF p_sayi < 0 OR  p_sayi > 100.
*    WRITE:/ '0 ile 100 arasında sayı giriniz.'.
*  ELSE.
*    WRITE :/ 'Harf notunuz: ' .
*    IF p_sayi >= 0 AND p_sayi <= 20.
*      WRITE 'FF'.
*    ELSEIF p_sayi >= 21 AND p_sayi <= 40.
*      WRITE 'DD'.
*    ELSEIF p_sayi >= 41 AND p_sayi <= 60.
*      WRITE 'CC'.
*    ELSEIF p_sayi >= 61 AND p_sayi <= 80.
*      WRITE 'BB'.
*    ELSEIF p_sayi >= 81 AND p_sayi <= 100.
*      WRITE 'AA'.
*    ENDIF.
*  ENDIF.


*PARAMETERS : p_sayi1 TYPE i OBLIGATORY,
*             p_sayi2 TYPE i OBLIGATORY,
*             p_sayi3 TYPE i OBLIGATORY.
*START-OF-SELECTION.
*  IF p_sayi1 BETWEEN p_sayi2.
*    WRITE:/ 'Birinci Sayı ve İkinci Sayı Arasındadır'.
*  ELSEIF p_sayi1 BETWEEN p_sayi3.
*    WRITE:/ 'Birinci Sayı ve Üçüncü Sayı Arasındadır'.
*  ELSEIF p_sayi2 BETWEEN p_sayi3.
*    WRITE:/ 'İkinci Sayi ve Üçüncü Sayı Arasındadır'.
*  ENDIF.


*PARAMETERS : p_sayi1 TYPE i OBLIGATORY,
*             p_sayi2 TYPE i OBLIGATORY,
*             p_sayi3 TYPE i OBLIGATORY.
*START-OF-SELECTION.
*  IF ( p_sayi1 LT p_sayi2 AND p_sayi1 GT p_sayi3 ) OR ( p_sayi1 GT p_sayi2 AND p_sayi1 LT p_sayi3 ).
*    WRITE: / 'birinci sayı diğer iki sayının arasındadır.'.
*  ELSEIF ( p_sayi2 LT p_sayi1 AND p_sayi2 GT p_sayi3 ) OR ( p_sayi2 GT p_sayi1 AND p_sayi2 LT p_sayi3 ).
*    WRITE: / 'ikinci sayı diğer iki sayının arasındadır.'.
*  ELSEIF ( p_sayi3 LT p_sayi1 AND p_sayi3 GT p_sayi2 ) OR ( p_sayi3 GT p_sayi1 AND p_sayi3 LT p_sayi2 ).
*    WRITE: / 'üçüncü sayı diğer iki sayının arasındadır.'.
*  ENDIF.


*PARAMETERS : p_sayi1 TYPE i OBLIGATORY,
*             p_sayi2 TYPE i OBLIGATORY,
*             p_islem TYPE c OBLIGATORY.
*DATA gv_sonuc TYPE i.
*START-OF-SELECTION.
*  CASE p_islem.
*    WHEN '+'.
*      gv_sonuc =  p_sayi1 + p_sayi2.
*      WRITE: / 'Toplama işleminin sonucu: ', gv_sonuc.
*    WHEN '-'.
*      gv_sonuc =  p_sayi1 - p_sayi2.
*      WRITE: / 'Çıkarma işleminin sonucu: ', gv_sonuc.
*    WHEN '*'.
*      gv_sonuc =  p_sayi1 * p_sayi2.
*      WRITE: / 'Çarpma işleminin sonucu: ', gv_sonuc.
*    WHEN '/'.
*      gv_sonuc =  p_sayi1 / p_sayi2.
*      WRITE: / 'Bölme işleminin sonucu: ', gv_sonuc.
*  ENDCASE.


*PARAMETERS: cbox1 AS CHECKBOX, "2 ekle
*            cbox2 AS CHECKBOX, "3 ekle
*            cbox3 AS CHECKBOX. "5 ekle
*DATA: gv_sonuc TYPE i VALUE 10.
*IF cbox1 EQ abap_true.
*  gv_sonuc = gv_sonuc + 2.
*ENDIF.
*IF cbox2 EQ abap_true.
*  gv_sonuc = gv_sonuc + 3.
*ENDIF.
*IF cbox3 EQ abap_true.
*  gv_sonuc = gv_sonuc + 5.
*ENDIF.
*WRITE: / gv_sonuc.


*PARAMETERS: p_sayi1 TYPE i,
*            p_sayi2 TYPE i.
*PARAMETERS: rb1 RADIOBUTTON GROUP gp1, "toplama
*            rb2 RADIOBUTTON GROUP gp1, "çıkarma
*            rb3 RADIOBUTTON GROUP gp1, "çarpma
*            rb4 RADIOBUTTON GROUP gp1. "bölme
*DATA: gv_sonuc TYPE i.
*START-OF-SELECTION.
*  IF rb1 EQ abap_true.
*    PERFORM toplama.
*  ELSEIF rb2 EQ abap_true.
*    PERFORM cikarma.
*  ELSEIF rb3 EQ abap_true.
*    PERFORM carpma.
*  ELSEIF rb4 EQ abap_true.
*    PERFORM bolme.
*  ENDIF.
*FORM toplama.
*  gv_sonuc = p_sayi1 + p_sayi2.
*  WRITE:/ p_sayi1 , '+' , p_sayi2 , '=' , gv_sonuc.
*ENDFORM.
*FORM cikarma.
*  gv_sonuc = p_sayi1 - p_sayi2.
*  WRITE:/ p_sayi1 , '-' , p_sayi2 , '=' , gv_sonuc.
*ENDFORM.
*FORM carpma.
*  gv_sonuc = p_sayi1 * p_sayi2.
*  WRITE:/ p_sayi1 , '*' , p_sayi2 , '=' , gv_sonuc.
*ENDFORM.
*FORM bolme.
*  gv_sonuc = p_sayi1 / p_sayi2.
*  WRITE:/ p_sayi1 , '/' , p_sayi2 , '=' , gv_sonuc.
*ENDFORM.


*PARAMETERS: p_sayi1 TYPE i,
*            p_sayi2 TYPE i.
*PARAMETERS: rb1 RADIOBUTTON GROUP gp1, "toplama
*            rb2 RADIOBUTTON GROUP gp1, "çıkarma
*            rb3 RADIOBUTTON GROUP gp1, "çarpma
*            rb4 RADIOBUTTON GROUP gp1. "bölme
*PARAMETERS: cbox1 AS CHECKBOX, "10 ile çarp
*            cbox2 AS CHECKBOX. "2'ye böl
*DATA gv_sonuc TYPE i.
*START-OF-SELECTION.
*  CASE abap_true.
*    WHEN rb1.
*      gv_sonuc = p_sayi1 + p_sayi2.
*      WRITE:/  gv_sonuc.
*    WHEN rb2.
*      gv_sonuc = p_sayi1 - p_sayi2.
*      WRITE:/  gv_sonuc.
*    WHEN rb3.
*      gv_sonuc = p_sayi1 * p_sayi2.
*      WRITE:/  gv_sonuc.
*    WHEN rb4.
*      gv_sonuc = p_sayi1 / p_sayi2.
*      WRITE:/ gv_sonuc.
*  ENDCASE.
*  IF cbox1 EQ abap_true.
*    gv_sonuc = gv_sonuc * 10.
*  ENDIF.
*  IF cbox2 EQ abap_true.
*    gv_sonuc = gv_sonuc / 2.
*  ENDIF.
*  WRITE : / gv_sonuc.


*PARAMETERS p_sayi TYPE i.
*INITIALIZATION.
*  p_sayi = 20.
*AT SELECTION-SCREEN.
*  p_sayi = p_sayi + 1.
*START-OF-SELECTION.
*  WRITE: 'start of selection kodu çalıştı'.
*END-OF-SELECTION.
*  WRITE: 'end of selection kodu çalıştı'.


*PARAMETERS: p_sayi1 TYPE i,
*            p_sayi2 TYPE i.
*PERFORM iki_sayinin_orani.
*FORM iki_sayinin_orani.
*  DATA lv_sonuc TYPE p DECIMALS 2.
*  IF p_sayi1 > p_sayi2 .
*    lv_sonuc = p_sayi1 / p_sayi2.
*    WRITE :/ lv_sonuc.
*  ELSEIF p_sayi2 > p_sayi1 .
*    lv_sonuc = p_sayi2 / p_sayi1.
*    WRITE :/ lv_sonuc.
*  ENDIF.
*ENDFORM.


*START-OF-SELECTION.
*  PERFORM seda.
*  PERFORM abap.
*  PERFORM yazilim.
*  PERFORM biraz.
*  PERFORM zorlaniyor.
*  PERFORM ama.
*  PERFORM yazilim. "yazılım
*  PERFORM dillerinden.
*  PERFORM abap. "abap
*  PERFORM seda. "seda
*  PERFORM icin.
*  PERFORM hic.
*  PERFORM zor.
*  PERFORM degil.
*  PERFORM yeni_satir.
*  PERFORM seda. "seda
*  PERFORM biraz. "biraz
*  PERFORM isterse.
*  PERFORM yapar.
*  PERFORM yeni_satir.
*  PERFORM seda.
*  PERFORM yazilim.
*  PERFORM dillerinden.
*  PERFORM abap.
*  PERFORM zor.
*  PERFORM degil.
*  "seda yazılım dillerinden abap zor değil
*FORM seda.
*  WRITE 'Seda'.
*ENDFORM.
*FORM abap.
*  WRITE 'abap'.
*ENDFORM.
*FORM yazilim.
*  WRITE 'yazılım'.
*ENDFORM.
*FORM biraz.
*  WRITE 'biraz'.
*ENDFORM.
*FORM zorlaniyor.
*  WRITE 'zorlanıyor'.
*ENDFORM.
*FORM ama.
*  WRITE 'ama'.
*ENDFORM.
*FORM dillerinden.
*  WRITE 'dillerinden'.
*ENDFORM.
*FORM icin.
*  WRITE 'için'.
*ENDFORM.
*FORM hic.
*  WRITE 'hiç'.
*ENDFORM.
*FORM zor.
*  WRITE 'zor'.
*ENDFORM.
*FORM degil.
*  WRITE 'değil'.
*ENDFORM.
*FORM isterse.
*  WRITE 'isterse'.
*ENDFORM.
*FORM yapar.
*  WRITE 'yapar'.
*ENDFORM.
*FORM yeni_satir.
*  WRITE /.
*ENDFORM.


*DATA gv_sayi TYPE i VALUE 10.
*START-OF-SELECTION.
*PERFORM 7ekle.
*PERFORM 7ekle.
*PERFORM 7ekle.
*PERFORM 3carp.
*PERFORM 7ekle.
*PERFORM 4cikar.
*PERFORM 4cikar.
*PERFORM 4cikar.
*PERFORM 4cikar.
*perform 2bol.
*  WRITE: gv_sayi.  "42
*FORM 7ekle.
*  gv_sayi = gv_sayi + 7.
*ENDFORM.
*FORM 4cikar.
*  gv_sayi = gv_sayi - 4.
*ENDFORM.
*FORM 2bol.
*  gv_sayi = gv_sayi / 2.
*ENDFORM.
*FORM 3carp.
*  gv_sayi = gv_sayi * 3.
*ENDFORM.



*PARAMETERS: p_user TYPE c LENGTH 20,
*            p_pass TYPE c LENGTH 10.
*AT SELECTION-SCREEN OUTPUT. " Girilen değerlerin doğrulanması ve kontrolleri burada gerçekleşir.
*  LOOP AT SCREEN.
*    IF screen-name = 'P_PASS'. "parametre ismi büyük harfle yazılmalı!!
*      screen-invisible = 1.
*      MODIFY SCREEN.
*    ENDIF.
*  ENDLOOP.
*START-OF-SELECTION.
*  IF p_user EQ 'SEDAYAMAN' AND p_pass EQ '12345'.
*    WRITE : / 'Giriş başarılı'.
*  ELSE.
*    WRITE : / 'Kullanıcı adı veya parola hatalı'.
*  ENDIF.


*  WRITE: 'User name is : ' , p_user,
*  /'Password is : ', p_pass.



*DATA gv_sayi TYPE int4.
*
*START-OF-SELECTION.
*
*  CALL FUNCTION 'QF05_RANDOM_INTEGER'
*    EXPORTING
*      ran_int_max   = 150
*      ran_int_min   = 1
*    IMPORTING
*      ran_int       = gv_sayi
*    EXCEPTIONS
*      invalid_input = 1
*      OTHERS        = 2.
*  IF gv_sayi > 0 AND gv_sayi < 25.
*
*    WRITE:/ 'Üretilen Sayı : ', gv_sayi,
*          / '0 - 25 arasındadır.'.
*
*  ELSEIF gv_sayi > 25 AND gv_sayi < 50.
*
*    WRITE:/ 'Üretilen Sayı : ', gv_sayi,
*          / '25 - 50 arasındadır.'.
*
*  ELSEIF gv_sayi > 50 AND gv_sayi < 75.
*
*    WRITE:/ 'Üretilen Sayı : ', gv_sayi,
*          / '50 - 75 arasındadır.'.
*
*  ELSEIF gv_sayi > 75 AND gv_sayi < 100.
*
*    WRITE:/ 'Üretilen Sayı : ', gv_sayi,
*          / '75 - 100 arasındadır.'.
*
*  ELSEIF gv_sayi >= 100.
*
*    WRITE:/ 'Üretilen Sayı : ', gv_sayi,
*          / 'Sayı 100''den büyüktür.'.
*
*  ENDIF.


PARAMETERS: a1 RADIOBUTTON GROUP a DEFAULT 'X' USER-COMMAND rg1,
            a2 RADIOBUTTON GROUP a.
PARAMETERS: box1(10)        DEFAULT 'India' MODIF ID rg1,
            box2(10)        MODIF ID rg2.

AT SELECTION-SCREEN OUTPUT.

  LOOP AT SCREEN.
    IF screen-group1 = 'RG1'.
      IF a2 = 'X'.
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDIF.
    IF screen-group1 = 'RG2'.
      IF a1 = 'X'.
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDIF.
  ENDLOOP.
