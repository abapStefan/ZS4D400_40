CLASS zcl_40_05_wertzuwe_ausdruck DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_05_wertzuwe_ausdruck IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Lokale Typen deklarieren

    TYPES tv_percentage TYPE p LENGTH 3 DECIMALS 2.

    DATA: gv_percentage TYPE tv_percentage,          " auf den Lokalen Typ definieren

          gv_number1    TYPE i VALUE 17,                " mit Value 17 zugewiesen

          gv_number2    LIKE gv_number1,                " nur Typ I zugewiesen nicht den Wert

          gv_city       TYPE c LENGTH 15 VALUE 'Hannover', " lokal erstellter Typ mit Namen Hannover

          gv_carrid     TYPE /dmo/airport_id,            " auf globalem Datenelemnt erstellter Typ

          gv_number3    TYPE i VALUE 3 .               " Weiteren Typ mit zuweisung über Value

* Beispiel Abb. 138

    DATA: my_var1 TYPE string,
          my_var2 TYPE i,
          my_var3 LIKE my_var2,
          my_var4 TYPE p.


    my_var1 = `Hello World`.
    my_var2 = 17.
    my_var3 = my_var2.
    my_var4 = my_var2 + my_var3.


* zuordungsoperator

    gv_percentage = gv_number1 + gv_number3.    " Berechnung zweier Variablen

    out->write( 'Ergebnis:' && | | && gv_percentage ) .

    out->write( '-------------------------------------------------------------' ).

    out->write( my_var1 ).
    out->write( my_var2 ).
    out->write( my_var3 ).
    out->write( my_var4 ).



  ENDMETHOD.
ENDCLASS.
