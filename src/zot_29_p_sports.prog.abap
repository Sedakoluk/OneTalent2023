*&---------------------------------------------------------------------*
*& Report zot_29_p_sports
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_sports.
DATA: gv_random LIKE qf00-ran_int.
TYPES: BEGIN OF gty_sports,
         id        TYPE c LENGTH 10,
         takim_adi TYPE  c LENGTH 15,
         ulke_adi  TYPE c LENGTH 5,
         torba     TYPE c LENGTH 1,
       END OF gty_sports.

DATA: gs_sports TYPE gty_sports,
      gt_sports TYPE TABLE OF gty_sports.

TYPES : BEGIN OF gty_grup,
          takim_ad TYPE c LENGTH 15,
        END OF gty_grup.

DATA: gt_agrup TYPE TABLE OF gty_grup,
      gt_bgrup TYPE TABLE OF gty_grup,
      gt_cgrup TYPE TABLE OF gty_grup,
      gt_dgrup TYPE TABLE OF gty_grup,
      gt_final TYPE TABLE OF gty_grup,
      gs_final TYPE gty_grup.

gt_sports = VALUE #( BASE gt_sports ( id = 1
                                      takim_adi = 'Liverpol'
                                      ulke_adi = 'EN'
                                      torba = 1
                                      )
                                      ( id = 2
                                      takim_adi = 'Bayern Münih'
                                      ulke_adi = 'DE'
                                      torba = 1
                                      )
                                      ( id = 3
                                      takim_adi = 'Inter'
                                      ulke_adi = 'IT'
                                      torba = 1
                                      )
                                      ( id = 4
                                      takim_adi = 'PSG'
                                      ulke_adi = 'FR'
                                      torba = 1
                                       )
                                      ( id = 5
                                      takim_adi = 'Machester City'
                                      ulke_adi = 'EN'
                                      torba = 2
                                      )
                                      ( id = 6
                                      takim_adi = 'PSV'
                                      ulke_adi = 'NE'
                                      torba = 2
                                       )
                                       ( id = 7
                                      takim_adi = 'Porto'
                                      ulke_adi = 'PO'
                                      torba = 2
                                       )
                                       ( id = 8
                                      takim_adi = 'Real Madrid'
                                      ulke_adi = 'ES'
                                      torba = 2
                                       )
                                       ( id = 9
                                      takim_adi = 'Dortmund'
                                      ulke_adi = 'DE'
                                      torba = 3
                                       )
                                       ( id = 10
                                      takim_adi = 'Galatasaray'
                                      ulke_adi = 'TR'
                                      torba = 3
                                       )
                                       ( id = 11
                                      takim_adi = 'Marsilya'
                                      ulke_adi = 'FR'
                                      torba = 3
                                       )
                                       ( id = 12
                                      takim_adi = 'Ajax'
                                      ulke_adi = 'NL'
                                      torba = 3
                                       )
                                       ( id = 13
                                      takim_adi = 'Aek'
                                      ulke_adi = 'GR'
                                      torba = 4
                                       )
                                       ( id = 14
                                      takim_adi = 'Roma'
                                      ulke_adi = 'IT'
                                      torba = 4
                                       )
                                       ( id = 15
                                      takim_adi = 'Stabükreş'
                                      ulke_adi = 'RO'
                                      torba = 4
                                       )
                                       ( id = 16
                                      takim_adi = 'Atletico Madrid'
                                      ulke_adi = 'ES'
                                      torba = 4
                                       ) ).


DATA(lv_count)  = 16.

LOOP AT gt_sports INTO DATA(ls_db).

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_count - 1
      ran_int_min   = 1
    IMPORTING
      ran_int       = gv_random
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.

  READ TABLE gt_sports INTO DATA(ls_read) WITH KEY id = gv_random.
  IF sy-subrc = 0.

    IF ls_read-ulke_adi NE ls_db-ulke_adi.
      IF ls_read-torba NE ls_db-torba.
        if lines( gt_agrup ) < 4.
        APPEND ls_read-takim_adi TO gt_agrup.
        DELETE gt_sports WHERE id  = ls_read-id.
       endif.
      ENDIF.
    ENDIF.
  ENDIF.
ENDLOOP.


LOOP AT gt_sports INTO DATA(ls_db2).

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_count - 1
      ran_int_min   = 1
    IMPORTING
      ran_int       = gv_random
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.

  READ TABLE gt_sports INTO DATA(ls_read2) WITH KEY id = gv_random.
  IF sy-subrc = 0.
    if sy-index MOD 4 = 0.
    IF ls_read2-ulke_adi NE ls_db2-ulke_adi.
      IF ls_read2-torba NE ls_db2-torba.
        if lines( gt_bgrup ) < 4.
        APPEND ls_read2-takim_adi TO gt_bgrup.
        DELETE gt_sports WHERE id  = ls_read2-id.
       endif.
      ENDIF.
    ENDIF.
  ENDIF.
  endif.
ENDLOOP.


LOOP AT gt_sports INTO DATA(ls_db3).

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_count - 1
      ran_int_min   = 1
    IMPORTING
      ran_int       = gv_random
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.

  READ TABLE gt_sports INTO DATA(ls_read3) WITH KEY id = gv_random.
  IF sy-subrc = 0.
    if sy-index MOD 4 = 0.
    IF ls_read3-ulke_adi NE ls_db3-ulke_adi.
      IF ls_read3-torba NE ls_db3-torba.
        if lines( gt_cgrup ) < 4.
        APPEND ls_read3-takim_adi TO gt_cgrup.
        DELETE gt_sports WHERE id  = ls_read3-id.
       endif.
      ENDIF.
    ENDIF.
  ENDIF.
  endif.
ENDLOOP.

LOOP AT gt_sports INTO DATA(ls_db4).

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_count - 1
      ran_int_min   = 1
    IMPORTING
      ran_int       = gv_random
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.

  READ TABLE gt_sports INTO DATA(ls_read4) WITH KEY id = gv_random.
  IF sy-subrc = 0.
    if sy-index MOD 4 = 0.
    IF ls_read4-ulke_adi NE ls_db4-ulke_adi.
      IF ls_read4-torba NE ls_db4-torba.
        if lines( gt_dgrup ) < 4.
        APPEND ls_read4-takim_adi TO gt_dgrup.
        DELETE gt_sports WHERE id  = ls_read4-id.
       endif.
      ENDIF.
    ENDIF.
  ENDIF.
  endif.
ENDLOOP.


cl_demo_output=>write( gt_agrup ).
cl_demo_output=>write( gt_bgrup ).
cl_demo_output=>write( gt_cgrup ).
cl_demo_output=>write( gt_dgrup ).
cl_demo_output=>display(  ).
