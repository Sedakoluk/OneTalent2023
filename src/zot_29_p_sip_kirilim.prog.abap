*&---------------------------------------------------------------------*
*& Report zot_29_p_sip_kirilim
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_sip_kirilim.

TABLES: vbak, vbap.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_vbeln FOR vbak-vbeln, "sipariş no
                  s_kunnr FOR vbak-kunnr, "sipariş veren
                  s_auart FOR vbak-auart, "sipariş türü
                  s_audat FOR vbak-audat. "sipariş tarihi

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  SELECT-OPTIONS: s_matnr FOR vbap-matnr, "malzeme
                  s_werks FOR vbap-werks, "üretim yeri
                  s_pstyv FOR vbap-pstyv, "kalem tipi
                  s_matkl FOR vbap-matkl, "mal grubu
                  s_charg FOR vbap-charg. "parti

SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.

  PARAMETERS: cb_stur AS CHECKBOX, "sipariş türü
              cb_mno  AS CHECKBOX, "malzeme no
              cb_sver AS CHECKBOX, "sipariş veren
              cb_mgr  AS CHECKBOX, "mal grubu
              cb_part AS CHECKBOX. "parti

SELECTION-SCREEN END OF BLOCK b3.

"kırılım 2 adet seçebilme - tüm olasılıklar için

IF cb_stur = abap_true AND cb_mno = abap_true.       "sipariş türü ve malzeme no
  CLEAR: cb_sver, cb_mgr, cb_part.
MESSAGE 'Yalnız 2 adet seçim yapabilirsiniz!' TYPE 'I'.
ELSEIF cb_stur = abap_true AND cb_sver = abap_true.  "sipariş türü ve sipariş veren
  CLEAR: cb_mno, cb_mgr, cb_part.
MESSAGE 'Yalnız 2 adet seçim yapabilirsiniz!' TYPE 'I'.
ELSEIF cb_stur = abap_true AND cb_mgr = abap_true.   "sipariş türü ve mal grubu
  CLEAR: cb_mno, cb_sver, cb_part.
MESSAGE 'Yalnız 2 adet seçim yapabilirsiniz!' TYPE 'I'.
ELSEIF cb_stur = abap_true AND cb_part = abap_true.  "sipariş türü ve parti
  CLEAR: cb_mno, cb_sver, cb_mgr.
MESSAGE 'Yalnız 2 adet seçim yapabilirsiniz!' TYPE 'I'.
ELSEIF cb_mno = abap_true AND cb_sver = abap_true.   "malzeme no ve sipariş veren
  CLEAR: cb_stur, cb_mgr, cb_part.
MESSAGE 'Yalnız 2 adet seçim yapabilirsiniz!' TYPE 'I'.
ELSEIF cb_mno = abap_true AND cb_mgr = abap_true.    "malzeme no ve mal grubu
  CLEAR: cb_stur, cb_sver, cb_part.
MESSAGE 'Yalnız 2 adet seçim yapabilirsiniz!' TYPE 'I'.
ELSEIF cb_mno = abap_true AND cb_part = abap_true.   "malzeme no ve parti
  CLEAR: cb_stur, cb_sver, cb_mgr.
MESSAGE 'Yalnız 2 adet seçim yapabilirsiniz!' TYPE 'I'.
ELSEIF cb_sver = abap_true AND cb_mno = abap_true.   "sipariş veren ve malzeme no
  CLEAR: cb_stur, cb_mgr, cb_part.
MESSAGE 'Yalnız 2 adet seçim yapabilirsiniz!' TYPE 'I'.
ELSEIF cb_sver = abap_true AND cb_mgr = abap_true.   "sipariş veren ve mal grubu
  CLEAR: cb_stur, cb_mno, cb_part.
MESSAGE 'Yalnız 2 adet seçim yapabilirsiniz!' TYPE 'I'.
ELSEIF cb_sver = abap_true AND cb_part = abap_true.  "sipariş veren ve parti
  CLEAR: cb_stur, cb_mno, cb_mgr.
MESSAGE 'Yalnız 2 adet seçim yapabilirsiniz!' TYPE 'I'.
ELSEIF cb_mgr = abap_true AND cb_part = abap_true.   "mal grubu ve parti
  CLEAR: cb_stur, cb_mno, cb_sver.
  MESSAGE 'Yalnız 2 adet seçim yapabilirsiniz!' TYPE 'I'.
ENDIF.

TYPES : BEGIN OF gty_collect,
          netwr TYPE vbap-netwr,
          waerk TYPE vbap-waerk,
        END OF gty_collect.

