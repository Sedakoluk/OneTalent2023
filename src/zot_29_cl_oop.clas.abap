class ZOT_29_CL_OOP definition
  public
  final
  create public .

public section.

  data GV_MATNR type MCHA-MATNR .
  constants GV_WERKS type MCHA-WERKS value 1710 ##NO_TEXT.

  methods DISPLAY_ALV .
  methods CONSTRUCTOR
    importing
      value(V_MATNR) type MCHA-MATNR .
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

    gv_matnr = v_matnr.

  endmethod.


  METHOD display_alv.

    DATA: mt_alv TYPE REF TO cl_salv_table.

    DATA(gt_data) = fetch_data( matnr = gv_matnr werks = gv_werks ).

    CALL METHOD cl_salv_table=>factory
      IMPORTING
        r_salv_table = mt_alv
      CHANGING
        t_table      = gt_data.

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
ENDCLASS.
