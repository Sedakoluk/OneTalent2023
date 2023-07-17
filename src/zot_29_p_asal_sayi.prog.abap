*&---------------------------------------------------------------------*
*& Report zot_29_p_asal_sayi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_asal_sayi.

PARAMETERS: p_sayi1 TYPE c LENGTH 5 OBLIGATORY,
            p_sayi2 TYPE c LENGTH 5 OBLIGATORY.

DATA: lv_count  TYPE i,
      lv_count2 TYPE i.


START-OF-SELECTION.

  IF p_sayi1 > p_sayi2.
    MESSAGE 'Girilen birinci sayi ikinci sayidan büyük olamaz' TYPE 'I' DISPLAY LIKE 'S'.

  ELSE.

    DO p_sayi1 TIMES.
      lv_count += 1.
      lv_count2 += 1.

      cl_demo_output=>write( lv_count ).

      IF p_sayi2 = lv_count2.
        SKIP.
        CLEAR lv_count2.
      ENDIF.

    ENDDO.

  ENDIF.
