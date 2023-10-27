*&---------------------------------------------------------------------*
*& Report ZOT_29_P_OOP_DENEME
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_oop_deneme.

CLASS lcl_main DEFINITION DEFERRED.
DATA go_main TYPE REF TO lcl_main."classı kullanabilmek için classın tipinde bir obje oluştrudum

DATA: gv_sum TYPE int4. "export parametresi için
DATA: gv_chancing TYPE int4. "chancing parametresi için

PARAMETERS: p_num1 TYPE int4,
            p_num2 TYPE int4.

CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    METHODS:
      sum_importing IMPORTING iv_num1 TYPE int4
                              iv_num2 TYPE int4 "2 tane değişkeni dışardan alayım exporting olarak da toplamış sayıların değişkenini vereyim
                    EXPORTING ev_sum  TYPE int4, "export parametrem varsa bunu dışarıda da kullanacağım anlamına gelir, globalde değişken oluştrurum

      sub_chancing IMPORTING iv_num1 TYPE int4
                   CHANGING  cv_num2 TYPE int4,

      sum_returning IMPORTING iv_num1       TYPE int4
                              iv_num2       TYPE int4
                    RETURNING VALUE(rv_sum) TYPE int4.
ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD sum_importing.

    ev_sum = iv_num1 + iv_num2.

  ENDMETHOD.

  METHOD sub_chancing.

    cv_num2 = iv_num1 - cv_num2.

  ENDMETHOD.

  METHOD sum_returning.

    rv_sum = iv_num1 + iv_num2.

  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

  CREATE OBJECT go_main. "objeyi kullanabilmek için

  go_main->sum_importing(
    EXPORTING
      iv_num1 = p_num1
      iv_num2 = p_num2
    IMPORTING
      ev_sum  = gv_sum
  ).
  WRITE :/ 'Toplam V2 = ', gv_sum.

  gv_chancing = p_num2.
  go_main->sub_chancing(
    EXPORTING
      iv_num1 = p_num1
    CHANGING
      cv_num2 = gv_chancing
  ).
  WRITE :/ 'Chancing = ', gv_chancing.

*  go_main->sum_returning(
*    EXPORTING
*      iv_num1 = p_num1
*      iv_num2 = p_num2
*    RECEIVING
*      rv_sum  = gv_sum
*  ).
*  WRITE :/ 'Returning = ', gv_sum.

  "returning value alternatif ve cool olan yöntem;
  gv_sum = go_main->sum_returning(
             iv_num1 = p_num1
             iv_num2 = p_num2 ).
  WRITE :/ 'Returning = ', gv_sum.
