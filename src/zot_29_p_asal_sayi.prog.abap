*&---------------------------------------------------------------------*
*& Report zot_29_p_asal_sayi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_asal_sayi.

*PARAMETERS: p_sayi1 TYPE c LENGTH 5 OBLIGATORY,
*            p_sayi2 TYPE c LENGTH 5 OBLIGATORY.
*
*DATA: lv_count  TYPE i,
*      lv_count2 TYPE i.
*
*
*START-OF-SELECTION.
*
*  IF p_sayi1 > p_sayi2.
*    MESSAGE 'Girilen birinci sayi ikinci sayidan büyük olamaz' TYPE 'I' DISPLAY LIKE 'S'.
*
*  ELSE.
*
*    DO p_sayi1 TIMES.
*      lv_count += 1.
*      lv_count2 += 1.
*
*      cl_demo_output=>write( lv_count ).
*
*      IF p_sayi2 = lv_count2.
*        SKIP.
*        CLEAR lv_count2.
*      ENDIF.
*
*    ENDDO.
*
*  ENDIF.


DATA:
  "    lv_aufnr    TYPE aufnr,
      lv_aufart   TYPE aufart
      .

SELECT-OPTIONS:
 " s_aufnr       FOR lv_aufnr,
  s_aufart      FOR lv_aufart
  .

*AT SELECTION-SCREEN ON VALUE-REQUEST FOR s_aufnr-low.
*
*  PERFORM aufnr_f4 CHANGING s_aufnr-low.
*
*AT SELECTION-SCREEN ON VALUE-REQUEST FOR s_aufnr-high.
*
*  PERFORM aufnr_f4 CHANGING s_aufnr-high.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR s_aufart-low.

  PERFORM aufart_f4 CHANGING s_aufart-low.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR s_aufart-high.

  PERFORM aufart_f4 CHANGING s_aufart-high.

*FORM aufnr_f4
*  CHANGING
*    cv_aufnr TYPE aufnr.

*  DATA:
*        lv_value    TYPE help_info-fldvalue,
*        lt_return   TYPE STANDARD TABLE OF ddshretval
*        .
*
*    CALL FUNCTION 'F4IF_FIELD_VALUE_REQUEST'
*      exporting
*        TABNAME             = '<any>'     " Table/structure name from Dictionary
*        FIELDNAME           = '<any>'     " Field name from Dictionary
*        SEARCHHELP          = 'ORDE'      " Search help as screen field attribute
*        VALUE               = lv_value    " Field contents for F4 call
*      tables
*        RETURN_TAB          = lt_return   " Return the selected value
*      exceptions
*        FIELD_NOT_FOUND     = 1           " Field does not exist in the Dictionary
*        NO_HELP_FOR_FIELD   = 2           " No F4 help is defined for the field
*        INCONSISTENT_HELP   = 3           " F4 help for the field is inconsistent
*        NO_VALUES_FOUND     = 4           " No values found
*        OTHERS              = 5
*      .
*    IF sy-subrc NE 0.
*      RETURN.
*    ENDIF.
*    READ TABLE lt_return INTO DATA(ls_ret) INDEX 1.
*    cv_aufnr = ls_ret-fieldval.

*ENDFORM.

FORM aufart_f4
  CHANGING
    cv_aufart TYPE aufart.

    DATA:
        lt_values   TYPE STANDARD TABLE OF t003o,
        lt_return   TYPE STANDARD TABLE OF ddshretval
        .

  SELECT *                "#EC CI_NOWHERE
    FROM t003o
    INTO TABLE lt_values.

  IF sy-subrc NE 0.
    RETURN.
  ENDIF.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    exporting
      RETFIELD         = 'AUART'    " Name of field in VALUE_TAB
      VALUE_ORG        = 'S'        " Value return: C: cell by cell, S: structured
    tables
      VALUE_TAB        = lt_values  " Table of values: entries cell by cell
      RETURN_TAB       = lt_return  " Return the selected value
    exceptions
      PARAMETER_ERROR  = 1          " Incorrect parameter
      NO_VALUES_FOUND  = 2          " No values found
      OTHERS           = 3
    .

  IF sy-subrc NE 0.
    RETURN.
  ENDIF.

  read table lt_return INTO DATA(ls_return) INDEX 1.
  cv_aufart = ls_return-fieldval.

ENDFORM.
