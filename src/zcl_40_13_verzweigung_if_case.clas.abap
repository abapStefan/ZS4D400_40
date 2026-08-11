CLASS zcl_40_13_verzweigung_if_case DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_13_verzweigung_if_case IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: number1 TYPE i,
        number2 TYPE i,
         result TYPE i.

    number1 = 15.
    number2 = 15.

* IF Anweisung

    IF number1 > number2.
       out->write( |Zahl 1 ist größer| ).
    ELSEIF number1 < number2.
       out->write( |Zahl 2 ist größer| ).
    ELSE.
       out->write( |Beide Zahlen sind gleich| ).
    ENDIF.

    result = number1 + number2.

* Case Anweisung

    CASE result.

    WHEN 10.
    out->write( |Boh richtige 10 erwischt| ).
    WHEN 20.
    out->write( |Boh richtige 20 erwischt| ).
    WHEN 30.
    out->write( |Boh richtige 30 erwischt| ).
    WHEN OTHERS.
    out->write( |Das war nichts| ).

   ENDCASE.


  ENDMETHOD.
ENDCLASS.
