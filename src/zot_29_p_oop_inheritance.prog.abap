*&---------------------------------------------------------------------*
*& Report ZOT_29_P_OOP_INHERITANCE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_oop_inheritance.

CLASS lcl_cat DEFINITION DEFERRED.

DATA: go_cat TYPE REF TO lcl_cat.

CLASS lcl_animal DEFINITION.
  PUBLIC SECTION.
    METHODS:
      get_number_of_legs RETURNING VALUE(rv_legs) TYPE i,
      get_number_of_arms RETURNING VALUE(rv_arms) TYPE i.

    DATA: mv_legs TYPE i,
          mv_arms TYPE i.

ENDCLASS.

CLASS lcl_animal IMPLEMENTATION.

  METHOD get_number_of_legs.

    rv_legs = mv_legs.

  ENDMETHOD.

  METHOD get_number_of_arms.

    rv_arms = mv_arms.

  ENDMETHOD.


ENDCLASS.

*lcl_cat classı lcl_animal classının alt clası oldu.
CLASS lcl_cat DEFINITION INHERITING FROM lcl_animal.    "üst clasımı miras al diye belirtmem gerekiyo inheriting from ile
  PUBLIC SECTION.
    METHODS:
      set_arms_and_legs IMPORTING iv_arms TYPE i
                                  iv_legs TYPE i.

ENDCLASS.

CLASS lcl_cat IMPLEMENTATION.

  METHOD set_arms_and_legs.

    mv_legs = iv_legs.
    mv_arms = iv_arms.

  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

  CREATE OBJECT go_cat.

  go_cat->set_arms_and_legs(
    EXPORTING
      iv_arms = 0
      iv_legs = 4
  ).

  WRITE : / 'Cat arms ' , go_cat->get_number_of_arms( ) , ' and legs ' , go_cat->get_number_of_legs( ).
