*&---------------------------------------------------------------------*
*& Report ZOT_29_P_ADOBEF_EXCELUP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_adobef_excelup.

INCLUDE zot_29_i_adobef_excelup_top. "tanımlamalarım
INCLUDE zot_29_i_adobef_excelup_sel. "selection-screen
INCLUDE zot_29_i_adobef_excelup_cl.  "classlar
INCLUDE zot_29_i_adobef_excelup_pbo. "screen açılmadan önce
INCLUDE zot_29_i_adobef_excelup_pai. "screen açıldıktan sonra butonları yakaladığım yer

INITIALIZATION.
  CREATE OBJECT go_class.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
  go_class->dosya_yolu( ).

START-OF-SELECTION.

  go_class->start_of_selection( ).
  go_class->excel_upload( ).

END-OF-SELECTION.

  go_class->end_of_selection( ).

  CALL SCREEN 0100.
