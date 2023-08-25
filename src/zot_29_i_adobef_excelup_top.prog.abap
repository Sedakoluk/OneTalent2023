*&---------------------------------------------------------------------*
*& Include          ZOT_29_I_ADOBEF_EXCELUP_CL
*&---------------------------------------------------------------------*
CLASS lcl_main DEFINITION.
  PUBLIC SECTION.

    METHODS: display_alv,
      get_data_alv,
      set_fcat,
      "start_of_selection,
      set_layout.

ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD display_alv.

CREATE OBJECT go_alv

      EXPORTING
        i_parent = cl_gui_container=>screen0. "alv'yi fullscreen basmak için

    CALL METHOD go_alv->set_table_for_first_display
      EXPORTING
        is_layout       = gs_layout      " Layout
      CHANGING
        it_outtab       = gt_alv         " internal Table adı yazmam lazım
        it_fieldcatalog = gt_fieldcatalog. " field katalog oluşturup internal table olarak buraya vereceğiz

  ENDMETHOD.


  METHOD get_data_alv.

    SELECT lp~kunnr,
           ls~vbeln,
           ls~posnr,
           ls~pstyv,
           ls~ernam,
           lp~wadat_ist,
           ls~mandt,
           ls~ntgew,
           ls~gewei FROM likp AS lp INNER JOIN lips AS ls
      ON lp~vbeln = ls~vbeln
      INTO CORRESPONDING FIELDS OF TABLE @gt_alv.

  ENDMETHOD.

  METHOD set_fcat.

    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'GT_ALV' "structure name / table alabildiği için kullandığım tablonun adını yazdım
*       I_INTERNAL_TABNAME     =  "internal table name
      CHANGING
        ct_fieldcat            = gt_fieldcatalog "fieldcatalog verilir.
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

  ENDMETHOD.

  METHOD set_layout.

    CLEAR: gs_layout.
    gs_layout-cwidth_opt = abap_true. "kolon optimizasyon
*gs_layout-edit = abap_true. "tüm kolonlar düzenlenebilir halde
*gs_layout-no_toolbar = abap_true. "toolbarı yok eden
    gs_layout-zebra = abap_true. "bir kotu renk bir açık renk - ounabilir olması için

  ENDMETHOD.

ENDCLASS.
