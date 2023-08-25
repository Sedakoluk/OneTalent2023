*&---------------------------------------------------------------------*
*& Include          ZOT_29_P_DIALOGPROGRAM_TOP
*&---------------------------------------------------------------------*
*TABLES: zot_29_t_teslimt.
*
*CONTROLS tb_id TYPE TABSTRIP.    "tabstip kullanmak için
*
*DATA: gt_teslimat TYPE TABLE OF zot_29_t_teslimt,
*      gs_teslimat TYPE zot_29_t_teslimt.
*
*DATA: gt_stok TYPE TABLE OF zot_29_t_stok,
*      gs_stok TYPE zot_29_t_stok,
*      gs_stok2 TYPE zot_29_t_stok.
*
*DATA ls TYPE zot_29_t_teslimt. "layoutda tanımladığım name alanlarını tabloya verdim
*
*TYPES: BEGIN OF gty_sil,
*         teslimat     TYPE  vbeln_vl,
*         kalem        TYPE posnr_vl,
*         malzeme      TYPE  matnr,
*         miktar       TYPE  lfimg,
*         birim        TYPE  meins,
*         tutar        TYPE wavwr,
*         tutar_birimi TYPE  waerk,
*       END OF gty_sil.
*
*DATA: gt_sil TYPE TABLE OF gty_sil.
*
*CLASS lcl_main_dialog DEFINITION DEFERRED. "böyle bi claasım var bekle ben bunu tanımlayacağım
* "bu top kısmı classın altında kaldığı için program da görmedi.
*DATA: go_class TYPE REF TO lcl_main_dialog.
