CLASS zcl_40_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA output TYPE TABLE OF string.      " Aufgabe 2

    CONSTANTS max_count TYPE i VALUE 20.

    DATA numbers TYPE TABLE OF i.

    DO max_count TIMES.

      CASE sy-index.

        WHEN 1.
          APPEND 0 TO numbers.
        WHEN 2.
          APPEND 1 TO numbers.

        WHEN OTHERS.     " Die ersten beiden Zahlen sind gesetzt, jetzt die Berechnung

          APPEND numbers[ sy-index - 2 ]
               + numbers[ sy-index - 1 ]
             TO numbers.
      ENDCASE.

    ENDDO.

     DATA(counter) = 0.  " Aufgabe 2.3
     LOOP AT numbers INTO DATA(number).    " Mit inline Deklaration

*      counter = counter + 1
      counter += 1.

      APPEND |{ counter WIDTH = 4 } : { number WIDTH = 10 ALIGN = RIGHT }| TO output.

    ENDLOOP.

    out->write( data = output name = |Die ersten { max_count } Fibonaccci Zahlen| ).

  ENDMETHOD.
ENDCLASS.
