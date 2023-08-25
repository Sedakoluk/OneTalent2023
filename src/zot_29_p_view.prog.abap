*&---------------------------------------------------------------------*
*& Report ZOT_29_P_VIEW
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_view.

"oluşturduğum database view tipinde internal table oluşturuyorum.
DATA: gt_dview TYPE TABLE OF zot_29_view,
      go_salv  TYPE REF TO cl_salv_table. "salv de kullanacağım objeyi oluşturdum

START-OF-SELECTION.

  SELECT * UP TO 50 ROWS FROM zot_29_view  "select ile internal table'ı doldurdum.
    INTO TABLE gt_dview.

  cl_salv_table=>factory(
    IMPORTING
      r_salv_table   = go_salv            " burada oluşturmuş olduğum salv objesi olmalı
    CHANGING
      t_table        = gt_dview           " internal table yazılır
  ).

  go_salv->display( ).                    " salv objesinin display methodunu çağır dedim
