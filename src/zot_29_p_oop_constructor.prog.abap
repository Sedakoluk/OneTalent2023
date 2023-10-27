*&---------------------------------------------------------------------*
*& Report ZOT_29_P_OOP_CONSTRUCTOR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_oop_constructor.

CLASS lcl_main DEFINITION DEFERRED.
DATA: go_main TYPE REF TO lcl_main.

PARAMETERS: p_num1 TYPE i,
            p_num2 TYPE i.

CLASS lcl_main DEFINITION.

  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_num1 TYPE i
                                   iv_num2 TYPE i,
      sum_numbers.

    DATA: mv_num1 TYPE i,
          mv_num2 TYPE i,
          mv_sum  TYPE i.

ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD constructor.
    mv_num1 = iv_num1.
    mv_num2 = iv_num2.
  ENDMETHOD.

  METHOD sum_numbers.

    mv_sum = mv_num1 + mv_num2.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  CREATE OBJECT go_main
    EXPORTING
      iv_num1 = p_num1
      iv_num2 = p_num2.

  go_main->sum_numbers( ).
  WRITE :/ 'Toplam = ', go_main->mv_sum.
