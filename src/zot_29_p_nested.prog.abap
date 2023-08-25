*&---------------------------------------------------------------------*
*& Report zot_29_p_nested
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_nested.



DATA(lt_ogr) = VALUE zot_29_tt_ogr_not( (   ogrenci_id    = 1
                                            ogrenci_adi   = 'Ayşe'
                                            d_tarihi      = '03.05.1990'
                                            bolumu        = 'Tarih'
                                            notlar        = VALUE zot_29_s_sinif(
                                                sinif1    = VALUE zot_29_s_ders(
                                                    ders1 = VALUE zot_29_s_not(
                                                            vize1     = 60
                                                            vize2     = 20
                                                            finald    = 30
                                                            butunleme = 50
                                                            )
                                            )
                                          )
) ) .

cl_demo_output=>display( lt_ogr ).
