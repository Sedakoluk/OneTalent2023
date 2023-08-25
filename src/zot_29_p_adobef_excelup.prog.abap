*&---------------------------------------------------------------------*
*& Report ZOT_29_P_ADOBEF_EXCELUP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_adobef_excelup.

INCLUDE zot_29_i_adobef_excelup_top. "tanımlamalarım
INCLUDE zot_29_i_adobef_excelup_cl.  "classlar
INCLUDE zot_29_i_adobef_excelup_sel. "selection-screen
INCLUDE zot_29_i_adobef_excelup_pbo. "screen açılmadan önce
INCLUDE zot_29_i_adobef_excelup_pai. "screen açıldıktan sonra butonları yakaladığım yer

INITIALIZATION.
CREATE OBJECT go_alv.
  CREATE OBJECT go_class.


START-OF-SELECTION.

END-OF-SELECTION.

  CALL SCREEN 0100.
