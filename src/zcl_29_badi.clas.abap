class ZCL_29_BADI definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces IF_EX_LE_SHP_DELIVERY_PROC .
protected section.
private section.
ENDCLASS.



CLASS ZCL_29_BADI IMPLEMENTATION.


  METHOD if_ex_le_shp_delivery_proc~save_and_publish_before_output.

    IF sy-uname EQ 'OTSYAMAN'.
      BREAK otsyaman.
      READ TABLE it_xlikp INTO DATA(ls_route) INDEX 1.

      IF sy-subrc = 0.
        IF ls_route-route IS INITIAL.

          MESSAGE e012(zot_29).

        ENDIF.
      ENDIF.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
