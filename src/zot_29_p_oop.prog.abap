*&---------------------------------------------------------------------*
*& Report ZOT_29_P_OOP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_oop.

TABLES: mcha.

INCLUDE zot_29_i_oop_sel.
INCLUDE zot_29_i_oop_top.

INITIALIZATION.

  CREATE OBJECT go_alv
    EXPORTING
      v_matnr = p_malzm.                " Malzeme numarası

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_malzm.

  go_alv->search_help(  ).

START-OF-SELECTION.

  go_alv->iv_matnr = p_malzm.

  go_alv->display_alv( )."classın içindeki display_alv methodunu çağırıyorum
