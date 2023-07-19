*&---------------------------------------------------------------------*
*& Include zot_29_include_reports_top
*&---------------------------------------------------------------------*

DATA: gs_eban TYPE eban,
      gt_eban TYPE TABLE OF eban.

DATA : "gs_ekpo TYPE ekpo,
       gt_ekpo TYPE TABLE OF ekpo.

DATA: "gs_ekko TYPE ekko,
      gt_ekko TYPE TABLE OF ekko.

TYPES: BEGIN OF gty_sat,
         banfn    TYPE banfn,
         bnfpo    TYPE bnfpo,
         bsart    TYPE bsart,
         matnr    TYPE matnr,
         menge    TYPE menge_d,
         meins    TYPE meins,
         color(4),
       END OF gty_sat.

TYPES: BEGIN OF gty_sas,
         ebeln    TYPE ebeln,
         ebelp    TYPE ebelp,
         matnr    TYPE matnr,
         menge    TYPE menge_d,
         meins    TYPE meins,
         color(4),
       END OF gty_sas.

DATA: ls_sat_report TYPE gty_sat,
      ls_sas_report TYPE gty_sas,
      lt_sat_report TYPE TABLE OF gty_sat,
      lt_sas_report TYPE TABLE OF gty_sas.

DATA: go_alv    TYPE REF TO cl_salv_table,
      gv_ucomm  TYPE sy-ucomm,
      gv_okcode TYPE sy-ucomm.
