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


*PARAMETERS: a1 RADIOBUTTON GROUP a DEFAULT 'X' USER-COMMAND rg1,
*            a2 RADIOBUTTON GROUP a.
*PARAMETERS: box1(10)        DEFAULT 'India' MODIF ID rg1,
*            box2(10)        MODIF ID rg2.
*
*AT SELECTION-SCREEN OUTPUT.
*
*  LOOP AT SCREEN.
*    IF screen-group1 = 'RG1'.
*      IF a2 = 'X'.
*        screen-active = 0.
*        MODIFY SCREEN.
*      ENDIF.
*    ENDIF.
*    IF screen-group1 = 'RG2'.
*      IF a1 = 'X'.
*        screen-active = 0.
*        MODIFY SCREEN.
*      ENDIF.
*    ENDIF.
*  ENDLOOP.


*TABLES sscrfields.
*
*DATA flag(1) TYPE c.
*
*SELECTION-SCREEN:
*  BEGIN OF SCREEN 500 AS WINDOW TITLE tit,
*    BEGIN OF LINE,
*      PUSHBUTTON 2(10) but1 USER-COMMAND cli1,
*      PUSHBUTTON 12(10) text-020 USER-COMMAND cli2,
*    END OF LINE,
*    BEGIN OF LINE,
*      PUSHBUTTON 2(10) but3 USER-COMMAND cli3,
*      PUSHBUTTON 12(10) text-040 USER-COMMAND cli4,
*    END OF LINE,
*  END OF SCREEN 500.
*
*AT SELECTION-SCREEN.
*
*  MESSAGE i888(sabapdocu) WITH text-001 sscrfields-ucomm.
*  CASE sscrfields-ucomm.
*    WHEN 'CLI1'.
*      flag = '1'.
*    WHEN 'CLI2'.
*      flag = '2'.
*    WHEN 'CLI3'.
*      flag = '3'.
*    WHEN 'CLI4'.
*      flag = '4'.
*  ENDCASE.
*
*START-OF-SELECTION.
*
*  tit  = 'Four Buttons'.
*  but1 = 'Button 1'.
*  but3 = 'Button 3'.
*
*  CALL SELECTION-SCREEN 500 STARTING AT 10 10.
*
*  CASE flag.
*    WHEN '1'.
*      WRITE / 'Button 1 was clicked'.
*    WHEN '2'.
*      WRITE / 'Button 2 was clicked'.
*    WHEN '3'.
*      WRITE / 'Button 3 was clicked'.
*    WHEN '4'.
*      WRITE / 'Button 4 was clicked'.
*    WHEN OTHERS.
*      WRITE / 'No Button was clicked'.
*  ENDCASE.