TYPES : BEGIN OF gty_sipariskolon,
          vbeln TYPE vbak-vbeln,
          kunnr TYPE vbak-kunnr,
          auart TYPE vbak-auart,
          matnr TYPE vbap-matnr,
          matkl TYPE vbap-matkl,
          charg TYPE vbap-charg,
          netwr TYPE vbap-netwr, "net değer
          waerk TYPE vbap-waerk, "para birimi
        END OF gty_sipariskolon.

DATA : gt_siparis TYPE TABLE OF gty_sipariskolon,
       gs_siparis TYPE gty_sipariskolon,
       gt_toplam  TYPE TABLE OF gty_sipariskolon,
       gs_toplam  TYPE gty_sipariskolon.


SELECT a~vbeln,
       kunnr,
       auart,
       matnr,
       matkl,
       charg,
       a~netwr,
       a~waerk FROM vbak AS a INNER JOIN vbap AS b
                    ON a~vbeln = b~vbeln
                        WHERE a~vbeln IN @s_vbeln
                            INTO TABLE @gt_siparis.

IF cb_stur = abap_true AND cb_mno = abap_true.       "sipariş türü ve malzeme no

  SORT gt_siparis BY matnr.
  "stringleri aynı olan var mı diye bak varsa gt_toplam a at
  LOOP AT gt_siparis INTO gs_siparis.
    gs_toplam-auart = gs_siparis-auart.
    gs_toplam-matnr = gs_siparis-matnr.
    gs_toplam-netwr = gs_siparis-netwr.
    gs_toplam-waerk = gs_siparis-waerk.
    COLLECT gs_toplam INTO gt_toplam.
  ENDLOOP.

  "loop ile dönerek tabloya at
  SORT gt_toplam BY matnr.
  LOOP AT gt_toplam INTO gs_toplam.
    WRITE : / gs_toplam-auart, gs_toplam-matnr, gs_toplam-netwr, gs_toplam-waerk.
  ENDLOOP.

ELSEIF cb_stur = abap_true AND cb_sver = abap_true.  "sipariş türü ve sipariş veren

  SORT gt_siparis BY kunnr.
  LOOP AT gt_siparis INTO gs_siparis.
    gs_toplam-auart = gs_siparis-auart.
    gs_toplam-kunnr = gs_siparis-kunnr.
    gs_toplam-netwr = gs_siparis-netwr.
    gs_toplam-waerk = gs_siparis-waerk.
    COLLECT gs_toplam INTO gt_toplam.
  ENDLOOP.

  SORT gt_toplam BY kunnr.
  LOOP AT gt_toplam INTO gs_toplam.
    WRITE : / gs_toplam-auart, gs_toplam-kunnr, gs_toplam-netwr, gs_toplam-waerk.
  ENDLOOP.

ELSEIF cb_stur = abap_true AND cb_mgr = abap_true.   "sipariş türü ve mal grubu

  SORT gt_siparis BY matkl.
  LOOP AT gt_siparis INTO gs_siparis.
    gs_toplam-auart = gs_siparis-auart.
    gs_toplam-matkl = gs_siparis-matkl.
    gs_toplam-netwr = gs_siparis-netwr.
    gs_toplam-waerk = gs_siparis-waerk.
    COLLECT gs_toplam INTO gt_toplam.
  ENDLOOP.

  SORT gt_toplam BY matkl.
  LOOP AT gt_toplam INTO gs_toplam.
    WRITE : / gs_toplam-auart, gs_toplam-matkl, gs_toplam-netwr, gs_toplam-waerk.
  ENDLOOP.

ELSEIF cb_stur = abap_true AND cb_part = abap_true.  "sipariş türü ve parti

  SORT gt_siparis BY charg.
  LOOP AT gt_siparis INTO gs_siparis.
    gs_toplam-auart = gs_siparis-auart.
    gs_toplam-charg = gs_siparis-charg.
    gs_toplam-netwr = gs_siparis-netwr.
    gs_toplam-waerk = gs_siparis-waerk.
    COLLECT gs_toplam INTO gt_toplam.
  ENDLOOP.

  SORT gt_toplam BY charg.
  LOOP AT gt_toplam INTO gs_toplam.
    WRITE : / gs_toplam-auart, gs_toplam-charg, gs_toplam-netwr, gs_toplam-waerk.
  ENDLOOP.

