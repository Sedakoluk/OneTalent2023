*&---------------------------------------------------------------------*
*& Report ZOT_29_P_DENEME
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOT_29_P_DENEME.

DATA : go_gbt       TYPE REF TO cl_gbt_multirelated_service,
       go_bcs       TYPE REF TO cl_bcs,
       go_doc_bcs   TYPE REF TO cl_document_bcs,
       go_recipient TYPE REF TO if_recipient_bcs,
       gt_soli      TYPE TABLE OF soli,
       gs_soli      TYPE soli,
       gv_status    TYPE bcs_rqst,
       gv_content   TYPE string.

DATA : gt_scarr TYPE TABLE OF scarr.

DATA : gv_attachment_size    TYPE sood-objdblen,
       gt_att_content_hex    TYPE solix_tab,
       gv_attachment_content TYPE string,
       gv_att_line           TYPE string.

SELECT * FROM scarr
         INTO TABLE gt_scarr.

START-OF-SELECTION.

  go_gbt = NEW #( ).

  gv_content =  '<!DOCTYPE html>                          '
            &&  '<html>                                   '
            &&  '<head>                                   '
            &&  '  <meta charset="utf-8">                 '
            &&  '    <style>                              '
            &&  '     th { background-color: lightgreen;  '
            &&  '          border: 2px solid; }           '
            &&  '     td { background-color: lightblue;   '
            &&  '          border: 1px solid; }           '
            &&  '    </style>                             '
            &&  '    </head>                              '
            &&  '    <body>                               '
            &&  '    <table>                             '
            &&  '        <tr>                             '
            &&  '           <th>Havayolu Tanım</th>       '
            &&  '           <th>Havayolu Adı</th>         '
            &&  '           <th>Havayolu Para Birimi</th> '
            &&  '           <th>Havayolu URL</th>         '
            &&  '         </tr>                           '.


  LOOP AT gt_scarr INTO DATA(ls_scarr).

    gv_content = gv_content &&  '  <tr>                                      '
                            &&  '   <td>' && ls_scarr-carrid &&   '</td>     '
                            &&  '   <td>' && ls_scarr-carrname && '</td>     '
                            &&  '   <td>' && ls_scarr-currcode && '</td>     '
                            &&  '   <td>' && ls_scarr-url &&      '</td>     '
                            &&  ' </tr>                                      '.
  ENDLOOP.

  gv_content = gv_content && ' </table>                                      '
                          && ' </body>                                       '
                          && ' </html>                                       '.

  gt_soli = cl_document_bcs=>string_to_soli( gv_content ).

  go_gbt->set_main_html( gt_soli ).

  go_doc_bcs = cl_document_bcs=>create_from_multirelated(
    i_subject          = 'Test Maili Başlığı'
    i_multirel_service = go_gbt ).


  LOOP AT gt_scarr INTO DATA(ls_scarr2).
    CONCATENATE ls_scarr2-carrid
                ls_scarr2-carrname
                ls_scarr2-currcode
                ls_scarr2-url
                INTO gv_att_line
                SEPARATED BY cl_abap_char_utilities=>horizontal_tab.
    IF sy-tabix EQ 1.
      gv_attachment_content = gv_att_line.
    ELSE.
      CONCATENATE gv_attachment_content
                  gv_att_line
              INTO gv_attachment_content
              SEPARATED BY cl_abap_char_utilities=>newline.
    ENDIF.

  ENDLOOP.

  cl_bcs_convert=>string_to_solix(
    EXPORTING
      iv_string   = gv_attachment_content
      iv_codepage = '4103'
      iv_add_bom  = abap_true
    IMPORTING
      et_solix    = gt_att_content_hex
      ev_size     = gv_attachment_size ).


  go_doc_bcs->add_attachment(
    EXPORTING
      i_attachment_type    = 'xls'
      i_attachment_subject = 'attachment_name'
      i_attachment_size    = gv_attachment_size
      i_att_content_hex    = gt_att_content_hex ).

  go_recipient = cl_cam_address_bcs=>create_internet_address(
    i_address_string = 'test@nttdata.com' ).

  go_bcs = cl_bcs=>create_persistent( ).
  go_bcs->set_document( i_document = go_doc_bcs ).
  go_bcs->add_recipient( i_recipient  = go_recipient ).

  gv_status = 'N'.

  go_bcs->set_status_attributes( i_requested_status = gv_status ).

  TRY.
      go_bcs->send( ).
      COMMIT WORK.
      MESSAGE 'Başarılı' TYPE 'S'.
    CATCH cx_bcs INTO DATA(lx_bcs).
      ROLLBACK WORK.
  ENDTRY.
