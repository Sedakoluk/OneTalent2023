FUNCTION zot_29_fm_servis.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_MATNR) TYPE  MARA-MATNR
*"  EXPORTING
*"     VALUE(EV_MALZEME) TYPE  ZOT_29_S_MALZEME
*"     VALUE(EV_STOK) TYPE  ZOT_29_TT_STOK
*"     VALUE(EV_RESULT) TYPE  ZOT_29_S_RESULT
*"----------------------------------------------------------------------

  DATA lt_mb TYPE TABLE OF zot_29_s_malzeme.
  DATA(lv_matnr) = iv_matnr.
  data lt_stok type ZOT_29_TT_STOK.

  SELECT
        mara~matnr,
        makt~maktx,
        mara~mtart,
        mara~meins
        FROM mara
        INNER JOIN makt ON makt~matnr = mara~matnr
        INTO CORRESPONDING FIELDS OF TABLE @lt_mb
        WHERE mara~matnr = @lv_matnr
              AND makt~spras = @sy-langu.


  SELECT werks,
    lgort,
    labst FROM mard
        INTO CORRESPONDING FIELDS OF TABLE @lt_stok
        WHERE matnr = @lv_matnr
    and labst > 0.


  IF lt_mb IS NOT INITIAL. "lt_malzeme boş değilse

    READ TABLE lt_mb INTO DATA(ls_mb) INDEX 1. "rfc çalışınca bunu otomatik olarak algılayack "malzemeyi oku 1.indexi al

    IF sy-subrc EQ 0.

      ev_malzeme = CORRESPONDING #( ls_mb ). "malzemeyi atadık

      ev_result-resultcode = '0'.
      ev_result-resulttype = 'OK'.
      ev_result-resultdescription = 'Kayıt İşlemi Başarıyla Tamamlandı!'.
    ELSE.
      ev_result-resultcode = '1'.
      ev_result-resulttype = 'ERROR'.
      ev_result-resultdescription = 'Kayıt İşlemi Tamamlanamadı!'.
    ENDIF.

  ENDIF.

  IF lt_stok IS NOT INITIAL.
ev_stok = lt_stok.
    ev_result-resultcode = '0'.                               "servis dönüş parametre kodu
    ev_result-resulttype = 'OK'.                              "servis dönüş parametre tipi
    ev_result-resultdescription = 'Kayıt İşlemi Tamamlandı!'. "servis dönüş sonucu
  ELSE.
    ev_result-resultcode = '1'.
    ev_result-resulttype = 'ERROR'.
    ev_result-resultdescription = 'Kayıt İşlemi Tamamlanamadı!'.
  ENDIF.

ENDFUNCTION.
