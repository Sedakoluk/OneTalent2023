*&---------------------------------------------------------------------*
*& Report zot_29_p_internal_tables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_internal_tables.

*madde 1
DATA: gs_materia TYPE zot_00_t_materia,
      gt_materia TYPE TABLE OF zot_00_t_materia.

SELECT * FROM zot_00_t_materia  "zot_00_t_materia tablosundan verileri çektim.
INTO TABLE gt_materia.

*cl_demo_output=>write( lt_materia ).
*cl_demo_output=>display(  ).

" madde 2
DATA lt_material_s TYPE SORTED TABLE OF zot_00_t_materia WITH UNIQUE KEY matkl. " sorted internal tablo oluşturdum

lt_material_s = VALUE #( BASE lt_material_s  ( matnr = 000000000000000011
                                      maktx = 'Hard Disk'
                                      matkl = 'C'
                                      menge = 4
                                      meins = 'ST'
                                    )
                                    ( matnr = 000000000000000012
                                      maktx = 'Mouse'
                                      matkl = 'C'
                                      menge = 9
                                      meins = 'ST'
                                    )
                                    ( matnr = 000000000000000013
                                      maktx = 'Ethernet Kablo'
                                      matkl = 'C'
                                      menge = 2
                                      meins = 'ST'
                                    )
                                    ( matnr = 000000000000000014
                                      maktx = 'Klavye'
                                      matkl = 'C'
                                      menge = 6
                                      meins = 'ST'
                                    )
                                   (  matnr = 000000000000000015
                                      maktx = 'Hoparlör'
                                      matkl = 'C'
                                      menge = 1
                                      meins = 'ST'
                                      ) ).

cl_demo_output=>display( lt_material_s ).

"madde 3
"malzeme grubu c olan ile ölçü birimi uyuşuyorsa menge ye 10 ekleme

LOOP AT gt_materia INTO gs_materia.
  READ TABLE gt_materia INTO gs_materia WITH KEY meins = gs_materia-meins.
  IF sy-subrc EQ 0.
    gs_materia-menge += 10.
    MODIFY gt_materia FROM gs_materia.
  ENDIF.
ENDLOOP.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"madde 4
" gt_materia + lt_material_s

DATA: lt_materia_join TYPE TABLE OF zot_00_t_materia. "3. internal tablo, birleştime yapmak için


"madde 5
"menge alanlarının toplamını tutan itab
TYPES: BEGIN OF lty_materia_collect,
         matkl TYPE matkl,
         menge TYPE menge_d,
       END OF lty_materia_collect.

DATA: lt_materia_collect TYPE TABLE OF lty_materia_collect.
DATA: ls_materia_collect TYPE lty_materia_collect.

LOOP AT gt_materia INTO DATA(ls_menge).
  ls_materia_collect = VALUE #( matkl = ls_menge-matkl
                              menge = ls_menge-menge ).

  COLLECT ls_materia_collect INTO lt_materia_collect.
  CLEAR ls_materia_collect.
ENDLOOP.


"madde 6
" menge 10'dan küçük olanları silme'

DELETE gt_materia WHERE menge < 10.

"madde 7
"sıralama

SORT gt_materia BY menge ASCENDING. "menge alanı küçükten büyüğe

SORT lt_materia_collect BY menge DESCENDING. "malzeme gruplarını topladığı listeyi büyükten küçüğe

cl_demo_output=>display( gt_materia ).
cl_demo_output=>display( lt_materia_collect ).