*  FIELD-SYMBOLS : <gt_data>       TYPE STANDARD TABLE .
*
*SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME .
*  PARAMETERS : p_file TYPE ibipparms-path OBLIGATORY,
*               p_ncol TYPE i OBLIGATORY DEFAULT 10.
*SELECTION-SCREEN END OF BLOCK b1 .
*
**--------------------------------------------------------------------*
** at selection screen
**--------------------------------------------------------------------*
*AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
*
*  DATA: lv_rc TYPE i.
*  DATA: lt_file_table TYPE filetable,
*        ls_file_table TYPE file_table.
*
*  CALL METHOD cl_gui_frontend_services=>file_open_dialog
*    EXPORTING
*      window_title = 'Select a file'
*    CHANGING
*      file_table   = lt_file_table
*      rc           = lv_rc.
*  IF sy-subrc = 0.
*    READ TABLE lt_file_table INTO ls_file_table INDEX 1.
*    p_file = ls_file_table-filename.
*  ENDIF.
*
*START-OF-SELECTION .
*
*  PERFORM read_file .
*  PERFORM process_file.
*
**---------------------------------------------------------------------*
** Form READ_FILE
**---------------------------------------------------------------------*
*FORM read_file .
*
*  DATA : lv_filename      TYPE string,
*         lt_records       TYPE solix_tab,
*         lv_headerxstring TYPE xstring,
*         lv_filelength    TYPE i.
*
*  lv_filename = p_file.
*
*  CALL FUNCTION 'GUI_UPLOAD'
*    EXPORTING
*      filename                = lv_filename
*      filetype                = 'BIN'
*    IMPORTING
*      filelength              = lv_filelength
*      header                  = lv_headerxstring
*    TABLES
*      data_tab                = lt_records
*    EXCEPTIONS
*      file_open_error         = 1
*      file_read_error         = 2
*      no_batch                = 3
*      gui_refuse_filetransfer = 4
*      invalid_type            = 5
*      no_authority            = 6
*      unknown_error           = 7
*      bad_data_format         = 8
*      header_not_allowed      = 9
*      separator_not_allowed   = 10
*      header_too_long         = 11
*      unknown_dp_error        = 12
*      access_denied           = 13
*      dp_out_of_memory        = 14
*      disk_full               = 15
*      dp_timeout              = 16
*      OTHERS                  = 17.
*
*  "convert binary data to xstring
*  "if you are using cl_fdt_xl_spreadsheet in odata then skips this step
*  "as excel file will already be in xstring
*  CALL FUNCTION 'SCMS_BINARY_TO_XSTRING'
*    EXPORTING
*      input_length = lv_filelength
*    IMPORTING
*      buffer       = lv_headerxstring
*    TABLES
*      binary_tab   = lt_records
*    EXCEPTIONS
*      failed       = 1
*      OTHERS       = 2.
*
*  IF sy-subrc <> 0.
*    "Implement suitable error handling here
*  ENDIF.
*
*  DATA : lo_excel_ref TYPE REF TO cl_fdt_xl_spreadsheet .
*
*  TRY .
*      lo_excel_ref = NEW cl_fdt_xl_spreadsheet(
*                              document_name = lv_filename
*                              xdocument     = lv_headerxstring ) .
*    CATCH cx_fdt_excel_core.
*      "Implement suitable error handling here
*  ENDTRY .
*
*  "Get List of Worksheets
*  lo_excel_ref->if_fdt_doc_spreadsheet~get_worksheet_names(
*    IMPORTING
*      worksheet_names = DATA(lt_worksheets) ).
*
*  IF NOT lt_worksheets IS INITIAL.
*    READ TABLE lt_worksheets INTO DATA(lv_woksheetname) INDEX 1.
*
*    DATA(lo_data_ref) = lo_excel_ref->if_fdt_doc_spreadsheet~get_itab_from_worksheet(
*                                             lv_woksheetname ).
*    "now you have excel work sheet data in dyanmic internal table
*    ASSIGN lo_data_ref->* TO <gt_data>.
*  ENDIF.
*
*ENDFORM.
*
**---------------------------------------------------------------------*
** Form PROCESS_FILE
**---------------------------------------------------------------------*
*FORM process_file .
*
*  DATA : lv_numberofcolumns   TYPE i,
*         lv_date_string       TYPE string,
*         lv_target_date_field TYPE datum.
*
*
*  FIELD-SYMBOLS : <ls_data>  TYPE any,
*                  <lv_field> TYPE any.
*
*  "you could find out number of columns dynamically from table <gt_data>
*  lv_numberofcolumns = p_ncol .
*
*  LOOP AT <gt_data> ASSIGNING <ls_data> FROM 2 .
*
*    "processing columns
*    DO lv_numberofcolumns TIMES.
*      ASSIGN COMPONENT sy-index OF STRUCTURE <ls_data> TO <lv_field> .
*      IF sy-subrc = 0 .
*        CASE sy-index .
**          when 1 .
**          when 2 .
*          WHEN 10 .
*            lv_date_string = <lv_field> .
*            PERFORM date_convert USING lv_date_string CHANGING lv_target_date_field .
*            WRITE lv_target_date_field .
*          WHEN OTHERS.
*            WRITE : <lv_field> .
*        ENDCASE .
*      ENDIF.
*    ENDDO .
*    NEW-LINE .
*  ENDLOOP .
*ENDFORM.
*
**---------------------------------------------------------------------*
** Form DATE_CONVERT
**---------------------------------------------------------------------*
*FORM date_convert USING iv_date_string TYPE string CHANGING cv_date TYPE datum .
*
*  DATA: lv_convert_date(10) TYPE c.
*
*  lv_convert_date = iv_date_string .
*
*  "date format YYYY/MM/DD
*  FIND REGEX '^\d{4}[/|-]\d{1,2}[/|-]\d{1,2}$' IN lv_convert_date.
*  IF sy-subrc = 0.
*    CALL FUNCTION '/SAPDMC/LSM_DATE_CONVERT'
*      EXPORTING
*        date_in             = lv_convert_date
*        date_format_in      = 'DYMD'
*        to_output_format    = ' '
*        to_internal_format  = 'X'
*      IMPORTING
*        date_out            = lv_convert_date
*      EXCEPTIONS
*        illegal_date        = 1
*        illegal_date_format = 2
*        no_user_date_format = 3
*        OTHERS              = 4.
*  ELSE.
*
*    " date format DD/MM/YYYY
*    FIND REGEX '^\d{1,2}[/|-]\d{1,2}[/|-]\d{4}$' IN lv_convert_date.
*    IF sy-subrc = 0.
*      CALL FUNCTION '/SAPDMC/LSM_DATE_CONVERT'
*        EXPORTING
*          date_in             = lv_convert_date
*          date_format_in      = 'DDMY'
*          to_output_format    = ' '
*          to_internal_format  = 'X'
*        IMPORTING
*          date_out            = lv_convert_date
*        EXCEPTIONS
*          illegal_date        = 1
*          illegal_date_format = 2
*          no_user_date_format = 3
*          OTHERS              = 4.
*    ENDIF.
*
*  ENDIF.
*
*  IF sy-subrc = 0.
*    cv_date = lv_convert_date .
*  ENDIF.
*
*ENDFORM .



