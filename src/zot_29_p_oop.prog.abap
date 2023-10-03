*&---------------------------------------------------------------------*
*& Report ZOT_29_P_OOP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_oop.

TABLES: mcha.

INCLUDE zot_29_i_oop_sel.
INCLUDE zot_29_i_oop_top.

DATA: go_alv TYPE REF TO zot_29_cl_oop. "SE24'de oluşturduğum clası referans alan obje oluşturdum

INITIALIZATION.
  SELECT * FROM mcha
    INTO TABLE @gt_mcha. "search helpe verileri çekmek için

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_malzm.
  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield    = 'MATNR'
      value_org   = 'S'
      dynpprog    = sy-repid
      dynpnr      = sy-dynnr
      dynprofield = 'P_MALZM'
    TABLES
      value_tab   = gt_mcha
      return_tab  = lt_search_help.

READ TABLE lt_search_help INTO ls_search_help INDEX 1. "searhhelp'den gelen kaydı okuyorum

START-OF-SELECTION.

CREATE OBJECT go_alv "clası kullanmak için create ederim
  EXPORTING
    v_matnr = p_malzm. " v_matnr constructor'a verdiğim parametre

  go_alv->display_alv( ). "classın içindeki display_alv methodunu çağırıyorum
