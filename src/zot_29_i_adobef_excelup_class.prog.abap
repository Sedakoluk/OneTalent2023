*&---------------------------------------------------------------------*
*& Include          ZOT_29_I_ADOBEF_EXCELUP_TOP
*&---------------------------------------------------------------------*

DATA: gt_likp TYPE TABLE OF likp,   "teslimat başlık tablo
      gt_lips TYPE TABLE OF lips.   "teslimat kalem tablo

DATA: gt_fieldcatalog TYPE lvc_t_fcat, "fieldcatalog doldurmak için ona ait bir structure olması lazım
      gs_fieldcatalog TYPE lvc_s_fcat.

DATA gs_layout  TYPE lvc_s_layo. "layout için structure oluşturdum

CLASS lcl_main DEFINITION DEFERRED. "top kısmı classın altında kaldığı için program da görmedi
DATA: go_class TYPE REF TO lcl_main. "classı refere alan obje

TYPES : BEGIN OF gty_alv,
          kunnr     TYPE likp-kunnr,
          vbeln     TYPE lips-vbeln,
          posnr     TYPE lips-posnr,
          pstyv     TYPE lips-pstyv,
          ernam     TYPE lips-ernam,
          wadat_ist TYPE likp-wadat_ist,
          mandt     TYPE lips-matnr,
          ntgew     TYPE lips-ntgew,
          gewei     TYPE lips-gewei,
        END OF gty_alv.

DATA: gt_alv TYPE TABLE OF gty_alv,
      gs_alv TYPE gty_alv.
