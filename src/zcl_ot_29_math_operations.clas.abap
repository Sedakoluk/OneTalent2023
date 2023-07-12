CLASS zcl_ot_29_math_operations DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION. " her yerden erişim

    METHODS hesapla
      IMPORTING iv_sayi1    TYPE i
                iv_sayi2    TYPE i
                iv_operator TYPE c
      EXPORTING ev_sonuc    TYPE i.

  PROTECTED SECTION. "kısıtlı erişim
  PRIVATE SECTION. "yetki bazında erişim
ENDCLASS.



CLASS zcl_ot_29_math_operations IMPLEMENTATION.

  METHOD hesapla. "oluşturulan methodu çağırdık.

    CASE iv_operator.
      WHEN '+'.
        ev_sonuc = iv_sayi1 + iv_sayi2.
      WHEN '-'.
        ev_sonuc = iv_sayi1 - iv_sayi2.
      WHEN '*'.
        ev_sonuc = iv_sayi1 * iv_sayi2.
      WHEN '/'.
        ev_sonuc = iv_sayi1 / iv_sayi2.
    ENDCASE.

  ENDMETHOD.

ENDCLASS.
