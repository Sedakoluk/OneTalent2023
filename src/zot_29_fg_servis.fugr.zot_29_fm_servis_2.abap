FUNCTION ZOT_29_FM_SERVIS_2.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_MATNR) TYPE  MARA-MATNR
*"  EXPORTING
*"     VALUE(EV_MALZEME) TYPE  ZOT_29_S_MALZEME
*"----------------------------------------------------------------------

DATA lt_m TYPE TABLE OF zot_29_s_malzeme.

  DATA(lv_m) = iv_matnr.
  SELECT
      *
    FROM mara
    INNER JOIN makt ON makt~matnr = mara~matnr
    INTO CORRESPONDING FIELDS OF TABLE @lt_m
    WHERE mara~matnr = @lv_m.




ENDFUNCTION.
