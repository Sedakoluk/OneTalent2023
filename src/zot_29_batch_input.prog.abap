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

  go_class = lcl_main=>get_instance( ).

START-OF-SELECTION.

  go_class->start_of_selection( ).

  CALL METHOD go_class->bdc_dynpro
    EXPORTING
      program = 'SAPLMGMM'
      dynpro  = '0060'.
  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'BDC_CURSOR'
      fval = 'RMMG1-MTART'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'BDC_OKCODE'
      fval = '=ENTR'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'RMMG1-MBRSH'
      fval = 'O'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'RMMG1-MTART'
      fval = 'EPA'.

  CALL METHOD go_class->bdc_dynpro
    EXPORTING
      program = 'SAPLMGMM'
      dynpro  = '0070'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'BDC_CURSOR'
      fval = 'MSICHTAUSW-DYTXT(01)'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'BDC_OKCODE'
      fval = '=ENTR'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'MSICHTAUSW-KZSEL(01)'
      fval = 'X'.

  CALL METHOD go_class->bdc_dynpro
    EXPORTING
      program = 'SAPLMGMM'
      dynpro  = '4004'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'BDC_OKCODE'
      fval = '/00'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'MAKT-MAKTX'
      fval = CONV bdc_fval( p_maktx ).

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'MARA-MEINS'
      fval = 'ADT'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'MARA-MTPOS_MARA'
      fval = 'VERP'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'BDC_CURSOR'
      fval = 'MARA-GEWEI'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'MARA-BRGEW'
      fval = '50'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'MARA-GEWEI'
      fval = 'KG'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'MARA-NTGEW'
      fval = '30'.

  CALL METHOD go_class->bdc_dynpro
    EXPORTING
      program = 'SAPLSPO1'
      dynpro  = '0300'.

  CALL METHOD go_class->bdc_field
    EXPORTING
      fnam = 'BDC_OKCODE'
      fval = '=YES'.