ELSEIF cb_mno = abap_true AND cb_sver = abap_true.   "malzeme no ve sipariş veren

  SORT gt_siparis BY matnr.
  LOOP AT gt_siparis INTO gs_siparis.
    gs_toplam-matnr = gs_siparis-matnr.
    gs_toplam-kunnr = gs_siparis-kunnr.
    gs_toplam-netwr = gs_siparis-netwr.
    gs_toplam-waerk = gs_siparis-waerk.
    COLLECT gs_toplam INTO gt_toplam.
  ENDLOOP.

  SORT gt_toplam BY charg.
  LOOP AT gt_toplam INTO gs_toplam.
    WRITE : / gs_toplam-matnr, gs_toplam-kunnr, gs_toplam-netwr, gs_toplam-waerk.
  ENDLOOP.

ELSEIF cb_mno = abap_true AND cb_mgr = abap_true.    "malzeme no ve mal grubu

  SORT gt_siparis BY matnr.
  LOOP AT gt_siparis INTO gs_siparis.
    gs_toplam-matnr = gs_siparis-matnr.
    gs_toplam-matkl = gs_siparis-matkl.
    gs_toplam-netwr = gs_siparis-netwr.
    gs_toplam-waerk = gs_siparis-waerk.
    COLLECT gs_toplam INTO gt_toplam.
  ENDLOOP.

  SORT gt_toplam BY charg.
  LOOP AT gt_toplam INTO gs_toplam.
    WRITE : / gs_toplam-matnr, gs_toplam-matkl,  gs_toplam-netwr, gs_toplam-waerk.
  ENDLOOP.

ELSEIF cb_mno = abap_true AND cb_part = abap_true.   "malzeme no ve parti
  SORT gt_siparis BY matnr.
  LOOP AT gt_siparis INTO gs_siparis.
    gs_toplam-matnr = gs_siparis-matnr.
    gs_toplam-charg = gs_siparis-charg.
    gs_toplam-netwr = gs_siparis-netwr.
    gs_toplam-waerk = gs_siparis-waerk.
    COLLECT gs_toplam INTO gt_toplam.
  ENDLOOP.

  SORT gt_toplam BY matnr.
  LOOP AT gt_toplam INTO gs_toplam.
    WRITE : / gs_toplam-matnr, gs_toplam-charg, gs_toplam-netwr, gs_toplam-waerk.
  ENDLOOP.

ELSEIF cb_sver = abap_true AND cb_mno = abap_true.   "sipariş veren ve malzeme no

  SORT gt_siparis BY kunnr.
  LOOP AT gt_siparis INTO gs_siparis.
    gs_toplam-kunnr = gs_siparis-kunnr.
    gs_toplam-matkl = gs_siparis-matkl.
    gs_toplam-netwr = gs_siparis-netwr.
    gs_toplam-waerk = gs_siparis-waerk.
    COLLECT gs_toplam INTO gt_toplam.
  ENDLOOP.

  SORT gt_toplam BY charg.
  LOOP AT gt_toplam INTO gs_toplam.
    WRITE : / gs_toplam-kunnr, gs_toplam-matkl, gs_toplam-netwr, gs_toplam-waerk.
  ENDLOOP.

ELSEIF cb_sver = abap_true AND cb_mgr = abap_true.   "sipariş veren ve mal grubu

  SORT gt_siparis BY kunnr.
  LOOP AT gt_siparis INTO gs_siparis.
    gs_toplam-kunnr = gs_siparis-kunnr.
    gs_toplam-charg = gs_siparis-charg.
    gs_toplam-netwr = gs_siparis-netwr.
    gs_toplam-waerk = gs_siparis-waerk.
    COLLECT gs_toplam INTO gt_toplam.
  ENDLOOP.

  SORT gt_toplam BY charg.
  LOOP AT gt_toplam INTO gs_toplam.
    WRITE : / gs_toplam-kunnr, gs_toplam-charg, gs_toplam-netwr, gs_toplam-waerk.
  ENDLOOP.

ELSEIF cb_sver = abap_true AND cb_part = abap_true.  "sipariş veren ve parti

  SORT gt_siparis BY matkl.
  LOOP AT gt_siparis INTO gs_siparis.
    gs_toplam-matkl = gs_siparis-matkl.
    gs_toplam-charg = gs_siparis-charg.
    gs_toplam-netwr = gs_siparis-netwr.
    gs_toplam-waerk = gs_siparis-waerk.
    COLLECT gs_toplam INTO gt_toplam.
  ENDLOOP.

  SORT gt_toplam BY charg.
  LOOP AT gt_toplam INTO gs_toplam.
    WRITE : / gs_toplam-matkl, gs_toplam-charg, gs_toplam-netwr, gs_toplam-waerk.
       SUM.
       WRITE : / 'Toplam', gs_toplam-netwr , gs_toplam-netwr.
  ENDLOOP.

"ELSEIF cb_mgr = abap_true AND cb_part = abap_true.   "mal grubu ve parti

ENDIF.


cl_demo_output=>display(  ).
