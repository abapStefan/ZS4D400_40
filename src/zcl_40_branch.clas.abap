CLASS zcl_40_branch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_branch IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA number1 TYPE i.
    DATA number2 TYPE i.

    DATA result TYPE p LENGTH 8 DECIMALS 2.

    DATA op TYPE c LENGTH 1.

    DATA output TYPE string.

* Eingabewerte

    number1 = 12.
    number2 =  7.
    op      = '+'.

* Berechnung

    CASE op.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '*'.
        result = number1 * number2.
      WHEN '/'.

        TRY.
            result = number1 / number2.
          CATCH cx_sy_zerodivide.
            output = |Division durch Null ist nicht erlaubt|.

        ENDTRY.

      WHEN OTHERS.

        output = |' { op } ' ist kein gültige Operator|.

    ENDCASE.

    IF output IS INITIAL. " Bisher kein Fehler
      output = |{ number1 } { op } { number2 } = { result COUNTRY = 'DE ' }|.
    ENDIF.


* Ausgabe

    out->write( output ).

  ENDMETHOD.
ENDCLASS.
