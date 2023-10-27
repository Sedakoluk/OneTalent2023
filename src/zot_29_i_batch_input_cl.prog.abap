*&---------------------------------------------------------------------*
*& Include          ZOT_29_I_BATCH_INPUT_CL
*&---------------------------------------------------------------------*

CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS:
      get_instance
        RETURNING
          VALUE(ro_instance) TYPE REF TO lcl_main.

    METHODS: start_of_selection,

      bdc_dynpro IMPORTING program type bdc_prog
                           dynpro type bdc_dynr,

      bdc_field IMPORTING fnam type fnam_____4
                          fval type bdc_fval.

  PRIVATE SECTION.

    DATA: mt_bdcdata TYPE TABLE OF bdcdata,
          ms_bdcdata TYPE bdcdata,
          mt_messtab TYPE TABLE OF bdcmsgcoll.

    CLASS-DATA: mo_instance TYPE REF TO lcl_main.

ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD get_instance.
    IF mo_instance IS INITIAL.
      mo_instance = NEW #( ).
    ENDIF.
    ro_instance = mo_instance.
  ENDMETHOD.

  METHOD start_of_selection.

    CALL TRANSACTION 'MM01' WITH AUTHORITY-CHECK USING mt_bdcdata "performların eklendiği itab - MM01-tcode
       MODE 'N'   "A- tüm adımları göster  E-hataları göster  N-arka planda çalıştır bana gösterme
*     UPDATE cupdate "S- verilerin kaydedilmesini bekle  A- kaydedilmesini bekleme
       MESSAGES INTO mt_messtab. "işlem bittikten sonra mesajları logladığı itab

  ENDMETHOD.


  METHOD bdc_dynpro. "ekran numarasını alıyor

    CLEAR ms_bdcdata.
    ms_bdcdata-program  = program.
    ms_bdcdata-dynpro   = dynpro.
    ms_bdcdata-dynbegin = 'X'.
    APPEND ms_bdcdata TO mt_bdcdata.

  ENDMETHOD.


  METHOD bdc_field. "value'sunu alıyo

    CLEAR ms_bdcdata.
    ms_bdcdata-fnam = fnam.
    ms_bdcdata-fval = fval.
    APPEND ms_bdcdata TO mt_bdcdata.

  ENDMETHOD.
ENDCLASS.
