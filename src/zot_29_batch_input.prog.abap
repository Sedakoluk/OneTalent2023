*&---------------------------------------------------------------------*
*& Report ZOT_29_BATCH_INPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_batch_input.

INCLUDE zot_29_i_batch_input_sel.
INCLUDE zot_29_i_batch_input_top.
INCLUDE zot_29_i_batch_input_cl.

INITIALIZATION.


*go_main->

DATA: gt_bdcdata TYPE TABLE OF bdcdata,
      gs_bdcdata TYPE bdcdata,
      gt_messtab TYPE TABLE OF bdcmsgcoll.

START-OF-SELECTION.


DO 2 TIMES.

 PERFORM bdc_dynpro      USING 'SAPLMGMM' '0060'.
  PERFORM bdc_field       USING 'BDC_CURSOR'
                                'RMMG1-MTART'.
  PERFORM bdc_field       USING 'BDC_OKCODE'
                                '=ENTR'.
  PERFORM bdc_field       USING 'RMMG1-MBRSH'
                                'O'.
  PERFORM bdc_field       USING 'RMMG1-MTART'
                                'EPA'.
  PERFORM bdc_dynpro      USING 'SAPLMGMM' '0070'.
  PERFORM bdc_field       USING 'BDC_CURSOR'
                                'MSICHTAUSW-DYTXT(01)'.
  PERFORM bdc_field       USING 'BDC_OKCODE'
                                '=ENTR'.
  PERFORM bdc_field       USING 'MSICHTAUSW-KZSEL(01)'
                                'X'.
  PERFORM bdc_dynpro      USING 'SAPLMGMM' '4004'.
  PERFORM bdc_field       USING 'BDC_OKCODE'
                                '/00'.
  PERFORM bdc_field       USING 'MAKT-MAKTX'
                                p_maktx.
  PERFORM bdc_field       USING 'MARA-MEINS'
                                'ADT'.
  PERFORM bdc_field       USING 'MARA-MTPOS_MARA'
                                'VERP'.
  PERFORM bdc_field       USING 'BDC_CURSOR'
                                'MARA-GEWEI'.
  PERFORM bdc_field       USING 'MARA-BRGEW'
                                '50'.
  PERFORM bdc_field       USING 'MARA-GEWEI'
                                'KG'.
  PERFORM bdc_field       USING 'MARA-NTGEW'
                                '30'.
  PERFORM bdc_dynpro      USING 'SAPLSPO1' '0300'.
  PERFORM bdc_field       USING 'BDC_OKCODE'
                                '=YES'.

  CALL TRANSACTION 'MM01' WITH AUTHORITY-CHECK USING gt_bdcdata "performların eklendiği itab - MM01-tcode
     MODE 'N'   "A- tüm adımları göster  E-hataları göster  N-arka planda çalıştır bana gösterme
*     UPDATE cupdate "S- verilerin kaydedilmesini bekle  A- kaydedilmesini bekleme
     MESSAGES INTO gt_messtab. "işlem bittikten sonra mesajları logladığı itab

ENDDO.

FORM bdc_dynpro USING program dynpro.   "ekran numarasını alıyor
  CLEAR gs_bdcdata.
  gs_bdcdata-program  = program.
  gs_bdcdata-dynpro   = dynpro.
  gs_bdcdata-dynbegin = 'X'.
  APPEND gs_bdcdata to gt_bdcdata.
ENDFORM.

*----------------------------------------------------------------------*
*        Insert field                                                  *
*----------------------------------------------------------------------*
FORM bdc_field USING fnam fval. "value'sunu alıyo
    CLEAR gs_bdcdata.
    gs_bdcdata-fnam = fnam.
    gs_bdcdata-fval = fval.
    APPEND gs_bdcdata to gt_bdcdata.
ENDFORM.
