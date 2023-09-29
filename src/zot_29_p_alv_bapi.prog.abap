*&---------------------------------------------------------------------*
*& Report ZOT_29_P_ALV_BAPI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_alv_bapi.

INCLUDE zot_29_i_alv_bapi_top.
INCLUDE zot_29_i_alv_bapi_selection.
INCLUDE zot_29_i_alv_bapi_class.
INCLUDE zot_29_i_alv_bapi_pbo.
INCLUDE zot_29_i_alv_bapi_pai.

INITIALIZATION.
  CREATE OBJECT go_class.

START-OF-SELECTION.

  go_class->start_of_selection( ).

  CALL SCREEN 100.
