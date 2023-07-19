*&---------------------------------------------------------------------*
*& Report zot_29_p_deneme_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_deneme_report.

tables:  eban.

DATA: gs_eban TYPE eban,
      gt_eban TYPE TABLE OF eban.

SELECTION-SCREEN begin of BLOCK b1 WITH FRAME TITLE text-001.

  SELECT-OPTIONS: s_satno FOR gs_eban-banfn,
                  s_bturu FOR gs_eban-bnfpo.

SELECTION-SCREEN END OF BLOCK b1.
