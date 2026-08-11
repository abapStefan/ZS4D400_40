CLASS zcl_40_07_variable_zurueck DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_07_variable_zurueck IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: my_var1 TYPE i,
          my_var2 TYPE i VALUE 4321,
          my_var3 TYPE string.

          my_var1 = my_var2.
          my_var3 = 'Hello               '.

          out->write( my_var1 && | | && my_var2 && | | && my_var3  ).

          CLEAR: my_var1,  " Wert wird auf 0 zurückgesetzt
                 my_var2,  " Wert wird auf 0 zurückgesetzt
                 my_var3.  " string hat leerer string bei c = Leerzeichen

          out->write( my_var1 && | | && my_var2 && | | && my_var3  ).







  ENDMETHOD.
ENDCLASS.
