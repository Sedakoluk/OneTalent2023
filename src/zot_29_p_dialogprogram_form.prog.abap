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

  SELECT SINGLE malzeme_no, miktar, birim
    FROM zot_29_t_stok
      INTO CORRESPONDING FIELDS OF @gs_stok2
      WHERE malzeme_no = @ls-malzeme.

  IF sy-subrc IS INITIAL.

    gs_teslimat-teslimat     = ls-teslimat.
    gs_teslimat-kalem        = ls-kalem.
    gs_teslimat-malzeme      = ls-malzeme.
    gs_teslimat-miktar       = ls-miktar.
    gs_teslimat-birim        = ls-birim.
    gs_teslimat-tutar        = ls-tutar.
    gs_teslimat-tutar_birimi = ls-tutar_birimi.

  ELSE. "Stok tablosunda bu malzeme yok
    MESSAGE e000(zot_29) .
  ENDIF.

  IF gs_stok2-miktar < ls-miktar . "aynı malzeme numarası varsa ve toplamı az ise stok yetersiz uyarısı verecek.
    MESSAGE e001(zot_29). "Stok Yetersiz

  ELSE.   " varsa stok tablosundaki stoktan düşecek
    gs_stok2-miktar = gs_stok2-miktar - ls-miktar.

    MODIFY zot_29_t_stok FROM gs_stok2.

    IF sy-subrc = 0.
      COMMIT WORK AND WAIT.
      MESSAGE s002(zot_29).
    ELSE.
      MESSAGE e003(zot_29).
    ENDIF.
  ENDIF.

  INSERT zot_29_t_teslimt FROM gs_teslimat.
  APPEND gs_teslimat TO gt_teslimat.
  g_tb_control_copied = abap_false.

  IF sy-subrc = 0.
    COMMIT WORK AND WAIT.
    MESSAGE i004(zot_29).
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

  SELECT teslimat,
         kalem,
         malzeme,
         miktar,
         birim,
         tutar,
         tutar_birimi FROM zot_29_t_teslimt
         INTO CORRESPONDING FIELDS OF TABLE @gt_teslimat
            WHERE teslimat = @ls-teslimat AND kalem = @ls-kalem.

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

  SELECT teslimat,
         kalem,
         malzeme,
         miktar,
         birim,
         tutar,
         tutar_birimi FROM zot_29_t_teslimt  "sh için select
              INTO CORRESPONDING FIELDS OF TABLE @gt_teslimat.

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

  SELECT teslimat,
         kalem,
         malzeme,
         miktar,
         birim,
         tutar,
         tutar_birimi FROM zot_29_t_teslimt
           INTO CORRESPONDING FIELDS OF TABLE @gt_teslimat
              WHERE teslimat = @ls-teslimat AND kalem = @ls-kalem.

  READ TABLE gt_teslimat WITH KEY teslimat = ls-teslimat  kalem = ls-kalem INTO ls.

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

  MODIFY zot_29_t_teslimt FROM @(
    VALUE #(  teslimat     = ls-teslimat
              kalem        = ls-kalem
              malzeme      = ls-malzeme
              miktar       = ls-miktar
              birim        = ls-birim
              tutar        = ls-tutar
              tutar_birimi = ls-tutar_birimi ) ).

  g_tb_control_copied = abap_false.

  IF sy-subrc = 0.
    COMMIT WORK AND WAIT.
    MESSAGE i005(zot_29).
  ELSE.
    MESSAGE e006(zot_29).
  ENDIF.

ENDFORM.
