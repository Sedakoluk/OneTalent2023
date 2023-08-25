*&---------------------------------------------------------------------*
*& Report zot_29_p_compare
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_compare.

*Karakter Karşılaştırma Operatörleri :
*
*CO   (v1 co v2)   :   v1 yalnızca v2 karakterlerinden oluşur.
*CN   (v1 cn v2)   :   v1, v2 de bulunmayan karakterlerden oluşur.
*CA   (v1 ca v2)   :   v1, v2 de bulunan herhangi bir karakter içeriyor.
*NA   (v1 na v2)   :   v1 ve v2′ nin hiçbir ortak karakteri yoktur.
*CS   (v1 cs v2)   :   v1, v2 stringini içerir.
*NS   (v1 ns v2)   :   v1, v2 stringini içermiyor.
*NP   (v1 np v2)   :   v1, v2 de ki deseni içermiyor.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p1 TYPE c LENGTH 6,
              p2 TYPE c LENGTH 6,
              p3 TYPE c LENGTH 6,
              p4 TYPE c LENGTH 6,
              p5 TYPE c LENGTH 6.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

TYPES: BEGIN OF gty_parametre,
         parametre TYPE char6,
       END OF gty_parametre.

DATA: gt_parametre TYPE TABLE OF gty_parametre,
      gs_parametre TYPE gty_parametre.

gt_parametre = value #( ( parametre = p1 )
                        ( parametre = p2 )
                        ( parametre = p3 )
                        ( parametre = p4 )
                        ( parametre = p5 ) ).

if p1 CO p2.
  WRiTE:/ P1, '-', P2.

elseIF p1 CO p3.
  write:/ P1, '-', P3.

elseif p1 CO p4.
  WRITE:/ P1, '-', P4.

ELSEIF p1 CO p5.
  WRITE:/ P1, '-', P5.
ENDIF.

IF p2 CO p3.
  WRITE:/ P2, '-', P3.
ELSEIF p2 CO p4.

  write:/ P2, '-', P4.
ELSEif p2 CO p5.
  WRITE:/ P2, '-', P5.
endif.

if p3 CO p4.
  write:/ P3, '-', P4.

ELSEIF p3 CO p5.

  Write:/ P3, '-', P5.
ENDIF.

IF p4 CO p5.
  WRITE:/ P4, '-', P5.
ENDIF.

LOOP AT gt_parametre INTO gs_parametre.

*write:/ cond #( when p1-parametre co p2-parametre then | { p1-parametre } - { p2-parametre } | ).

*    APPEND p1 TO gt_parametre.
ENDLOOP.


cl_demo_output=>display( ).
