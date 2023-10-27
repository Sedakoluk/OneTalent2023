class ZOT_29_CL_OOP definition
  public
  final
  create public .

public section.

  data IV_MATNR type MCHA-MATNR .
  constants C_WERKS type MCHA-WERKS value 1710 ##NO_TEXT.

  methods DISPLAY_ALV .
  methods CONSTRUCTOR
    importing
      value(V_MATNR) type MCHA-MATNR .
  methods SEARCH_HELP .
protected section.
private section.

  methods FETCH_DATA
    importing
      value(MATNR) type MCHA-MATNR
      value(WERKS) type MCHA-WERKS
    returning
      value(GT_RETURN) type ZOT_29_TT_OOP .
ENDCLASS.



CLASS ZOT_29_CL_OOP IMPLEMENTATION.


  method CONSTRUCTOR.

    iv_matnr = v_matnr.

  endmethod.


  METHOD display_alv.

    DATA: mt_alv TYPE REF TO cl_salv_table.

    DATA(lt_data) = fetch_data( matnr = iv_matnr werks = c_werks ).

    CALL METHOD cl_salv_table=>factory
      IMPORTING
        r_salv_table = mt_alv
      CHANGING
        t_table      = lt_data.

    mt_alv->set_screen_popup(
    start_column = 1
    end_column   = 100
    start_line   = 1
    end_line     = 20 ).

*--Display
    mt_alv->display( ).

  ENDMETHOD.


  METHOD fetch_data.

    SELECT matnr,
      werks,
      charg FROM mcha
      INTO CORRESPONDING FIELDS OF TABLE @gt_return
      WHERE matnr = @matnr
        AND werks = @werks.

  ENDMETHOD.


  method SEARCH_HELP.

DATA: lt_mcha TYPE TABLE OF mcha.

DATA: lt_search_help TYPE TABLE OF ddshretval, "search help için
      ls_search_help TYPE ddshretval.

   SELECT * FROM mcha
    INTO CORRESPONDING FIELDS OF TABLE @lt_mcha. "search helpe verileri çekmek için

      CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield    = 'MATNR'
      value_org   = 'S'
      dynpprog    = sy-repid
      dynpnr      = sy-dynnr
      dynprofield = 'P_MALZM'
    TABLES
      value_tab   = lt_mcha
      return_tab  = lt_search_help.

READ TABLE lt_search_help INTO ls_search_help INDEX 1. "searhhelp'den gelen kaydı okuyorum

  endmethod.
ENDCLASS.
