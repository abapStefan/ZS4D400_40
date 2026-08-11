CLASS zcl_40_16_schleifen_do_while DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_16_schleifen_do_while IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* DO Schleife mit angegebener Zahl von Iterationen

*  DO 50 TIMES.
*
*   out->write( sy-index ).
*
*  ENDDO.


* DO Schleife mit Abruch einer logischen bedingung

*    DO.
*
*      IF sy-index = 5.
*        EXIT.
*      ENDIF.
*
*      out->write( sy-index ).
*
*    ENDDO.

* WHILE Schleife

    DATA sek TYPE i.
    sek = 10.
    WHILE sek > 3.
      out->write( sek ).
      sek = sek - 1.        " geht auch sek -= 1.
    ENDWHILE.

  ENDMETHOD.
ENDCLASS.