**Types For Data to be uploaded
TYPES : BEGIN OF TY_ITAB,
        EBELN TYPE EBELN,
        EBELP TYPE EBELP,
        MENGE TYPE MENGE,
        DMBTR TYPE DMBTR,
        END OF TY_ITAB.
*&Create a Table Type From Types
TYPES : TITAB TYPE STANDARD TABLE OF TY_ITAB.
*&Create Table and Work Area for Data Processing.
DATA : GT_ITAB TYPE TITAB.
DATA : GS_ITAB TYPE TY_ITAB.
*Selection Screen For Getting Filename From User
PARAMETERS : P_FILE TYPE RLGRAP-FILENAME.


AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_FILE.
  CALL FUNCTION 'F4_FILENAME'
   EXPORTING
     FIELD_NAME          = 'P_FILE'
   IMPORTING
     FILE_NAME           = P_FILE.



START-OF-SELECTION.

CALL FUNCTION 'UPLOAD_XLS_FILE_2_ITAB'
  EXPORTING
    I_FILENAME       = P_FILE
  TABLES
    E_ITAB           = GT_ITAB
 EXCEPTIONS
   FILE_ERROR       = 1
   OTHERS           = 2.
IF SY-SUBRC <> 0.
* Implement suitable error handling here
CASE SY-SUBRC.
  WHEN 1.
  MESSAGE 'Something went wrong in file,Close file and upload again' TYPE 'E'.
  WHEN 2.
  MESSAGE 'Error in Uploading file,Try again' TYPE 'E'.
ENDCASE.
ENDIF.

*&Reference for CL_SALV_TABLE for Displaying the Output
DATA GR_TABLE   TYPE REF TO CL_SALV_TABLE.


CL_SALV_TABLE=>FACTORY(
  IMPORTING
    R_SALV_TABLE   = GR_TABLE
  CHANGING
    T_TABLE        = GT_ITAB ).

GR_TABLE->DISPLAY( ).
