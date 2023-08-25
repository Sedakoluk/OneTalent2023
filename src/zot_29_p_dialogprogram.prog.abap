*&---------------------------------------------------------------------*
*& Report ZOT_29_P_DIALOGPROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_dialogprogram MESSAGE-ID zot_29.

INCLUDE zot_29_i_dialogprogram_top.
INCLUDE zot_29_i_lcl_class.
INCLUDE zot_29_i_dialogprogram_pai.
INCLUDE zot_29_i_dialogprogram_pbo.

INITIALIZATION.
  CREATE OBJECT go_class.

START-OF-SELECTION.

  CALL SCREEN 100.
