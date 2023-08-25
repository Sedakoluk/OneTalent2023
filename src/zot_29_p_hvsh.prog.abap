*&---------------------------------------------------------------------*
*& Report ZOT_29_P_HVSH
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_hvsh.

DATA gt_info TYPE TABLE OF zot_29_hv WITH HEADER LINE.

SELECT-OPTIONS: s_help FOR gt_info-personel_no MATCHCODE OBJECT zot_29_hv_sh.
