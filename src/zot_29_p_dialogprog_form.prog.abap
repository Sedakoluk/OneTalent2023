*&---------------------------------------------------------------------*
*& Include          ZOT_29_P_DIALOGPROG_FORM
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Form save
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM save .

  SELECT SINGLE * FROM zot_29_t_stok
    INTO  @DATA(gs_stok2) WHERE malzeme_no = @ls-malzeme.

  IF sy-subrc IS INITIAL.

    gs_teslimat-teslimat     = ls-teslimat.
    gs_teslimat-kalem        = ls-kalem.
    gs_teslimat-malzeme      = ls-malzeme.
    gs_teslimat-miktar       = ls-miktar.
    gs_teslimat-birim        = ls-birim.
    gs_teslimat-tutar        = ls-tutar.
    gs_teslimat-tutar_birimi = ls-tutar_birimi.

  ELSE. "Stok tablosunda bu malzeme yok
    MESSAGE e000(zsyaman) .
  ENDIF.

  IF gs_stok2-miktar < ls-miktar . "aynı malzeme numarası varsa ve toplamı az ise stok yetersiz uyarısı verecek.
    MESSAGE e001(zsyaman). "Stok Yetersiz

  ELSE.   " varsa stok tablosundaki stoktan düşecek
    gs_stok2-miktar = gs_stok2-miktar - ls-miktar.

    MODIFY zot_29_t_stok FROM gs_stok2.

    IF sy-subrc = 0.
      COMMIT WORK AND WAIT.
      MESSAGE s002(zsyaman).
    ELSE.
      MESSAGE e003(zsyaman).
    ENDIF.
  ENDIF.

  INSERT zot_29_t_teslimt FROM gs_teslimat.
  APPEND gs_teslimat TO gt_teslimat.
  g_tb_control_copied = abap_false.

  IF sy-subrc = 0.
    COMMIT WORK AND WAIT.
    MESSAGE i004(zsyaman).
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form clear
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM clear .

  LOOP AT gt_sil INTO DATA(gs_sil).
    DELETE FROM zot_29_t_teslimt WHERE teslimat = gs_sil-teslimat AND kalem = gs_sil-kalem.
    DELETE g_tb_control_itab WHERE teslimat = gs_sil-teslimat AND kalem = gs_sil-kalem.
  ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form display
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display .

  SELECT * FROM zot_29_t_teslimt
         INTO TABLE gt_teslimat WHERE teslimat = ls-teslimat AND kalem = ls-kalem.

  READ TABLE gt_teslimat WITH KEY teslimat = ls-teslimat kalem = ls-kalem INTO ls.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_data_sh
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data_sh .

  SELECT * FROM zot_29_t_teslimt  "sh için select
  INTO TABLE gt_teslimat.
  IF sy-subrc IS INITIAL.
    SORT gt_teslimat.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form update
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM update .

  SELECT * FROM zot_29_t_teslimt
           INTO TABLE gt_teslimat WHERE teslimat = ls-teslimat AND kalem = ls-kalem.

  READ TABLE gt_teslimat WITH KEY teslimat = ls-teslimat kalem = ls-kalem INTO ls.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form updatesave
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM updatesave .
*UPDATE zot_29_t_teslimt set teslimat = LS-TESLIMAT
*WHERE malzeme = ls-malzeme and
*miktar = ls-miktar and
*birim = ls-birim and
*tutar = ls-tutar and
*tutar_birimi = ls-tutar_birimi.

*MODIFY zot_29_t_teslimt from table gt_teslimat.

*UPDATE zot_29_t_teslimt SET teslimat = LS-TESLIMAT.
*    READ TABLE gt_teslimat WITH KEY malzeme = ls-malzeme miktar = ls-miktar birim = ls-birim tutar = ls-tutar tutar_birimi = ls-tutar_birimi INTO ls.

*    UPDATE zot_29_t_teslimt FROM TABLE @(
*    VALUE #(
*        FOR gs_teslimat IN gt_teslimat WHERE ( teslimat = ls-teslimat AND kalem = ls-kalem )
*          (  ) ) ).

*  LOOP AT gt_teslimat INTO gs_teslimat.
*
*    UPDATE zot_29_t_teslimt SET teslimat = ls-teslimat
*                            WHERE malzeme = ls-malzeme AND
*                            miktar = ls-miktar AND
*                            birim = ls-birim AND
*                            tutar = ls-tutar AND
*                            tutar_birimi = ls-tutar_birimi.
*  ENDLOOP.

*MODIFY zot_29_t_teslimt FROM @(
*  VALUE #(  malzeme = ls-malzeme miktar = ls-miktar birim = ls-birim tutar = ls-tutar tutar_birimi = ls-tutar_birimi ) ).

*    MODIFY zot_29_t_teslimt FROM gs_teslimat.

  MODIFY zot_29_t_teslimt FROM gs_teslimat.
  APPEND gs_teslimat TO gt_teslimat.


*  IF sy-subrc = 0.
*    COMMIT WORK AND WAIT.
*    MESSAGE i004(zsyaman).
*  ENDIF.

  IF sy-subrc = 0.
    COMMIT WORK AND WAIT.
    MESSAGE 'Güncelleme yapıldı' TYPE 'I'.
  ELSE.
    MESSAGE 'güncelleme yapılamadı' TYPE 'I'.
  ENDIF.


*    IF sy-subrc EQ 0.
*      COMMIT WORK AND WAIT.
*    ENDIF.
ENDFORM.
